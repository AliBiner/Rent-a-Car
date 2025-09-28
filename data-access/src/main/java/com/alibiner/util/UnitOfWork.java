package com.alibiner.util;

import com.alibiner.interfaces.unitOfWork.IUnitOfWork;

import java.sql.SQLException;

public class UnitOfWork implements IUnitOfWork {

    @Override
    public void commit() throws SQLException {
        MyDbConnection.commit();
    }

    @Override
    public void rollback() throws SQLException {
        MyDbConnection.rollback();
    }
}
