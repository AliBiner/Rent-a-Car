package services;

import dto.request.UserSignInRequestDto;
import dto.response.IResponseDto;
import dto.response.ResponseDto;
import dto.response.UserSignInResponseDto;
import entity.User;
import mappers.DtoToUser;
import repository.UserRepository;
import util.MyDbConnection;
import util.PasswordHashing;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class UserService {

    UserRepository userRepository;
    Connection connection;

    public UserService() {
        this.connection = MyDbConnection.getInstance().getConnection();
        this.userRepository = new UserRepository(this.connection);
    }

    public ResponseDto save(UserSignInRequestDto dto) throws SQLException, NoSuchAlgorithmException {

        ResponseDto responseDto = new ResponseDto();


        if (isAlreadyExist(dto.getEmail())) {
            responseDto.setStatusCode(400);
            responseDto.setMessage("Bu email adresi zaten kayıtlı!");
            responseDto.setSuccess(false);
            return responseDto;
        }

        //Hash password
        dto.setPassword(PasswordHashing.hash(dto.getPassword()));

        //Dto Mapping
        User user =  DtoToUser.userSignInRequestDtoTo(dto);
        user.setCreatedDate(LocalDateTime.now());

        //Insert DB
        int resultSave = userRepository.save(user);

        //Kayıt işlemi başarısız durumu
        if (resultSave==0){
            responseDto.setStatusCode(400);
            responseDto.setMessage("Veri tabanına veri kaydedilemedi!");
            responseDto.setSuccess(false);
            return responseDto;
        }

        //Kayıt işlemi başarılı durumu
        User result = userRepository.getByEmail(dto.getEmail());

        responseDto.setStatusCode(200);
        responseDto.setMessage("Kayıt İşlemi Başarılı");
        responseDto.setSuccess(true);

        //Response Body
        UserSignInResponseDto signInResponseDto = new UserSignInResponseDto();


        signInResponseDto.setId(result.getId());
        signInResponseDto.setEmail(result.getEmail());
        signInResponseDto.setFullName(result.getFullName());

        responseDto.setBody(signInResponseDto);

        return responseDto;
    }

    public boolean isAlreadyExist(String email) throws SQLException {
        return userRepository.isAlreadyExist(email);
    }
}
