package exceptionHandler;

import dto.response.ResponseDto;

import java.sql.SQLException;

public class ExceptionHandler {
    private Exception exception;
    private String message;

    public ExceptionHandler(Exception exception,String message) {
        this.exception = exception;
        this.message = message;
    }

    public ResponseDto handle(){
        ResponseDto dto = new ResponseDto();
        try {
            throw exception;
        }catch (IllegalArgumentException e){
            dto.setStatusCode(400);
            dto.setMessage(e.getMessage());
            dto.setSuccess(false);
        }catch (SQLException e){
            dto.setStatusCode(500);
            dto.setMessage(e.getMessage());
            dto.setSuccess(false);
        } catch (RuntimeException e){
            dto.setStatusCode(500);
            dto.setMessage(e.getMessage());
            dto.setSuccess(false);
        }
        catch (Exception e) {
            dto.setStatusCode(600);
            dto.setMessage("Beklenmedik bir hata oluştu!");
            dto.setSuccess(false);
        }

        return dto;
    }
}
