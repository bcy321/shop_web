package com.bcyportfolio.shopping.controllers;


import com.bcyportfolio.shopping.dtos.CategoryDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.product.AddResult;
import com.bcyportfolio.shopping.enums.product.EditResult;
import com.bcyportfolio.shopping.enums.product.OrderResult;
import com.bcyportfolio.shopping.services.ProductService;
import com.bcyportfolio.shopping.vos.product.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;


@Controller
@RequestMapping(value = "/product/")
@SessionAttributes(UserDto.MODEL_NAME)
public class ProductController extends StandardController {
    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(
            value = {"/list/{iid}", "/list/{iid}/{page}"},
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String listGet(
            Model model,
            @PathVariable("iid") String itemId,
            @PathVariable("page") Optional<Integer> optionalPage,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
        int page = optionalPage.orElse(1);
        ListVo listVo = new ListVo(itemId, page);
        listVo.setUser(user);
        listVo.setCategory(this.productService.getCategory(itemId));
        this.productService.getProducts(listVo);
        model.addAttribute("vo", listVo);
        return "product/list";
    }

    @RequestMapping(
            value = {"/search/{cid}", "/search/{cid}/{page}"},
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String searchGet(
            Model model,
            @RequestParam("criteria") String criteria,
            @RequestParam("keyword") String keyword,
            @PathVariable("cid") String categoryId,
            @PathVariable("page") Optional<Integer> optionalPage,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
        int page = optionalPage.orElse(1);
        SearchVo searchVo = new SearchVo(categoryId, page, criteria, keyword);
        searchVo.setUser(user);
        searchVo.setCategory(this.productService.getCategory(categoryId));
        this.productService.searchProducts(searchVo);
        model.addAttribute("vo", searchVo);
        return "product/search";
    }

    @RequestMapping(
            value = "/add/{cid}",
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String addGet(
            HttpServletResponse response,
            Model model,
            @PathVariable("cid") String categoryId,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
        CategoryDto category = this.productService.getCategory(categoryId);
        if (category == null || !ProductService.isAllowedToWrite(user)) {
            response.setStatus(404);
            return null;
        }
        return "product/add";
    }

    @RequestMapping(
            value = "/add/{cid}",
            method = RequestMethod.POST,
            produces = MediaType.TEXT_HTML_VALUE)
    public String addPost(
            HttpServletResponse response,
            AddVo addVo,
            Model model,
            @PathVariable("cid") String categoryId,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) throws IOException {
//        System.out.println(categoryId);
        addVo.setCategoryDto(this.productService.getCategory(categoryId));
        addVo.setUser(user);
        this.productService.addProduct(addVo);
        model.addAttribute("vo", addVo);
        if (addVo.getResult() == AddResult.OKAY) {
            return "redirect:/product/list/" + categoryId;
        } else {
            return "product/add";
        }
    }

    @RequestMapping(
            value = "/read/{iid}",
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String readGet(
            Model model,
            @PathVariable("iid") int itemId,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
        ReadVo vo = new ReadVo(itemId);
        vo.setUser(user);
        this.productService.read(vo);
        model.addAttribute("vo", vo);
        return "product/read";
    }

    @RequestMapping(
            value = "/get-file/{iid}",
            method = RequestMethod.GET)
    public ResponseEntity<byte[]> getFileGet(@PathVariable("iid") int itemId) {
        ReadVo vo = new ReadVo(itemId);
        this.productService.read(vo);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<byte[]>(vo.getProduct().getImages(), headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/delete/{iid}")
    public String deleteGet(
            Model model,
            @PathVariable("iid") int itemId,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
        DeleteVo vo = new DeleteVo(itemId);
        vo.setUser(user);
        this.productService.deleteProduct(vo);
        model.addAttribute("vo", vo);
        return "product/delete";
    }

    @RequestMapping(
            value = "/edit/{iid}",
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String editGet(
            Model model,
            @PathVariable("iid") int itemId,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
        EditPreparationVo vo = new EditPreparationVo(itemId);
        vo.setUser(user);
        this.productService.prepareEditing(vo);
        model.addAttribute("vo", vo);
        return "product/edit";
    }

    @RequestMapping(
            value = "/edit/{iid}",
            method = RequestMethod.POST,
            produces = MediaType.TEXT_HTML_VALUE)
    public String editPost(
            Model model,
            EditVo editVo,
            @PathVariable("iid") int itemId,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) throws IOException {
        editVo.setItemId(itemId);
        editVo.setUser(user);
        this.productService.editProduct(editVo);
        if (editVo.getResult() == EditResult.OKAY) {
            return "redirect:/product/read/" + editVo.getItemId();
        } else {
            model.addAttribute("vo", editVo);
            return "product/edit";
        }
    }

    @RequestMapping(
            value = "/order/{iid}",
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String orderGet(
            Model model,
            HttpServletResponse response,
            @PathVariable("iid") int itemId,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
//        System.out.println(itemId);
        OrderPreparationVo vo = new OrderPreparationVo(itemId);
        vo.setUser(user);
        if (vo.getResult() == OrderResult.FAILURE || user == null) {
            response.setStatus(404);
            return null;
        }
        this.productService.PrepareOrder(vo);
        model.addAttribute("vo", vo);
        return "product/order";
    }


    @RequestMapping(
            value = "/order/{iid}",
            method = RequestMethod.POST,
            produces = MediaType.TEXT_HTML_VALUE)
    public String orderPost(
            Model model,
            @PathVariable("iid") int itemId,
            OrderVo vo,
            HttpServletResponse response,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
        System.out.println(itemId);
        vo.setItemId(itemId);
//        System.out.println("vo : " + vo.get());
        vo.setUser(user);
        this.productService.order(vo);
        if (vo.getResult() == OrderResult.FAILURE || user == null) {
            response.setStatus(404);
            return null;
        }
        model.addAttribute("vo", vo);
        return "product/order";
    }

    @RequestMapping(
            value = "/order-list",
            method = RequestMethod.GET,
            produces = MediaType.TEXT_HTML_VALUE)
    public String orderListGet(
            Model model,
            HttpServletResponse response,
            OrderListVo vo,
            @ModelAttribute(UserDto.MODEL_NAME) UserDto user) {
//        System.out.println(itemId);
        vo.setUser(user);
        this.productService.orderList(vo);
        model.addAttribute("vo", vo);
        return "product/order-list";
    }
}