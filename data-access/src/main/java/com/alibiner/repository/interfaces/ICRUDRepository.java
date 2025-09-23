package com.alibiner.repository.interfaces;

import com.alibiner.entity.BaseEntity;
import com.alibiner.exceptions.DataNotInsertException;

import java.sql.SQLException;
import java.util.*;

public interface ICRUDRepository<T extends BaseEntity> {
    int save(T entity) throws SQLException, DataNotInsertException;
    T update(T entity);
    void delete(int id);
    List<T> getAll();
    T getById(int id) throws SQLException;
}
