package com.cet4.platform.controller;

import com.cet4.platform.common.Result;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/exam")
public class ExamController {

    @GetMapping
    public Result<?> getExam() {
        return Result.success("exam endpoint ok");
    }

    @PostMapping
    public Result<?> createExam() {
        return Result.success("exam endpoint ok");
    }
}
