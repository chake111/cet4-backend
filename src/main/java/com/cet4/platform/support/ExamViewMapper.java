package com.cet4.platform.support;

import com.cet4.platform.entity.Exam;
import com.cet4.platform.entity.Question;
import com.cet4.platform.vo.ExamVO;
import com.cet4.platform.vo.QuestionVO;
import org.springframework.beans.BeanUtils;

public final class ExamViewMapper {

    private ExamViewMapper() {
    }

    public static ExamVO toExamVO(Exam exam) {
        ExamVO examVO = new ExamVO();
        BeanUtils.copyProperties(exam, examVO);
        return examVO;
    }

    public static QuestionVO toQuestionVO(Question question) {
        QuestionVO questionVO = new QuestionVO();
        BeanUtils.copyProperties(question, questionVO);
        return questionVO;
    }
}
