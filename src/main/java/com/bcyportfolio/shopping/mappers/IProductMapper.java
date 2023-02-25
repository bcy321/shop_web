package com.bcyportfolio.shopping.mappers;

import com.bcyportfolio.shopping.dtos.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface IProductMapper {
    void deleteProduct(@Param("iid") int itemIndex);

    ProductDto selectProduct(
            @Param("iid") int itemIndex);

    ArrayList<ProductDto> selectProducts(
            @Param("cid") String cid,
            @Param("offset") int offset,
            @Param("limit") int limit);

    ArrayList<CategoryDto> selectCategories();

    ArrayList<OptionDto> selectOptions(@Param("iid") int itemIndex);

    CategoryDto selectCategory(@Param("id") String id);

    CategoryDto selectCategoryByProduct(@Param("iid") int itemIndex);

    int selectProductCount(@Param("cid") String categoryId);
    int selectProductCountByName(
            @Param("cid") String cid,
            @Param("keyword") String keyword);

    int selectProductCountByContent(
            @Param("cid") String cid,
            @Param("keyword") String keyword);

    ArrayList<ProductDto> selectProductsByName(
            @Param("cid") String cid,
            @Param("offset") int offset,
            @Param("limit") int limit,
            @Param("keyword") String keyword);

    ArrayList<ProductDto> selectProductsByContent(
            @Param("cid") String cid,
            @Param("offset") int offset,
            @Param("limit") int limit,
            @Param("keyword") String keyword);


    void insertProduct(
            @Param("cid") String cid,
            @Param("name") String name,
            @Param("price") int price,
            @Param("image") byte[] image,
            @Param("content") String content);

    void insertOption(
            @Param("iid") int itemId,
            @Param("colorOption") String colorOption,
            @Param("sizeOption") String sizeOption,
            @Param("stock") int stock);


    void updateProduct(
            @Param("iid") int itemId,
            @Param("categoryCode") String CategoryCode,
            @Param("name") String name,
            @Param("price") int price,
            @Param("image") byte[] image,
            @Param("content") String content);

    int selectLastInsertId();

    void deleteProductOption(@Param("iid") int itemIndex);

    int selectOptionColorCount(
            @Param("iid") int itemId,
            @Param("colorOption") String colorOption);

    OptionDto selectOptionColor(
            @Param("iid") int itemId,
            @Param("colorOption") String colorOption);

    int selectOptionSizeCount(
            @Param("iid") int itemId,
            @Param("colorOption") String colorOption,
            @Param("sizeOption") String sizeOption);


    void insertOrder(
            @Param("iid") int itemId,
            @Param("userEmail") String userEmail,
            @Param("colorOption") String colorOption,
            @Param("sizeOption") String sizeOption,
            @Param("stock") int stock,
            @Param("addressPost") String addressPost,
            @Param("addressPrimary") String addressPrimary,
            @Param("addressSecond") String addressSecond,
            @Param("content") String content);

    int selectOptionStock(
            @Param("iid") int itemId,
            @Param("colorOption") String colorOption,
            @Param("sizeOption") String sizeOption);

    void updateOptionStock(
            @Param("iid") int itemId,
            @Param("colorOption") String colorOption,
            @Param("sizeOption") String sizeOption,
            @Param("stock") int stock);

    ArrayList<OrderDto> selectOrderList(@Param("email") String email);

    ArrayList<Integer> selectMainByImages();

}
