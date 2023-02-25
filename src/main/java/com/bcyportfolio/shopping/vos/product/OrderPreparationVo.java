package com.bcyportfolio.shopping.vos.product;

import com.bcyportfolio.shopping.dtos.ProductDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.product.OrderResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class OrderPreparationVo implements IResult<OrderResult> {
    private final int itemId;

    private OrderResult result;
    private UserDto user;
    private ProductDto product;
    private String[] colorOption;
    private String[] sizeOption;
    private int stock;

    public OrderPreparationVo(int itemId) {
        this.itemId = itemId;
    }

    public int getItemId() {
        return itemId;
    }

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public ProductDto getProduct() {
        return product;
    }

    public void setProduct(ProductDto product) {
        this.product = product;
    }

    public String[] getColorOption() {
        return colorOption;
    }

    public void setColorOption(String[] colorOption) {
        this.colorOption = colorOption;
    }

    public String[] getSizeOption() {
        return sizeOption;
    }

    public void setSizeOption(String[] sizeOption) {
        this.sizeOption = sizeOption;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public OrderResult getResult() {
        return this.result;
    }

    @Override
    public String getResultName() {
        return this.result.name();
    }

    @Override
    public void setResult(OrderResult orderResult) {
        this.result = orderResult;
    }
}
