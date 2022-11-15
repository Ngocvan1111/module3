package service;

import model.Room;
import model.TypePay;

import java.sql.SQLException;
import java.util.List;

public interface IRoomService {
    List<Room> findAll() throws SQLException;
    List<TypePay> findAllTypePay() throws SQLException;
}
