package com.alibiner.controller;

import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.enums.vehicle.VehicleType;
import com.alibiner.exceptionHandler.MyExceptionHandler;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.interfaces.mapper.IRentMapper;
import com.alibiner.interfaces.mapper.IUserMapper;
import com.alibiner.interfaces.repository.IRentPriceRepository;
import com.alibiner.interfaces.repository.IUserRepository;
import com.alibiner.interfaces.service.IRentPriceService;
import com.alibiner.interfaces.service.IUserService;
import com.alibiner.interfaces.unitOfWork.IUnitOfWork;
import com.alibiner.interfaces.mapper.IVehicleMapper;
import com.alibiner.interfaces.repository.IVehicleRepository;
import com.alibiner.interfaces.service.IVehicleService;
import com.alibiner.mappers.UserMapper;
import com.alibiner.mappers.rentPrice.RentMapper;
import com.alibiner.mappers.vehicle.VehicleMapper;
import com.alibiner.repository.RentPriceRepository;
import com.alibiner.repository.UserRepository;
import com.alibiner.repository.VehicleRepository;
import com.alibiner.serviceDto.request.vehicle.create.VehicleAndDetailAddServiceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleCreateServiceDto;
import com.alibiner.serviceDto.request.vehicle.update.VehicleUpdateServiceDto;
import com.alibiner.serviceDto.response.vehicle.GetAllVehicleResponseServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleDetailServiceDto;
import com.alibiner.services.UserService;
import com.alibiner.services.rentPrice.RentPriceService;
import com.alibiner.services.vehicle.VehicleService;
import com.alibiner.util.ResponseEntity;
import com.alibiner.util.UnitOfWork;

public class VehicleController {
    private final IVehicleService vehicleService;

    public VehicleController() {
        IVehicleRepository vehicleRepository = new VehicleRepository();
        IVehicleMapper vehicleMapper = new VehicleMapper();
        IUnitOfWork unitOfWork = new UnitOfWork();
        IUserRepository userRepository = new UserRepository();
        IUserMapper userMapper = new UserMapper();
        IUserService userService = new UserService(userRepository,unitOfWork,userMapper);
        IRentPriceRepository rentPriceRepository = new RentPriceRepository();
        IRentPriceService rentPriceService = new RentPriceService(rentPriceRepository,unitOfWork);
        IRentMapper rentMapper = new RentMapper();
        this.vehicleService = new VehicleService(vehicleRepository,vehicleMapper,unitOfWork,userService,rentPriceService,rentMapper);
    }


    public ResponseEntity<Integer> postVehicle(VehicleCreateServiceDto dto){
        try {
            int vehicleId = vehicleService.createVehicle(dto);
            return new ResponseEntity<Integer>().ok(vehicleId);
        } catch (Exception e) {
            return new MyExceptionHandler<Integer>(e).handle();
        }
    }

    public ResponseEntity<Integer> postVehicleAndDetail(VehicleAndDetailAddServiceDto dto){
        try {
            int vehicleId = vehicleService.createVehicleAndDetail(dto);
            return new ResponseEntity<Integer>().ok(vehicleId);
        } catch (Exception e) {
            return new MyExceptionHandler<Integer>(e).handle();
        }
    }

    public ResponseEntity<GetAllVehicleResponseServiceDto> getAll(int offset, int limit){
        try {
            if (offset < 0 || limit < 1 )
                throw new ValidationException(ErrorCode.VALIDATION,"Offset 0'dan veya limit 1'den küçük olamaz!");

            return new ResponseEntity<GetAllVehicleResponseServiceDto>().ok(vehicleService.getAll(offset,limit));
        }catch (Exception e){
            return new MyExceptionHandler<GetAllVehicleResponseServiceDto>(e).handle();
        }
    }

    public ResponseEntity<GetAllVehicleResponseServiceDto> getAll(int offset, int limit, int modelID){
        try {
            if (offset < 0 || limit < 1 )
                throw new ValidationException(ErrorCode.VALIDATION,"Offset 0'dan ve ya limit 1'den küçük olamaz!");

            return new ResponseEntity<GetAllVehicleResponseServiceDto>().ok(vehicleService.getAll(offset,limit,modelID));
        }catch (Exception e){
            return new MyExceptionHandler<GetAllVehicleResponseServiceDto>(e).handle();
        }
    }

    public ResponseEntity<GetAllVehicleResponseServiceDto> getAll(int offset, int limit, VehicleType vehicleType){
        try {
            if (offset < 0 || limit < 1 )
                throw new ValidationException(ErrorCode.VALIDATION,"Offset 0'dan ve ya limit 1'den küçük olamaz!");

            return new ResponseEntity<GetAllVehicleResponseServiceDto>().ok(vehicleService.getAll(offset,limit,vehicleType));
        }catch (Exception e){
            return new MyExceptionHandler<GetAllVehicleResponseServiceDto>(e).handle();
        }
    }

    public ResponseEntity<GetAllVehicleResponseServiceDto> getAll(int offset, int limit, float minPrice, float maxPrice){
        try {
            if (offset < 0 || limit < 1 )
                throw new ValidationException(ErrorCode.VALIDATION,"Offset 0'dan veya limit 1'den küçük olamaz!");
            if (minPrice<0 || maxPrice<0)
                throw new ValidationException(ErrorCode.VALIDATION,"min ve max değer negatif olamaz!");
            if (minPrice>maxPrice)
                throw new ValidationException(ErrorCode.VALIDATION,"min değer ve max değerden fazla olamaz!");

            return new ResponseEntity<GetAllVehicleResponseServiceDto>().ok(vehicleService.getAll(offset,limit, minPrice, maxPrice));
        }catch (Exception e){
            return new MyExceptionHandler<GetAllVehicleResponseServiceDto>(e).handle();
        }
    }

    public ResponseEntity<VehicleDetailServiceDto> getDetailById(int id) {
        try {
            VehicleDetailServiceDto result = vehicleService.getDetailById(id);
            return new ResponseEntity<VehicleDetailServiceDto>().ok(result);
        }catch (Exception e){
            return new MyExceptionHandler<VehicleDetailServiceDto>(e).handle();
        }
    }

    public ResponseEntity<Boolean> update(VehicleUpdateServiceDto dto){
        try {
            boolean update = vehicleService.update(dto.id(), dto);
            return new ResponseEntity<Boolean>().ok(update);
        } catch (Exception e) {
            return new MyExceptionHandler<Boolean>(e).handle();
        }
    }

    public ResponseEntity<Boolean> delete(int id, int userId) {
       try {
           if (id<=0)
               throw new ValidationException(ErrorCode.VALIDATION,"id bilgisi geçersiz!");

           boolean isDelete = vehicleService.delete(id, userId);
           return new ResponseEntity<Boolean>().ok(isDelete);
       } catch (Exception e) {
           return new MyExceptionHandler<Boolean>(e).handle();
       }
    }
}
