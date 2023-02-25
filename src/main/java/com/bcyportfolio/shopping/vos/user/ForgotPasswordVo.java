package com.bcyportfolio.shopping.vos.user;


import com.bcyportfolio.shopping.enums.user.ForgotPasswordResult;
import com.bcyportfolio.shopping.interfaces.IResult;
import com.bcyportfolio.shopping.utils.CryptoUtil;

public class ForgotPasswordVo implements IResult<ForgotPasswordResult> {
    private final String authCode;
    private final String key;
    private final String password;
    private final String hashedPassword;

    private String ip;
    private ForgotPasswordResult result;

    public ForgotPasswordVo(String authCode, String key, String password) {
        this.authCode = authCode;
        this.key = key;
        this.password = password;
        this.hashedPassword = CryptoUtil.Sha512.hash(password, null);
    }

    public String getAuthCode() {
        return this.authCode;
    }

    public String getKey() {
        return this.key;
    }

    public String getPassword() {
        return this.password;
    }

    public String getHashedPassword() {
        return this.hashedPassword;
    }

    public String getIp() {
        return this.ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Override
    public ForgotPasswordResult getResult() {
        return this.result;
    }

    @Override
    public String getResultName() {
        return this.result.name();
    }

    @Override
    public void setResult(ForgotPasswordResult forgotPasswordResult) {
        this.result = forgotPasswordResult;
    }
}