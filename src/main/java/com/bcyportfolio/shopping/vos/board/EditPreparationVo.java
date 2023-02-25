package com.bcyportfolio.shopping.vos.board;

import com.bcyportfolio.shopping.dtos.ArticleDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.board.EditResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class EditPreparationVo implements IResult<EditResult> {
    private final int articleId;

    private UserDto user;
    private ArticleDto article;
    private EditResult result;




    public EditPreparationVo(int articleId) {
        this.articleId = articleId;
    }

    public int getArticleId() {
        return articleId;
    }


    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public ArticleDto getArticle() {
        return article;
    }

    public void setArticle(ArticleDto article) {
        this.article = article;
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
