package com.bcyportfolio.shopping.vos.product;


import com.bcyportfolio.shopping.dtos.CategoryDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.product.DeleteResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class DeleteVo implements IResult<DeleteResult> {
    private final int itemId;

    private CategoryDto category;
    private UserDto user;
    private DeleteResult result;

    public DeleteVo(int itemId) {
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

    @Override
    public DeleteResult getResult() {
        return this.result;
    }

    @Override
    public String getResultName() {
        return this.result.name();
    }

    @Override
    public void setResult(DeleteResult deleteResult) {
        this.result = deleteResult;
    }
}
