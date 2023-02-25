package com.bcyportfolio.shopping.vos.board;

import com.bcyportfolio.shopping.dtos.BoardDto;
import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.enums.board.DeleteResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class DeleteVo implements IResult<DeleteResult> {
    private final int articleId;

    private BoardDto board;
    private UserDto user;
    private DeleteResult result;



    public DeleteVo(int articleId) {
        this.articleId = articleId;
    }



    public int getArticleId() {
        return articleId;
    }

    public BoardDto getBoard() {
        return board;
    }

    public void setBoard(BoardDto boardDto) {
        this.board = boardDto;
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
