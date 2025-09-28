package com.alibiner.exceptions.user;

import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.enums.errorMessages.IErrorCode;

public class UserNotMatchesException extends Exception implements IErrorCode {
    private ErrorCode errorCode;

    public UserNotMatchesException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    @Override
    public String getErrorCode() {
        return "";
    }
}
