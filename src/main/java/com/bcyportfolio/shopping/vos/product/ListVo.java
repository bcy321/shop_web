package com.bcyportfolio.shopping.vos.product;



import com.bcyportfolio.shopping.dtos.CategoryDto;
import com.bcyportfolio.shopping.dtos.ProductDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.product.ListResult;
import com.bcyportfolio.shopping.interfaces.IResult;

import java.util.ArrayList;

public class ListVo implements IResult<ListResult> {
    private final String categoryId;
    private final int page;

    private UserDto user;
    private CategoryDto category;
    private ArrayList<ProductDto> products;
    private ListResult result;

    private int leftPage;
    private int rightPage;
    private int maxPage;

    public ListVo(String categoryId, int page) {
        this.categoryId = categoryId;
        this.page = page;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public int getPage() {
        return page;
    }

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public CategoryDto getCategory() {
        return category;
    }

    public void setCategory(CategoryDto category) {
        this.category = category;
    }

    public ArrayList<ProductDto> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<ProductDto> products) {
        this.products = products;
    }

    public int getLeftPage() {
        return leftPage;
    }

    public void setLeftPage(int leftPage) {
        this.leftPage = leftPage;
    }

    public int getRightPage() {
        return rightPage;
    }

    public void setRightPage(int rightPage) {
        this.rightPage = rightPage;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    @Override
    public ListResult getResult() {
        return this.result;
    }

    @Override
    public String getResultName() {
        return this.result.name();
    }

    @Override
    public void setResult(ListResult listResult) {
        this.result = listResult;
    }
}