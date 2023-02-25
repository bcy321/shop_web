package com.bcyportfolio.shopping.controllers;


import com.bcyportfolio.shopping.dtos.UserDto;
import org.springframework.web.bind.annotation.ModelAttribute;

public abstract class StandardController {
    @ModelAttribute(UserDto.MODEL_NAME)
    protected final UserDto userDto() {
        return null;
    }
}