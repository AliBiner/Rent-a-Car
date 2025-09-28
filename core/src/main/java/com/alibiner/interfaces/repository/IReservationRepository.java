package com.alibiner.interfaces.repository;

import com.alibiner.enums.reservation.ReservationStatus;
import com.alibiner.repositoryDto.request.reservation.ReservationCreatePersistenceDto;
import com.alibiner.repositoryDto.request.reservation.ReservationPersistenceDto;

import java.time.LocalDateTime;
import java.util.*;
import java.sql.SQLException;

public interface IReservationRepository{
    int create (ReservationCreatePersistenceDto dto) throws SQLException;
    int update(int id, ReservationStatus status) throws SQLException;
    List<ReservationPersistenceDto> getAllByUserId(int userId) throws SQLException;
    boolean isAlreadyReservation(int vehicleId, LocalDateTime startDate, LocalDateTime finishDate) throws SQLException;
}
