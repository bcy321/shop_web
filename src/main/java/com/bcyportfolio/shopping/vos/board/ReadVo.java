package com.bcyportfolio.shopping.vos.board;

import com.bcyportfolio.shopping.dtos.ArticleDto;
import com.bcyportfolio.shopping.dtos.BoardDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.board.ReadResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class ReadVo implements IResult<ReadResult> {
    private final int articleId;

    private BoardDto board;
    private UserDto user;
    private ReadResult result;
    private ArticleDto article;


    public ReadVo(int articleId) {
        this.articleId = articleId;
    }

    public int getArticleId() {
        return articleId;
    }

    public BoardDto getBoard() {
        return board;
    }

    public void setBoard(BoardDto board) {
        this.board = board;
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
