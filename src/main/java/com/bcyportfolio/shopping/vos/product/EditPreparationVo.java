package com.bcyportfolio.shopping.vos.product;


import com.bcyportfolio.shopping.dtos.ProductDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.product.EditResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class EditPreparationVo implements IResult<EditResult> {
    private final int itemId;
    private UserDto user;
    private ProductDto product;
    private EditResult result;

    public EditPreparationVo(int itemId) {
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

    @Override
    public EditResult getResult() {
        return this.result;
    }

    @Override
    public String getResultName() {
        return this.result.name();
    }

    @Override
    public void setResult(EditResult deleteResult) {
        this.result = deleteResult;
    }
}
