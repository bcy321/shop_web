package com.bcyportfolio.shopping.vos.board;


import com.bcyportfolio.shopping.dtos.BoardDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.board.EditResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class EditVo implements IResult<EditResult> {
    private final String title;
    private final String content;

    private int articleId;
    private UserDto user;
    private BoardDto board;
    private EditResult result;

    public EditVo(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public String getTitle() {
        return this.title;
    }

    public String getContent() {
        return this.content;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public UserDto getUser() {
        return this.user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public BoardDto getBoard() {
        return this.board;
    }

    public void setBoard(BoardDto board) {
        this.board = board;
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
    public void setResult(EditResult editResult) {
        this.result = editResult;
    }
}