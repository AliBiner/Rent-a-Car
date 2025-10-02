package com.alibiner.repository;

import com.alibiner.enums.reservation.ReservationStatus;
import com.alibiner.interfaces.repository.IPaymentRepository;
import com.alibiner.interfaces.repository.IReservationRepository;
import com.alibiner.repositoryDto.request.payment.PaymentCreatePersistenceDto;
import com.alibiner.repositoryDto.request.reservation.ReservationCreatePersistenceDto;
import com.alibiner.repositoryDto.request.reservation.ReservationPersistenceDto;
import com.alibiner.util.MyDbConnection;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ReservationRepository implements IReservationRepository, IPaymentRepository {
    private final Connection connection;

    public ReservationRepository() {
        this.connection = MyDbConnection.getInstance().getConnection();
    }

    @Override
    public int create(ReservationCreatePersistenceDto dto) throws SQLException {
        String sql = """
                INSERT INTO reservation(user_id,vehicle_id,start_date,finish_date,status) 
                VALUES (?,?,?,?,?)
                """;

        PreparedStatement ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1,dto.userId());
        ps.setInt(2,dto.vehicleId());
        ps.setTimestamp(3, Timestamp.valueOf(dto.startDate()));
        ps.setTimestamp(4,Timestamp.valueOf(dto.finishDate()));
        ps.setInt(5,dto.reservationStatus().ordinal());
        int affectedRows = ps.executeUpdate();
        if (affectedRows>0){
            try(ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next())
                    return rs.getInt(1);
            }
        }
        return 0;
    }


    @Override
    public int update(int id, ReservationStatus status) throws SQLException {
        String sql = """
                UPDATE reservation
                SET status = ?
                WHERE id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,status.ordinal());
        ps.setInt(2,id);
        return ps.executeUpdate();
    }



    @Override
    public List<ReservationPersistenceDto> getAllByUserId(int userId) throws SQLException {
        String sql = """
                SELECT *, 
                       (SELECT 
                            first_name || ' ' || last_name 
                        FROM users where id = user_id) full_name 
                FROM reservation
                WHERE user_id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,userId);
        ResultSet resultSet = ps.executeQuery();
        return setReservations(resultSet);
    }

    @Override
    public boolean isAlreadyReservation(int vehicleId, LocalDateTime startDate, LocalDateTime finishDate) throws SQLException {
        String sql = """
                SELECT * FROM reservation r
                WHERE
                ((r.start_date BETWEEN ? AND ? )
                OR (r.finish_date BETWEEN ? AND ?))
                AND r.vehicle_id = ?
                AND r.status not in (?,?,?)
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setTimestamp(1,Timestamp.valueOf(startDate));
        ps.setTimestamp(2,Timestamp.valueOf(finishDate));
        ps.setTimestamp(3,Timestamp.valueOf(startDate));
        ps.setTimestamp(4,Timestamp.valueOf(finishDate));
        ps.setInt(5,vehicleId);
        ps.setInt(6,ReservationStatus.COMPLETED.ordinal());
        ps.setInt(7,ReservationStatus.CANCELED.ordinal());
        ps.setInt(8,ReservationStatus.NO_SHOW.ordinal());
        return ps.executeQuery().next();
    }

    @Override
    public List<ReservationPersistenceDto> getAllActive(int userId) throws SQLException {
        String sql = """
                SELECT *, 
                       (SELECT 
                            first_name || ' ' || last_name 
                        FROM users where id = user_id) full_name 
                FROM reservation
                WHERE user_id = ?
                AND status not in (?,?)
                AND (start_date > ? OR finish_date > ?) 
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,userId);
        ps.setInt(2,ReservationStatus.CANCELED.ordinal());
        ps.setInt(3,ReservationStatus.COMPLETED.ordinal());
        ps.setTimestamp(4,Timestamp.valueOf(LocalDateTime.now()));
        ps.setTimestamp(5,Timestamp.valueOf(LocalDateTime.now()));
        ResultSet resultSet = ps.executeQuery();
        return setReservations(resultSet);
    }

    @Override
    public List<ReservationPersistenceDto> getAllPast(int userId) throws SQLException {
        String sql = """
                SELECT *, 
                       (SELECT 
                            first_name || ' ' || last_name 
                        FROM users where id = user_id) full_name 
                FROM reservation
                WHERE user_id = ?
                AND finish_date < ? 
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,userId);
        ps.setTimestamp(2,Timestamp.valueOf(LocalDateTime.now()));
        ResultSet resultSet = ps.executeQuery();
        return setReservations(resultSet);
    }

    private List<ReservationPersistenceDto> setReservations(ResultSet rs) throws SQLException {
        List<ReservationPersistenceDto> reservations = new ArrayList<>();
        while (rs.next()){
            reservations.add(
                    new ReservationPersistenceDto(
                            rs.getInt("id"),
                            rs.getInt("user_id"),
                            rs.getString("full_name"),
                            rs.getInt("vehicle_id"),
                            rs.getTimestamp("start_date").toLocalDateTime(),
                            rs.getTimestamp("finish_date").toLocalDateTime(),
                            ReservationStatus.values()[rs.getInt("status")]
                    )
            );
        }
        return reservations;
    }


    @Override
    public int create(PaymentCreatePersistenceDto dto) throws SQLException {
        String sql = """
                INSERT INTO payment(
                reservation_id,
                deposit,
                amount,
                total_amount,
                payment_type,
                status)
                VALUES (?,?,?,?,?,?)
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,dto.reservationId());
        ps.setFloat(2,dto.deposit());
        ps.setFloat(3,dto.amount());
        ps.setFloat(4,dto.totalAmount());
        ps.setInt(5,dto.paymentType().ordinal());
        ps.setInt(6,dto.paymentStatus().ordinal());
        return ps.executeUpdate();
    }
}
