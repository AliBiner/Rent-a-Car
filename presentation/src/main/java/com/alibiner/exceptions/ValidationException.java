package com.alibiner.exceptions;

import com.alibiner.errorMessages.ErrorCode;
import com.alibiner.errorMessages.IErrorCode;

import java.util.*;

public class ValidationException extends Exception implements IErrorCode {

    private final ErrorCode errorCode;
    private final List<String> messages;

    public ValidationException(ErrorCode errorCode, List<String> errorMessages) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
        this.messages = errorMessages;
    }

    public List<String> getErrorMessages(){
        return this.messages;
    }

    @Override
    public String getErrorCode() {
        return errorCode.getCode();
    }
}
