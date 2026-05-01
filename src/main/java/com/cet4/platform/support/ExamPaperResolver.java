package com.cet4.platform.support;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cet4.platform.common.BusinessException;
import com.cet4.platform.entity.Exam;
import com.cet4.platform.mapper.ExamMapper;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ExamPaperResolver {

    private final ExamMapper examMapper;

    public Long resolveExamIdByPaperId(String paperId) {
        try {
            return Long.parseLong(paperId);
        } catch (NumberFormatException ignored) {
            List<String> segments = List.of(paperId.split("-"));
            if (segments.size() != 3) {
                throw new BusinessException("paperId 格式不正确");
            }
            Integer year = parsePaperIdPart(segments.get(0), "year");
            Integer month = parsePaperIdPart(segments.get(1), "month");
            Integer setNo = parsePaperIdPart(segments.get(2), "setNo");
            Exam exam = examMapper.selectOne(new LambdaQueryWrapper<Exam>()
                    .eq(Exam::getYear, year)
                    .eq(Exam::getMonth, month)
                    .eq(Exam::getSetNo, setNo)
                    .last("limit 1"));
            if (exam == null) {
                throw new BusinessException("paperId 对应试卷不存在");
            }
            return exam.getId();
        }
    }

    private Integer parsePaperIdPart(String value, String partName) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ex) {
            throw new BusinessException("paperId 的 " + partName + " 部分不合法");
        }
    }
}
