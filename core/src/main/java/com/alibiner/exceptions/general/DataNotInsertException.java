package com.alibiner.exceptions.general;

import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.enums.errorMessages.IErrorCode;

public class DataNotInsertException extends Exception implements IErrorCode {
    private ErrorCode errorCode;

    public DataNotInsertException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    public DataNotInsertException(String message, ErrorCode errorCode) {
        super(message);
        this.errorCode = errorCode;
    }

    @Override
    public String getErrorCode() {
        return errorCode.getCode();
    }
}
