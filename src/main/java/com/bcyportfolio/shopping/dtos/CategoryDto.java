package com.bcyportfolio.shopping.dtos;

public class CategoryDto {
    private final int index;
    private final String code;
    private final String name;
    private final String content;

    public CategoryDto(int index, String code, String name, String content) {
        this.index = index;
        this.code = code;
        this.name = name;
        this.content = content;
    }

    public int getIndex() {
        return index;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getContent() {
        return content;
    }
}
