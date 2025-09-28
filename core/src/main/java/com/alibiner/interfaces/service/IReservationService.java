package com.alibiner.interfaces.service;

import com.alibiner.exceptions.general.DataNotInsertException;
import com.alibiner.exceptions.general.NotFoundException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.repositoryDto.request.reservation.ReservationCreatePersistenceDto;
import com.alibiner.serviceDto.request.reservation.ReservationCreateServiceDto;

import java.sql.SQLException;

public interface IReservationService {
    boolean create(ReservationCreateServiceDto dto) throws SQLException, UserNotFoundException, NotFoundException,
            DataNotInsertException;


}
