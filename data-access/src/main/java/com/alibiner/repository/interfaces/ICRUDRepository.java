package com.alibiner.repository.interfaces;

import com.alibiner.entity.BaseEntity;
import com.alibiner.exceptions.DataNotInsertException;

import java.sql.SQLException;
import java.util.*;

public interface ICRUDRepository<T extends BaseEntity> {
    int save(T entity) throws SQLException, DataNotInsertException;
    int update(T entity) throws SQLException;
    boolean delete(int id) throws SQLException;
    List<T> getAll() throws SQLException;
    T getById(int id) throws SQLException;
}
