package com.alibiner.enums.errorMessages;

public enum ErrorCode {

    VALIDATION("VALIDATION-400","Dto validation işleminden geçemedi!"),
    USER_ALREADY_EXIST("USER-409","Bu kullanıcı zaten kayıtlı!"),
    USER_NOT_FOUND("USER-404","Böyle bir kullanıcı bulunamadı!"),
    USER_NOT_MATCHES("USER-NOT-MATCHES-400","Email ve ya şifre hatalı!"),
    ILLEGAL_ARGUMENT_EXCEPTION("ILLEGAL-ARGUMENT-400","Hatalı argüman!"),
    SQL_EXCEPTION("DB-SQL-500","Db hatası!"),
    DATA_NOT_INSERT("DB-501","Veri kaydedilemedi!"),
    DATA_NOT_UPDATE("DB-502","Veri Güncellenemedi"),
    DATA_NOT_DELETE("DB-503","Veri Silinemedi!"),
    GENERAL_EXCEPTION("GENERAL-600","Beklenmedik bir hata oluştu!"),
    OK("200","İşlem Başarılı!"),
    FORBIDDEN("USER-403","Bu işlemi yapmak için yetkiniz bulunmamaktadır!"),
    NOT_FOUND("DB-400","Mevcut kayıt bulunmadı!")
    ;

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
