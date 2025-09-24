package com.alibiner.services.vehicle;

import com.alibiner.dto.request.vehicle.IVehicleRequestDto;
import com.alibiner.dto.request.vehicle.helicopter.HelicopterAddRequestDto;
import com.alibiner.dto.request.vehicle.helicopter.HelicopterUpdateRequestDto;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.entity.Helicopter;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.exceptions.car.NotFoundException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.mappers.helicopter.DtoToHelicopter;
import com.alibiner.mappers.helicopter.HelicopterToDto;
import com.alibiner.repository.HelicopterRepository;
import com.alibiner.services.UserService;
import com.alibiner.services.vehicle.interfaces.IVehicleCRUDService;
import com.alibiner.util.MyDbConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class HelicopterService implements IVehicleCRUDService {
    private Connection connection;
    private UserService userService;
    private HelicopterRepository helicoterRepository;

    public HelicopterService( ) {
        this.connection = MyDbConnection.getInstance().getConnection();
        this.userService = new UserService();
        this.helicoterRepository = new HelicopterRepository(connection);
    }

    @Override
    public boolean save(IVehicleRequestDto dto) throws UserForbiddenException, UserNotFoundException, SQLException, DataNotInsertException {
        HelicopterAddRequestDto requestDto = (HelicopterAddRequestDto) dto;
        if (!userService.isAdmin(requestDto.atCreated())) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }
        Helicopter helicopter = DtoToHelicopter.HelicopterAddRequestDtoTo(requestDto);
        int result = helicoterRepository.save(helicopter);
        if (result<=0)
            return false;
        connection.commit();
        return true;
    }

    @Override
    public IVehicleResponseDto getById(int id) throws SQLException, NotFoundException {
        Helicopter helicopter = helicoterRepository.getById(id);

        if (helicopter==null)
            throw new NotFoundException(ErrorCode.NOT_FOUND);

        return HelicopterToDto.ToAdminGetHelicopterResponseDto(helicopter);
    }

    @Override
    public List<IVehicleResponseDto> getAll(int adminId) throws UserForbiddenException, UserNotFoundException, SQLException {
        if (!userService.isAdmin(adminId)) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }

        List<Helicopter> helicopterList = helicoterRepository.getAll();

        List<IVehicleResponseDto> result = new ArrayList<>();

        for (Helicopter helicopter : helicopterList){
            result.add(HelicopterToDto.ToAdminGetHelicopterResponseDto(helicopter));
        }

        return result;
    }

    @Override
    public boolean update(IVehicleRequestDto vehicle) throws SQLException, NotFoundException, UserForbiddenException, UserNotFoundException {

        HelicopterUpdateRequestDto dto = (HelicopterUpdateRequestDto) vehicle;

        if (!userService.isAdmin(dto.atUpdated())) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }

        Helicopter helicopter = helicoterRepository.getById(dto.id());

        Helicopter updatedHelicopter =
                new Helicopter(
                        helicopter.getId(),
                        dto.brand(),
                        dto.model(),
                        dto.productionYear(),
                        helicopter.isRent(),
                        helicopter.getCreatedDate(),
                        LocalDateTime.now(),
                        helicopter.getAtCreatedId(),
                        null,
                        dto.atUpdated(),
                        null,
                        dto.maxRange(),
                        dto.wingCount(),
                        dto.passengerCount(),
                        dto.pilotCount()
                );

        int result = helicoterRepository.update(updatedHelicopter);

        if (result <= 0)
            return false;
        connection.commit();
        return true;
    }

    @Override
    public boolean delete(int id, int userId) throws UserForbiddenException, UserNotFoundException, SQLException {
        if (!userService.isAdmin(userId)) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }
        boolean result = helicoterRepository.delete(id);
        connection.commit();
        return result;
    }
}
