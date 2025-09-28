package com.alibiner.exceptionHandler;

import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.general.DataNotInsertException;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.exceptions.general.NotFoundException;
import com.alibiner.exceptions.user.UserAlreadyExistException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.exceptions.user.UserNotMatchesException;
import com.alibiner.util.MyDbConnection;
import com.alibiner.util.ResponseEntity;
import org.postgresql.util.PSQLException;

import java.sql.SQLException;

public class MyExceptionHandler<T> {
    private final Exception exception;

    public MyExceptionHandler(Exception exception ) {
        this.exception = exception;
    }

    public ResponseEntity<T> handle(){
        try {
            throw exception;
        }

        // User
        catch (ValidationException e){
            return new ResponseEntity<>(e.getErrorCode(),e.getMessage(),null);
        }catch (UserNotFoundException e){
            return new ResponseEntity<>(e.getErrorCode(),e.getMessage(),null);
        }catch (UserNotMatchesException e){
            return new ResponseEntity<>(e.getErrorCode(),e.getMessage(),null);
        }
        catch (UserAlreadyExistException e){
            return new ResponseEntity<>(e.getErrorCode(),e.getMessage(),null);
        }
        catch (UserForbiddenException e){
            return new ResponseEntity<>(e.getErrorCode(),e.getMessage(),null);
        }

        catch (NotFoundException e){
            return new ResponseEntity<>(e.getErrorCode(),e.getMessage(),null);
        }

        // Runtime
        catch (IllegalArgumentException e){
            return new ResponseEntity<>(ErrorCode.ILLEGAL_ARGUMENT_EXCEPTION.getCode(), e.getMessage(),null);
        }


        //SQL - DB
        catch (DataNotInsertException e){
            return new ResponseEntity<>(ErrorCode.DATA_NOT_INSERT.getCode(), e.getMessage(),null);
        }
        catch (PSQLException e){
            return new ResponseEntity<>(ErrorCode.SQL_EXCEPTION.getCode(), e.getMessage(),null);
        }
        catch (SQLException e){
            return new ResponseEntity<>(ErrorCode.SQL_EXCEPTION.getCode(), e.getMessage(),null);
        }


        catch (NullPointerException e){
            return new ResponseEntity<>("Null -400", e.getMessage(),null);
        }

        // General
        catch (Exception e) {
            return new ResponseEntity<>(ErrorCode.GENERAL_EXCEPTION.getCode(), ErrorCode.GENERAL_EXCEPTION.getMessage(),null);
        }
        finally {
            try {
                if (MyDbConnection.getInstance() != null && MyDbConnection.getInstance().getConnection()!=null)
                    MyDbConnection.getInstance().getConnection().rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
