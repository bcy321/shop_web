package com.bcyportfolio.shopping.vos.product;


import com.bcyportfolio.shopping.dtos.CategoryDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.product.AddResult;
import com.bcyportfolio.shopping.interfaces.IResult;
import org.springframework.web.multipart.MultipartFile;

public class AddVo implements IResult<AddResult> {
    private final String category;
    private final String name;
    private final int price;
    private final MultipartFile image;
    private final String content;
    private final String[] options;

    private UserDto user;
    private CategoryDto categoryDto;
    private AddResult result;

    public AddVo(String category, String name, int price, MultipartFile image, String content, String[] options) {
        this.category = category;
        this.name = name;
        this.price = price;
        this.image = image;
        this.content = content;
        this.options = options;
    }

    public String getCategory() {
        return category;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public MultipartFile getImage() {
        return image;
    }

    public String getContent() {
        return content;
    }

    public String[] getOptions() {
        return options;
    }

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public CategoryDto getCategoryDto() {
        return categoryDto;
    }

    public void setCategoryDto(CategoryDto categoryDto) {
        this.categoryDto = categoryDto;
    }

    @Override
    public AddResult getResult() {
        return this.result;
    }

    @Override
    public String getResultName() {
        return this.result.name();
    }

    @Override
    public void setResult(AddResult writeResult) {
        this.result = writeResult;
    }
}