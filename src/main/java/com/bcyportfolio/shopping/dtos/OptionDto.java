package com.bcyportfolio.shopping.dtos;

public class OptionDto {
    private final int index;
    private final int itemIndex;
    private final String colorOption;
    private final String sizeOption;
    private final int stock;

    public OptionDto(int index, int itemId, String colorOption, String sizeOption, int stock) {
        this.index = index;
        this.itemIndex = itemId;
        this.colorOption = colorOption;
        this.sizeOption = sizeOption;
        this.stock = stock;
    }

    public int getIndex() {
        return index;
    }

    public int getItemId() {
        return itemIndex;
    }

    public String getColorOption() {
        return colorOption;
    }

    public String getSizeOption() {
        return sizeOption;
    }

    public int getStock() {
        return stock;
    }
}
