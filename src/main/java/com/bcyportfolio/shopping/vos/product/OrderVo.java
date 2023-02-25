package com.bcyportfolio.shopping.vos.product;

import com.bcyportfolio.shopping.dtos.OrderDto;
import com.bcyportfolio.shopping.dtos.ProductDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.product.OrderResult;
import com.bcyportfolio.shopping.interfaces.IResult;

import java.util.ArrayList;
import java.util.Date;

public class OrderVo implements IResult<OrderResult> {

    private final String userEmail;
    private final String content;
    private final Date timestamp;
    private final String formattedTimestamp;
    private final String colorOption;
    private final String sizeOption;
    private final int stock;
    private final String addressPost;
    private final String addressPrimary;
    private final String addressSecondary;

    private  int itemId;
    private UserDto user;
    private ProductDto product;
    private ArrayList<OrderDto> orders;
    private OrderResult result;

    public OrderVo(String userEmail, String content, Date timestamp, String formattedTimestamp, String colorOption, String sizeOption, int stock, String addressPost, String addressPrimary, String addressSecondary) {
        this.userEmail = userEmail;
        this.content = content;
        this.timestamp = timestamp;
        this.formattedTimestamp = formattedTimestamp;
        this.colorOption = colorOption;
        this.sizeOption = sizeOption;
        this.stock = stock;
        this.addressPost = addressPost;
        this.addressPrimary = addressPrimary;
        this.addressSecondary = addressSecondary;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getContent() {
        return content;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public String getFormattedTimestamp() {
        return formattedTimestamp;
    }

    public ArrayList<OrderDto> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<OrderDto> orders) {
        this.orders = orders;
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

    public String getAddressPost() {
        return addressPost;
    }

    public String getAddressPrimary() {
        return addressPrimary;
    }

    public String getAddressSecondary() {
        return addressSecondary;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
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
