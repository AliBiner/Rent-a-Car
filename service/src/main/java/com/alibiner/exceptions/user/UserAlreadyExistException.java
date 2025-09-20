package com.alibiner.exceptions.user;

import com.alibiner.errorMessages.ErrorCode;
import com.alibiner.errorMessages.IErrorCode;

public class UserAlreadyExistException extends Exception implements IErrorCode {
    private ErrorCode errorCode;

    public UserAlreadyExistException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    @Override
    public String getErrorCode() {
        return errorCode.getCode();
    }
}
