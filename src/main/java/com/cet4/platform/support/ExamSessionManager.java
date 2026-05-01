package com.cet4.platform.support;

import com.cet4.platform.common.BusinessException;
import com.cet4.platform.domain.QuestionTypes;
import com.cet4.platform.dto.ExamDraftSaveRequest;
import com.cet4.platform.dto.ExamStartRequest;
import com.cet4.platform.entity.Question;
import com.cet4.platform.entity.User;
import com.cet4.platform.vo.QuestionVO;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@RequiredArgsConstructor
public class ExamSessionManager {

    private final ExamPaperResolver examPaperResolver;
    private final ExamQuerySupport examQuerySupport;
    private final ExamCacheStore examCacheStore;

    public Map<String, Object> startExamSession(ExamStartRequest request, User user) {
        Long examId = examPaperResolver.resolveExamIdByPaperId(request.getPaperId());
        List<Question> questions = examQuerySupport.listQuestions(examId);
        if (questions.isEmpty()) {
            throw new BusinessException("试卷未配置题目");
        }

        Map<String, List<QuestionVO>> questionsByStage = questions.stream()
                .map(ExamViewMapper::toQuestionVO)
                .collect(Collectors.groupingBy(
                        questionVO -> mapStageKey(questionVO.getPart()),
                        LinkedHashMap::new,
                        Collectors.toList()));

        LocalDateTime startedAt = LocalDateTime.now();
        examCacheStore.startSession(user.getId(), request.getPaperId(), startedAt);
        log.info("考试开始: userId={}, examId={}, paperId={}", user.getId(), examId, request.getPaperId());

        Map<String, Object> result = new HashMap<>();
        result.put("paperId", request.getPaperId());
        result.put("questionsByStage", questionsByStage);
        result.put("startedAt", startedAt);
        return result;
    }

    public Map<String, Boolean> saveExamDraft(ExamDraftSaveRequest request, User user) {
        Map<String, String> draft = examCacheStore.readDraft(user.getId(), request.getPaperId());
        String mapKey = request.getStage() + ":" + request.getQuestionId();
        draft.put(mapKey, request.getAnswer());
        examCacheStore.saveDraft(user.getId(), request.getPaperId(), draft);
        log.info("考试草稿已保存: userId={}, paperId={}, stage={}, questionId={}",
                user.getId(), request.getPaperId(), request.getStage(), request.getQuestionId());

        return Map.of("success", true);
    }

    private String mapStageKey(String part) {
        if (part != null && part.startsWith("reading")) {
            return QuestionTypes.READING_STAGE;
        }
        return part;
    }
}
