package com.cet4.platform.domain;

import java.util.Set;

public final class QuestionTypes {

    public static final String SINGLE_CHOICE = "single_choice";
    public static final String BLANK_FILLING = "blank_filling";
    public static final String MATCHING = "matching";
    public static final String LISTENING = "listening";
    public static final String WRITING = "writing";
    public static final String TRANSLATION = "translation";
    public static final String READING_STAGE = "reading";

    public static final Set<String> OBJECTIVE_TYPES = Set.of(SINGLE_CHOICE, BLANK_FILLING, MATCHING);

    private QuestionTypes() {
    }

    public static boolean isSubjective(String questionType) {
        return WRITING.equalsIgnoreCase(questionType) || TRANSLATION.equalsIgnoreCase(questionType);
    }

    public static boolean isObjective(String questionType) {
        return questionType != null && OBJECTIVE_TYPES.contains(questionType);
    }
}
