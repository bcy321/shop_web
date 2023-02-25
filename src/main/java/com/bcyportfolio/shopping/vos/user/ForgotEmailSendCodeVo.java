package com.bcyportfolio.shopping.vos.user;


import com.bcyportfolio.shopping.enums.user.ForgotEmailSendCodeResult;
import com.bcyportfolio.shopping.interfaces.IResult;

public class ForgotEmailSendCodeVo implements IResult<ForgotEmailSendCodeResult> {
    private final String nameFirst;
    private final String nameOptional;
    private final String nameLast;
    private final String contactFirst;
    private final String contactSecond;
    private final String contactThird;

    private String key;
    private String ip;
    private String authCode;
    private ForgotEmailSendCodeResult result;

    public ForgotEmailSendCodeVo(String nameFirst, String nameOptional, String nameLast, String contactFirst, String contactSecond, String contactThird) {
        this.nameFirst = nameFirst;
        this.nameOptional = nameOptional;
        this.nameLast = nameLast;
        this.contactFirst = contactFirst;
        this.contactSecond = contactSecond;
        this.contactThird = contactThird;
    }

    public String getNameFirst() {
        return this.nameFirst;
    }

    public String getNameOptional() {
        return this.nameOptional;
    }

    public String getNameLast() {
        return this.nameLast;
    }

    public String getContactFirst() {
        return this.contactFirst;
    }

    public String getContactSecond() {
        return this.contactSecond;
    }

    public String getContactThird() {
        return this.contactThird;
    }

    public String getKey() {
        return this.key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getIp() {
        return this.ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }

    @Override
    public ForgotEmailSendCodeResult getResult() {
        return this.result;
    }

    @Override
    public String getResultName() {
        return this.result.name();
    }

    @Override
    public void setResult(ForgotEmailSendCodeResult forgotEmailSendCodeResult) {
        this.result = forgotEmailSendCodeResult;
    }
}