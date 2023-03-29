package repository.iplm;

import model.Room;
import model.TypePay;
import repository.BaseRepository;
import repository.IRoomRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomRepository implements IRoomRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Room> findAll()  {
        String query = "{call find_all()};";
        List<Room> roomList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             CallableStatement preparedStatement = connection.prepareCall(query)
        ) {
            ResultSet rs =  preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("room_id");
                String name = rs.getString("name");
                String phoneNumber = rs.getString("phone_number");
                String startDay = rs.getString("start_day");

                String[] startDayAr = startDay.split("-");
                startDay = startDayAr[2]+"-"+startDayAr[1]+"-"+startDayAr[0];

                int typePayId = rs.getInt("type_pay_id");
                String typePayName = rs.getString("type_pay_name");
                String note = rs.getString("note");
                TypePay typePay = new TypePay(typePayId,typePayName);
                roomList.add(new Room(id,name,phoneNumber,startDay,typePayId,note,typePay));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }

        return roomList;
    }

    @Override
    public List<TypePay> findAllTypePay() throws SQLException {
        String query ="select * from type_pay";
        List<TypePay> typePayList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                typePayList.add(new TypePay(id,name));
            }

        }
        return typePayList;
    }

    @Override
    public boolean deleteRoom(int id) throws SQLException {
        boolean rowDeleted;
        String query = "delete from room where room_id = ?;";
        try (Connection connection =baseRepository.getConnection();PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
