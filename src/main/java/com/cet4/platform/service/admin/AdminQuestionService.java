package com.cet4.platform.service.admin;

import com.cet4.platform.dto.admin.AdminQuestionUpsertRequest;
import com.cet4.platform.vo.admin.AdminQuestionVO;

import java.util.Map;

public interface AdminQuestionService {
    AdminQuestionVO create(AdminQuestionUpsertRequest request);

    AdminQuestionVO update(Long id, AdminQuestionUpsertRequest request);

    void delete(Long id);

    Map<String, Object> page(Integer current, Integer size, String type, Integer year, Integer month);
}
