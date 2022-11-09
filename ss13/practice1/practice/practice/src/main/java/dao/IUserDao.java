package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> selectAllUsersAndArrange();

    User getUserById(int id) throws SQLException;

    void insertUserStore(User user);

    void addUserTransaction(User user, int[] permisions);

    void insertUpdateWithoutTransaction();

    void insertUpdateUseTransaction();

    // bài tập 1 ss14

    List<User> selectAllUsersUseCS();

    boolean updateUserUseCS(User user);

    boolean deleteUserUseCS(int id) throws SQLException;


    // bài tap 2 ss14
    void addUserTransaction();


}
