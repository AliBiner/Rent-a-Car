package com.alibiner.interfaces.service;

import java.util.*;
import com.alibiner.exceptions.general.DataNotInsertException;
import com.alibiner.exceptions.general.NotFoundException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.repositoryDto.request.reservation.GetAllReservationPaginationDto;
import com.alibiner.repositoryDto.request.reservation.ReservationPersistenceDto;
import com.alibiner.serviceDto.request.reservation.ReservationCreateServiceDto;

import java.sql.SQLException;

public interface IReservationService {
    boolean create(ReservationCreateServiceDto dto) throws SQLException, UserNotFoundException, NotFoundException,
            DataNotInsertException;

    GetAllReservationPaginationDto getAllActive(int offset, int limit, int userId) throws SQLException;

    GetAllReservationPaginationDto getAllPast(int offset, int limit, int userId) throws SQLException;
}
