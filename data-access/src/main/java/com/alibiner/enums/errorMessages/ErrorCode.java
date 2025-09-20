package com.alibiner.enums.errorMessages;

public enum ErrorCode {

    VALIDATION("VALIDATION-400","Dto validation işleminden geçemedi!"),
    USER_ALREADY_EXIST("USER-409","Bu kullanıcı zaten kayıtlı!"),
    USER_NOT_FOUND("USER-404","Böyle bir kullanıcı bulunamadı!"),
    USER_NOT_MATCHES("USER-NOT-MATCHES-400","Email ve ya şifre hatalı!"),
    ILLEGAL_ARGUMENT_EXCEPTION("ILLEGAL-ARGUMENT-400","Hatalı argüman!"),
    SQL_EXCEPTION("DB-SQL-500","Db hatası!"),
    DATA_NOT_INSERT("DB-501","Veri kaydedilemedi!"),
    GENERAL_EXCEPTION("GENERAL-600","Beklenmedik bir hata oluştu!"),
    OK("200","İşlem Başarılı!");

    private String code;
    private String message;

    ErrorCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
