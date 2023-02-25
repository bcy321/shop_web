package com.bcyportfolio.shopping.controllers;

import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;

@Controller
@RequestMapping(value = "/")
@SessionAttributes(UserDto.MODEL_NAME)
public class RootController extends StandardController {
    private final ProductService productService;

    @Autowired
    public RootController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(
            value = "/",
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String indexGet(Model model) {
        ArrayList<Integer> itemIndexs = this.productService.mainByImages();
        model.addAttribute("itemIndex",itemIndexs);
        return "index";
    }

    @RequestMapping(
            value = "/about",
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String aboutGet() {
//        System.out.println("about");
        return "user/about";
    }
}