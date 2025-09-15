package services;

import dto.request.UserSignInRequestDto;
import entity.User;
import mappers.DtoToUser;
import repository.UserRepository;
import util.PasswordHashing;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class UserService {

    UserRepository userRepository = new UserRepository();

    public int save(UserSignInRequestDto dto) throws SQLException, NoSuchAlgorithmException {

        if (isAlreadyExist(dto.getEmail())) {
            return -1; //Todo response dto oluşturulacak
        }

        dto.setPassword(PasswordHashing.hash(dto.getPassword()));

        User user =  DtoToUser.userSignInRequestDtoTo(dto);
        user.setCreatedDate(LocalDateTime.now());

        return userRepository.save(user);
    }

    public boolean isAlreadyExist(String email) throws SQLException {
        return userRepository.isAlreadyExist(email);
    }
}
