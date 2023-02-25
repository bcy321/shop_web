package com.bcyportfolio.shopping.vos.product;


import com.bcyportfolio.shopping.dtos.CategoryDto;
import com.bcyportfolio.shopping.dtos.ProductDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.product.ReadResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class ReadVo implements IResult<ReadResult> {
    private final int itemId;

    private CategoryDto category;
    private UserDto user;
    private ProductDto product;
    private ReadResult result;


    public ReadVo(int itemId) {
        this.itemId = itemId;
    }



    public int getItemId() {
        return itemId;
    }

    public CategoryDto getCategory() {
        return category;
    }

    public void setCategory(CategoryDto category) {
        this.category = category;
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
    public ReadResult getResult() {
        return this.result;
    }

    @Override
    public String getResultName() {
        return this.result.name();
    }

    @Override
    public void setResult(ReadResult readResult) {
        this.result = readResult;
    }
}
