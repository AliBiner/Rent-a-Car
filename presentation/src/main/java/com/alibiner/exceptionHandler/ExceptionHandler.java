package com.alibiner.exceptionHandler;

import com.alibiner.dto.response.ResponseDto;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.exceptions.user.UserAlreadyExistException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.exceptions.user.UserNotMatchesException;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.util.MyDbConnection;

import java.sql.SQLException;

public class ExceptionHandler {
    private Exception exception;
    private String message;

    public ExceptionHandler(Exception exception,String message) {
        this.exception = exception;
        this.message = message;
    }

    public ResponseDto handle(){
        try {
            throw exception;
        }

        // User
        catch (ValidationException e){
            return new ResponseDto(e.getErrorCode(),e.getMessage(),false,e.getErrorMessages());
        }catch (UserNotFoundException e){
            return new ResponseDto(e.getErrorCode(),e.getMessage(),false);
        }catch (UserNotMatchesException e){
            return new ResponseDto(e.getErrorCode(),e.getMessage(),false);
        }
        catch (UserAlreadyExistException e){
            return new ResponseDto(e.getErrorCode(),e.getMessage(),false);
        }
        catch (UserForbiddenException e){
            return new ResponseDto(e.getErrorCode(),e.getMessage(),false);
        }

        // Runtime
        catch (IllegalArgumentException e){
            return new ResponseDto(ErrorCode.ILLEGAL_ARGUMENT_EXCEPTION.getCode(),e.getMessage(),false);
        }


        //SQL - DB
        catch (DataNotInsertException e){
            return new ResponseDto(ErrorCode.DATA_NOT_INSERT.getCode(), ErrorCode.DATA_NOT_INSERT.getMessage(), false);
        }
        catch (SQLException e){
            return new ResponseDto(ErrorCode.SQL_EXCEPTION.getCode(), e.getMessage(),false);
        }



        // General
        catch (Exception e) {
            e.printStackTrace();
            return new ResponseDto(ErrorCode.GENERAL_EXCEPTION.getCode(), ErrorCode.GENERAL_EXCEPTION.getMessage(),false);
        }
        finally {
            try {
                MyDbConnection.getInstance().getConnection().rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
