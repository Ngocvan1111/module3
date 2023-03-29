package repository;

import model.Room;
import model.TypePay;

import java.sql.SQLException;
import java.util.List;

public interface IRoomRepository {
    List<Room> findAll() throws SQLException;
    List<TypePay> findAllTypePay() throws SQLException;
    boolean deleteRoom(int id) throws SQLException;
}
