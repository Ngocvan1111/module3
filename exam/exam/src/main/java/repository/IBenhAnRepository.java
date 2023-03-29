package repository;

import model.BenhAn;

import java.sql.SQLException;
import java.util.List;

public interface IBenhAnRepository {
    List<BenhAn> findAll() throws SQLException;
    boolean deleteBenhAn(int id) throws SQLException;

}
