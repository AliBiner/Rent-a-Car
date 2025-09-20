package com.alibiner.exceptions.user;

import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.enums.errorMessages.IErrorCode;

public class UserNotFoundException extends Exception implements IErrorCode {

    private ErrorCode errorCode;

    public UserNotFoundException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    @Override
    public String getErrorCode() {
        return errorCode.getCode();
    }
}
