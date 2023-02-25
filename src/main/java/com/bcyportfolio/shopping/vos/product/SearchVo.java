package com.bcyportfolio.shopping.vos.product;

public class SearchVo extends ListVo {
    private final String criteria;
    private final String keyword;

    public SearchVo(String boardId, int page, String criteria, String keyword) {
        super(boardId, page);
        this.criteria = criteria;
        this.keyword = keyword;
    }

    public String getCriteria() {
        return criteria;
    }

    public String getKeyword() {
        return keyword;
    }
}
