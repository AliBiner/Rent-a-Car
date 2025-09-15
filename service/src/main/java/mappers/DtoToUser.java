package mappers;

import dto.request.UserSignInRequestDto;
import entity.User;

public class DtoToUser {

    public static User userSignInRequestDtoTo(UserSignInRequestDto dto){
        User user = new User();

        user.setFirstName(dto.getFirstName());
        user.setLastName(dto.getLastName());
        user.setEmail(dto.getEmail());
        user.setPassword(dto.getPassword());

        return user;
    }
}
