package com.alibiner.interfaces.service;

import java.util.*;
import com.alibiner.exceptions.general.DataNotInsertException;
import com.alibiner.exceptions.general.NotFoundException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.repositoryDto.request.reservation.ReservationPersistenceDto;
import com.alibiner.serviceDto.request.reservation.ReservationCreateServiceDto;

import java.sql.SQLException;

public interface IReservationService {
    boolean create(ReservationCreateServiceDto dto) throws SQLException, UserNotFoundException, NotFoundException,
            DataNotInsertException;

    List<ReservationPersistenceDto> getAllActive(int userId) throws SQLException;

    List<ReservationPersistenceDto> getAllPast(int userId) throws SQLException;
}
