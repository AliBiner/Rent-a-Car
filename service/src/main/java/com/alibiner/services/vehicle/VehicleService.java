package com.alibiner.services.vehicle;

import com.alibiner.enums.Role;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.general.NotFoundException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.interfaces.mapper.IRentMapper;
import com.alibiner.interfaces.service.IRentPriceService;
import com.alibiner.interfaces.service.IUserService;
import com.alibiner.interfaces.unitOfWork.IUnitOfWork;
import com.alibiner.interfaces.mapper.IVehicleMapper;
import com.alibiner.interfaces.repository.IVehicleRepository;
import com.alibiner.repositoryDto.request.vehicle.VehicleAndDetailUpdatePersistenceDto;
import com.alibiner.repositoryDto.response.vehicle.VehiclePersistenceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleCreateServiceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleAndDetailAddServiceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleDetailAddServiceDto;
import com.alibiner.interfaces.service.IVehicleService;
import com.alibiner.serviceDto.request.vehicle.update.VehicleUpdateServiceDto;
import com.alibiner.serviceDto.response.user.UserServiceDto;
import com.alibiner.serviceDto.response.vehicle.GetAllVehicleResponseServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleDetailServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleResponseServiceDto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VehicleService implements IVehicleService {
    private final IVehicleRepository vehicleRepository;
    private final IVehicleMapper vehicleMapper;
    private final IUnitOfWork unitOfWork;
    private final IUserService userService;
    private final IRentPriceService rentPriceService;
    private final IRentMapper rentMapper;

    public VehicleService(IVehicleRepository vehicleRepository, IVehicleMapper vehicleMapper, IUnitOfWork unitOfWork, IUserService userService, IRentPriceService rentPriceService, IRentMapper rentMapper) {
        this.vehicleRepository = vehicleRepository;
        this.vehicleMapper = vehicleMapper;
        this.unitOfWork = unitOfWork;
        this.userService = userService;
        this.rentPriceService = rentPriceService;
        this.rentMapper = rentMapper;
    }

    @Override
    public int createVehicle(VehicleCreateServiceDto dto) throws SQLException, UserForbiddenException, UserNotFoundException {
        UserServiceDto user = userService.getById(dto.atCreated());
        if (!user.role().equals(Role.ADMIN))
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);

        int result = vehicleRepository.create(vehicleMapper.toVehicleCreateDto(dto));
        if (result>0)
            unitOfWork.commit();
        unitOfWork.rollback();
        return result;
    }

    @Override
    public int createVehicleDetail(int vehicleId, VehicleDetailAddServiceDto dto) throws SQLException, UserForbiddenException, UserNotFoundException {
        UserServiceDto user = userService.getById(dto.atCreated());
        if (!user.role().equals(Role.ADMIN))
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);

        int result = vehicleRepository.createDetails(vehicleId,vehicleMapper.toVehicleDetailCreateDto(dto));
        if (result>0){
            unitOfWork.commit();
        }

        unitOfWork.rollback();
        return result;
    }

    @Override
    public int createVehicleAndDetail(VehicleAndDetailAddServiceDto dto) throws SQLException, UserForbiddenException, UserNotFoundException {
        UserServiceDto user = userService.getById(dto.atCreated());
        if (!user.role().equals(Role.ADMIN))
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);


        int vehicleId = vehicleRepository.create(vehicleMapper.toVehicleCreateDto(dto));
        if (vehicleId<=0){
            unitOfWork.rollback();
            return 0;
        }
        int details = vehicleRepository.createDetails(vehicleId, vehicleMapper.toVehicleDetailCreateDto(dto));
        if (details<=0){
            unitOfWork.rollback();
            return 0;
        }
        unitOfWork.commit();
        return vehicleId;
    }

    @Override
    public boolean update(int id, VehicleUpdateServiceDto dto) throws UserForbiddenException, SQLException, UserNotFoundException {
        UserServiceDto user = userService.getById(dto.atUpdated());
        if (!user.role().equals(Role.ADMIN))
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);

        VehicleAndDetailUpdatePersistenceDto mapped = vehicleMapper.toVehicleAndDetailUpdatePersistenceDto(dto);

        vehicleRepository.update(id, mapped);

        if (!vehicleRepository.isAllReadyExistDetailByVehicleId(id))
            vehicleRepository.createDetails(id,vehicleMapper.toVehicleDetailCreateDto(dto));
        else
            vehicleRepository.updateDetails(id,vehicleMapper.toVehicleAndDetailUpdatePersistenceDto(dto));

        rentPriceService.create(rentMapper.toRentPriceCreatePersistenceDto(dto));

        unitOfWork.commit();
        return true;
    }

    @Override
    public VehicleResponseServiceDto getById(int id) throws SQLException, NotFoundException {

        VehiclePersistenceDto persistenceDto = vehicleRepository.getById(id);
        if (persistenceDto == null)
            throw new NotFoundException("Araç Kaydı Bulunamadı!", ErrorCode.NOT_FOUND);

        return vehicleMapper.toVehicleResponseServiceDto(persistenceDto);
    }

    @Override
    public boolean delete(int id, int userId) throws SQLException, UserForbiddenException, UserNotFoundException {
        UserServiceDto user = userService.getById(userId);
        if (!user.role().equals(Role.ADMIN))
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);

        return vehicleRepository.delete(id);
    }

    @Override
    public GetAllVehicleResponseServiceDto getAll(int offset, int limit) throws SQLException {
        if (limit>10)
            limit = 10;

        List<VehiclePersistenceDto> persistenceDtos = vehicleRepository.getAll(offset,limit);

        if (persistenceDtos == null)
            return null;

        List<VehicleResponseServiceDto> mappedList = new ArrayList<>();
        for (VehiclePersistenceDto persistence : persistenceDtos){
            mappedList.add(vehicleMapper.toVehicleResponseServiceDto(persistence));
        }

        int getAllCount = vehicleRepository.getAllCount();
        GetAllVehicleResponseServiceDto result = new GetAllVehicleResponseServiceDto(
                getAllCount,
                mappedList
        );

        return result;
    }

    @Override
    public VehicleDetailServiceDto getDetailById(int id) throws SQLException {
        VehiclePersistenceDto persistenceDto = vehicleRepository.getById(id);
        return vehicleMapper.toVehicleDetailServiceDto(persistenceDto);
    }
}
