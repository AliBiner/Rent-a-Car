package com.alibiner.interfaces.unitOfWork;

import java.sql.SQLException;

public interface IUnitOfWork {
    void commit() throws SQLException;
    void rollback() throws SQLException;
}
