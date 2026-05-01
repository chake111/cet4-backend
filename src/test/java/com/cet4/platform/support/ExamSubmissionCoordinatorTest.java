package com.cet4.platform.support;

import com.cet4.platform.common.BusinessException;
import com.cet4.platform.dto.ExamSubmitRequest;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.entity.Question;
import com.cet4.platform.entity.User;
import com.cet4.platform.mapper.ExamRecordMapper;
import com.cet4.platform.mapper.QuestionMapper;
import com.cet4.platform.mapper.UserAnswerMapper;
import com.cet4.platform.support.ExamScoringSupport.ScoringResult;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ExamSubmissionCoordinatorTest {

    @Mock
    private ExamPaperResolver examPaperResolver;
    @Mock
    private ExamRecordAccessSupport examRecordAccessSupport;
    @Mock
    private ExamQuerySupport examQuerySupport;
    @Mock
    private ExamCacheStore examCacheStore;
    @Mock
    private ExamScoringSupport examScoringSupport;
    @Mock
    private ExamSubmissionWriter examSubmissionWriter;
    @Mock
    private ExamRecordMapper examRecordMapper;
    @Mock
    private QuestionMapper questionMapper;
    @Mock
    private UserAnswerMapper userAnswerMapper;

    private ExamSubmissionCoordinator coordinator;

    @BeforeEach
    void setUp() {
        coordinator = new ExamSubmissionCoordinator(
                examPaperResolver,
                examRecordAccessSupport,
                examQuerySupport,
                examCacheStore,
                examScoringSupport,
                examSubmissionWriter,
                examRecordMapper,
                questionMapper,
                userAnswerMapper);
    }

    @Test
    void duplicateSubmitDoesNotScoreOrWrite() {
        ExamSubmitRequest request = submitRequest();
        User user = user();
        when(examPaperResolver.resolveExamIdByPaperId("2025-6-1")).thenReturn(2L);
        when(examCacheStore.acquireSubmitLock(1L, 2L)).thenReturn(null);

        assertThrows(BusinessException.class, () -> coordinator.submitExamSession(request, user));

        verify(examScoringSupport, never()).score(any(), any());
        verify(examSubmissionWriter, never()).saveSubmittedSession(any(), any(), any(), any(), any(), any(), any(), any());
    }

    @Test
    void successfulSubmitClearsSessionAndReturnsRecordId() {
        ExamSubmitRequest request = submitRequest();
        User user = user();
        Question question = new Question();
        question.setId(10L);
        question.setScore(5);
        question.setQuestionType("single_choice");
        ScoringResult scoringResult = new ScoringResult();
        ExamRecord savedRecord = new ExamRecord();
        savedRecord.setId(99L);

        when(examPaperResolver.resolveExamIdByPaperId("2025-6-1")).thenReturn(2L);
        when(examCacheStore.acquireSubmitLock(1L, 2L)).thenReturn("lock-token");
        when(examQuerySupport.listQuestions(2L)).thenReturn(List.of(question));
        when(examScoringSupport.score(request.getAnswers(), List.of(question))).thenReturn(scoringResult);
        when(examCacheStore.readStartedAt(eq(1L), any(LocalDateTime.class))).thenReturn(LocalDateTime.now());
        when(examSubmissionWriter.saveSubmittedSession(
                eq(user), eq(2L), eq("2025-6-1"), any(LocalDateTime.class), any(LocalDateTime.class),
                eq(request.getAnswers()), eq(List.of(question)), eq(scoringResult)))
                .thenReturn(savedRecord);

        Map<String, Object> result = coordinator.submitExamSession(request, user);

        assertEquals(99L, result.get("recordId"));
        verify(examCacheStore).clearSession(1L, "2025-6-1");
        verify(examCacheStore, never()).releaseSubmitLock(1L, 2L, "lock-token");
    }

    private ExamSubmitRequest submitRequest() {
        ExamSubmitRequest request = new ExamSubmitRequest();
        request.setPaperId("2025-6-1");
        request.setAnswers(Map.of("10", "A"));
        return request;
    }

    private User user() {
        User user = new User();
        user.setId(1L);
        user.setUsername("alice");
        return user;
    }
}
