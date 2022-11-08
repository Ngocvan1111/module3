package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
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
