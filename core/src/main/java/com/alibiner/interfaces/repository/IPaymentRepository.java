package com.alibiner.interfaces.repository;

import com.alibiner.repositoryDto.request.payment.PaymentCreatePersistenceDto;

import java.sql.SQLException;

public interface IPaymentRepository {
    int create(PaymentCreatePersistenceDto dto) throws SQLException;
}
