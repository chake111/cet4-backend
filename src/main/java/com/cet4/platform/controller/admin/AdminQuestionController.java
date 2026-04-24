package com.cet4.platform.controller.admin;

import com.cet4.platform.common.Result;
import com.cet4.platform.dto.admin.AdminQuestionUpsertRequest;
import com.cet4.platform.service.admin.AdminQuestionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/questions")
@RequiredArgsConstructor
public class AdminQuestionController {

    private final AdminQuestionService adminQuestionService;

    @PostMapping
    public Result<?> create(@Valid @RequestBody AdminQuestionUpsertRequest request) {
        return Result.success(adminQuestionService.create(request));
    }

    @PutMapping("/{id}")
    public Result<?> update(@PathVariable Long id, @Valid @RequestBody AdminQuestionUpsertRequest request) {
        return Result.success(adminQuestionService.update(id, request));
    }

    @DeleteMapping("/{id}")
    public Result<Void> delete(@PathVariable Long id) {
        adminQuestionService.delete(id);
        return Result.success("删除成功", null);
    }

    @GetMapping
    public Result<?> page(@RequestParam(defaultValue = "1") Integer current,
                          @RequestParam(defaultValue = "10") Integer size,
                          @RequestParam(required = false) String type,
                          @RequestParam(required = false) Integer year,
                          @RequestParam(required = false) Integer month) {
        return Result.success(adminQuestionService.page(current, size, type, year, month));
    }
}
