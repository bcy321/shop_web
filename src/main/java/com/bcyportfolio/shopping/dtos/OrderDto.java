package com.bcyportfolio.shopping.dtos;

public class OrderDto {
    private static class Format {
        public static final String TIMESTAMP = "yyyy-MM-dd HH:mm";
    }
    private final String categoryId;
    private final String itemName;
    private final String colorOption;
    private final int stock;
    private final int price;

    public OrderDto(String categoryId, String itemName, String colorOption, int stock, int price) {
        this.categoryId = categoryId;
        this.itemName = itemName;
        this.colorOption = colorOption;
        this.stock = stock;
        this.price = price;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public String getItemName() {
        return itemName;
    }

    public String getColorOption() {
        return colorOption;
    }

    public int getStock() {
        return stock;
    }

    public int getPrice() {
        return price;
    }
}
