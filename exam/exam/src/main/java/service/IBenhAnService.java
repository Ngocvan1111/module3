package service;

import model.BenhAn;

import java.sql.SQLException;
import java.util.List;

public interface IBenhAnService {
    List<BenhAn> findAll() throws SQLException;
    boolean deleteBenhAn(int id);
}
