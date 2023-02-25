package com.bcyportfolio.shopping.vos.product;

import com.bcyportfolio.shopping.dtos.OrderDto;
import com.bcyportfolio.shopping.dtos.UserDto;

import java.util.ArrayList;

public class OrderListVo {
    private UserDto user;
    private ArrayList<OrderDto> orders;

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public ArrayList<OrderDto> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<OrderDto> orders) {
        this.orders = orders;
    }
}
