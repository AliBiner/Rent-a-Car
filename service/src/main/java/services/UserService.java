package services;

import dto.request.UserSignInRequestDto;
import entity.User;
import repository.UserRepository;

import java.sql.SQLException;
import java.time.LocalDateTime;

public class UserService {

    public int signIn(UserSignInRequestDto dto) throws SQLException {

        //Todo bu email ile kayıt olan varmı?

        User user = new User();

        user.setFirstName(dto.getFirstName());
        user.setLastName(dto.getLastName());
        user.setEmail(dto.getEmail());
        //Todo password hash
        user.setPassword(dto.getPassword());
        user.setCreatedDate(LocalDateTime.now());

        UserRepository userRepository = new UserRepository();
        return userRepository.save(user);
    }
}
