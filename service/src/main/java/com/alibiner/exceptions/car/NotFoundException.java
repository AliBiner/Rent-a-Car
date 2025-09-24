package com.alibiner.exceptions.car;

import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.enums.errorMessages.IErrorCode;

public class NotFoundException extends Exception implements IErrorCode {
    private ErrorCode errorCode;

    public NotFoundException(ErrorCode errorCode) {

        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }


    @Override
    public String getErrorCode() {
        return errorCode.getCode();
    }
}
