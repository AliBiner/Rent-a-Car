package com.alibiner.exceptions;

import com.alibiner.errorMessages.ErrorCode;
import com.alibiner.errorMessages.IErrorCode;

public class DataNotInsertException extends Exception implements IErrorCode {
    private ErrorCode errorCode;

    public DataNotInsertException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    @Override
    public String getErrorCode() {
        return errorCode.getCode();
    }
}
