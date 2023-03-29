package service;

import model.BenhAn;
import repository.iplm.BenhAnRepository;

import java.sql.SQLException;
import java.util.List;

public class BenhAnService implements IBenhAnService {
    BenhAnRepository benhAnRepository = new BenhAnRepository();
    @Override
    public List<BenhAn> findAll() throws SQLException {
        return benhAnRepository.findAll();
    }

    @Override
    public boolean deleteBenhAn(int id) {
        return false;
    }
}
