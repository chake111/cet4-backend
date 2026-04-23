package com.cet4.platform.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cet4.platform.common.BusinessException;
import com.cet4.platform.entity.Exam;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.entity.Question;
import com.cet4.platform.entity.User;
import com.cet4.platform.mapper.ExamMapper;
import com.cet4.platform.mapper.ExamRecordMapper;
import com.cet4.platform.mapper.QuestionMapper;
import com.cet4.platform.mapper.UserMapper;
import com.cet4.platform.service.ExamService;
import com.cet4.platform.vo.ExamVO;
import com.cet4.platform.vo.QuestionVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ExamServiceImpl implements ExamService {

    private static final String IN_PROGRESS = "in_progress";

    private final ExamMapper examMapper;
    private final QuestionMapper questionMapper;
    private final ExamRecordMapper examRecordMapper;
    private final UserMapper userMapper;

    @Override
    public List<ExamVO> listPublishedExams() {
        List<Exam> exams = examMapper.selectList(new LambdaQueryWrapper<Exam>()
                .eq(Exam::getStatus, 1)
                .orderByDesc(Exam::getYear)
                .orderByDesc(Exam::getMonth)
                .orderByDesc(Exam::getSetNo));

        return exams.stream().map(exam -> {
            ExamVO examVO = new ExamVO();
            BeanUtils.copyProperties(exam, examVO);
            return examVO;
        }).toList();
    }

    @Override
    public List<QuestionVO> listExamQuestions(Long examId) {
        List<Question> questions = questionMapper.selectList(new LambdaQueryWrapper<Question>()
                .eq(Question::getExamId, examId)
                .orderByAsc(Question::getSortOrder));

        return questions.stream().map(question -> {
            QuestionVO questionVO = new QuestionVO();
            BeanUtils.copyProperties(question, questionVO);
            return questionVO;
        }).toList();
    }

    @Override
    public Map<String, Long> startExam(Long examId, String username) {
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, username)
                .last("limit 1"));

        if (user == null) {
            throw new BusinessException("用户不存在");
        }

        ExamRecord existing = examRecordMapper.selectOne(new LambdaQueryWrapper<ExamRecord>()
                .eq(ExamRecord::getUserId, user.getId())
                .eq(ExamRecord::getExamId, examId)
                .eq(ExamRecord::getStatus, IN_PROGRESS)
                .orderByDesc(ExamRecord::getId)
                .last("limit 1"));

        Long examRecordId;
        if (existing != null) {
            examRecordId = existing.getId();
        } else {
            ExamRecord examRecord = new ExamRecord();
            examRecord.setUserId(user.getId());
            examRecord.setExamId(examId);
            examRecord.setStatus(IN_PROGRESS);
            examRecord.setStartTime(LocalDateTime.now());
            examRecordMapper.insert(examRecord);
            examRecordId = examRecord.getId();
        }

        Map<String, Long> result = new HashMap<>();
        result.put("examRecordId", examRecordId);
        return result;
    }
}
