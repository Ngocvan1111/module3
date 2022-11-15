package service.iplm;

import model.Room;
import model.TypePay;
import repository.iplm.RoomRepository;
import service.IRoomService;

import java.sql.SQLException;
import java.util.List;

public class RoomService implements IRoomService {
    RoomRepository roomRepository = new RoomRepository();
    @Override
    public List<Room> findAll() throws SQLException {
        return roomRepository.findAll();
    }

    @Override
    public List<TypePay> findAllTypePay() throws SQLException {
        return roomRepository.findAllTypePay();
    }
}
