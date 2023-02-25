package com.bcyportfolio.shopping.dtos;

import java.util.ArrayList;

public class ProductDto {
    private final int index;
    private final String CategoryCode;
    private final String name;
    private final int price;
    private final byte[] images;
    private final String content;

    private CategoryDto category;
    private ArrayList<OptionDto> options;

    public ProductDto(int index, String categoryCode, String name, int price, byte[] images, String content) {
        this.index = index;
        CategoryCode = categoryCode;
        this.name = name;
        this.price = price;
        this.images = images;
        this.content = content;
    }

    public int getIndex() {
        return index;
    }

    public String getCategoryCode() {
        return CategoryCode;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public byte[] getImages() {
        return images;
    }

    public String getContent() {
        return content;
    }

    public CategoryDto getCategory() {
        return category;
    }

    public void setCategory(CategoryDto category) {
        this.category = category;
    }

    public ArrayList<OptionDto> getOptions() {
        return options;
    }

    public void setOptions(ArrayList<OptionDto> options) {
        this.options = options;
    }
}
