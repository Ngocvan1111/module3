package repository.iplm;

import model.BenhAn;
import model.BenhNhan;
import repository.BaseRepository;
import repository.IBenhAnRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BenhAnRepository implements IBenhAnRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<BenhAn> findAll() throws SQLException {
        String query = "CALL find_all();";
        List<BenhAn> benhAnList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             CallableStatement preparedStatement = connection.prepareCall(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maBenhAn = resultSet.getString("ma_benh_an");
                String maBenhNhan = resultSet.getString("ma_benh_nhan");
                String ngayNhapVien = resultSet.getString("ngay_nhap_vien");
                String[] ngayNhapVienAr = ngayNhapVien.split("-");
                ngayNhapVien = ngayNhapVienAr[2]+"-"+ngayNhapVienAr[1]+"-"+ngayNhapVienAr[0];
                String ngayRaVien = resultSet.getString("ngay_ra_vien");
                String[] ngayRaVienAr = ngayRaVien.split("-");
                ngayRaVien = ngayRaVienAr[2]+"-"+ngayRaVienAr[1]+"-"+ngayRaVienAr[0];
                String lyDo = resultSet.getString("ly_do_nhap_vien");
                String tenBenhNhan = resultSet.getString("ten_benh_nhan");
                BenhNhan benhNhan = new BenhNhan(maBenhNhan,tenBenhNhan);
                benhAnList.add(new BenhAn(maBenhAn,maBenhNhan,ngayNhapVien,ngayRaVien,lyDo,benhNhan));

            }

        }
        return benhAnList;
    }

    @Override
    public boolean deleteBenhAn(int id) throws SQLException {
        boolean reDeleted;
        String query = "{call delete_benh_an(?)};";
        try (Connection connection = baseRepository.getConnection();
             CallableStatement preparedStatement = connection.prepareCall(query);
        ) {
            preparedStatement.setInt(1,id);
            reDeleted = preparedStatement.executeUpdate() > 0;

        }
        return reDeleted;
    }
}
