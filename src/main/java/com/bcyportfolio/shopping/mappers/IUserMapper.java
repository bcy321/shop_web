package com.bcyportfolio.shopping.mappers;


import com.bcyportfolio.shopping.dtos.UserDto;
import com.bcyportfolio.shopping.vos.user.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IUserMapper {
    void updateAutoSingKeyExtended(
            @Param("key") String key,
            @Param("days") int days);

    void updateAutoSignKeyExpired(
            @Param("key") String key);

    int selectEmailCount(
            @Param("email") String email);

    int selectNicknameCount(
            @Param("nickname") String nickname);

    int selectContactCount(
            @Param("contactFirst") String contactFirst,
            @Param("contactSecond") String contactSecond,
            @Param("contactThird") String contactThird);

    void insertUser(RegisterVo registerVo);

    UserDto selectUser(LoginVo loginVo);

    UserDto selectUserFromCookie(
            @Param("key") String key);

    void insertAutoSignKey(
            @Param("email") String email,
            @Param("key") String key,
            @Param("days") int days);

    void updateUser(ModifyVo modifyVo);

    String selectEmail(ForgotEmailSendCodeVo forgotEmailSendCodeVo);

    void insertForgotEmailAuthCode(
            @Param("key") String key,
            @Param("ip") String ip,
            @Param("email") String email,
            @Param("code") String code,
            @Param("minutes") int minutes);

    void insertForgotPasswordAuthCode(
            @Param("key") String key,
            @Param("ip") String ip,
            @Param("email") String email,
            @Param("code") String code,
            @Param("minutes") int minutes);

    String selectEmailByAuthCodeFromEmail (
            @Param("authCode") String authCode,
            @Param("key") String key,
            @Param("ip") String ip);

    String selectEmailByAuthCodeFromPassword (
            @Param("authCode") String authCode,
            @Param("key") String key,
            @Param("ip") String ip);

    void updateEmailAuthCodeExpired(
            @Param("key") String key);

    void updatePasswordAuthCodeExpired(
            @Param("key") String key);

    int selectUserCount(
            @Param("email") String email,
            @Param("contactFirst") String contactFirst,
            @Param("contactSecond") String contactSecond,
            @Param("contactThird") String contactThird);

    void updateUserPassword(
            @Param("email") String email,
            @Param("password") String password);

    void deleteUser(@Param("email") String email);


}