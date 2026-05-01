package com.cet4.platform.support;

import com.cet4.platform.common.BusinessException;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.mapper.ExamRecordMapper;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ExamRecordAccessSupport {

    private final ExamRecordMapper examRecordMapper;

    public ExamRecord getAndValidateExamRecord(Long recordId, Long userId) {
        ExamRecord examRecord = examRecordMapper.selectById(recordId);
        if (examRecord == null) {
            throw new BusinessException("考试记录不存在");
        }
        if (!Objects.equals(examRecord.getUserId(), userId)) {
            throw new AccessDeniedException("无权访问该考试记录");
        }
        return examRecord;
    }
}
