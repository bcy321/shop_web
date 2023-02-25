package com.bcyportfolio.shopping.vos.board;

import com.bcyportfolio.shopping.dtos.UserDto;

public class CommentVo {
    private final String content;
    private UserDto user;
    private int articleId;

    public CommentVo(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }
}
