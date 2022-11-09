package dao;

import model.User;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private String jdbcUsername = "root";
    private String jdbcPassWord = "Ngocvan1";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?,?,?);";
    private static final String SELECT_USER_BY_ID = "select id, name, email, country from users where id =?";
    private static final String SELECT_ALL_USERS = "select*from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?, email=?,country=? where id = ?;";
    private static final String SELECT_ALL_USERS_AND_ARRANGE = "select* from users order by users.name;";
    private static final String SQL_INSERT = "INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE) VALUES (?,?,?)";

    private static final String SQL_UPDATE = "UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?";

    private static final String SQL_TABLE_CREATE = "CREATE TABLE EMPLOYEE"

            + "("

            + " ID serial,"

            + " NAME varchar(100) NOT NULL unique,"

            + " SALARY numeric(15, 2) NOT NULL,"

            + " CREATED_DATE timestamp,"

            + " PRIMARY KEY (ID)"

            + ")";

    private static final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";
    public UserDAO() {
    }
    private Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassWord);
        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<User> selectAllUsers() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> users = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }




    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    public List<User> selectAllUsersAndArrange() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> usersArrange = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS_AND_ARRANGE);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                usersArrange.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return usersArrange;
    }

    @Override
    public User getUserById(int id) {
        User user = null;
        String query = "{CALL get_user_by_id(?)}";
        try {
            try (Connection connection = getConnection();
                 CallableStatement callableStatement = connection.prepareCall(query);){
                callableStatement.setInt(1,id);
                ResultSet rs = callableStatement.executeQuery();
                while (rs.next()){
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString ("country");
                    user = new User(name,email,country);
                }

            }
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) {
        String query = "{CALL insert_user(?,?,?)}";
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query);){
            callableStatement.setString(1,user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3, user.getCountry());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }


    }

    @Override
    public void addUserTransaction(User user, int[] permisions) {
        Connection connection =null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmtAssignemt = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            pstmt = connection.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getCountry());
            int rowAffected = pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();
            int userId = 0;
            if(rs.next())
                userId = rs.getInt(1);
            if (rowAffected ==1) {
                String sqlPivot = "INSERT INTO user_permision(user_id,permision_id)" + "Value(?,?)";
                pstmtAssignemt = connection.prepareStatement(sqlPivot);
                for (int permisionId : permisions) {
                    pstmtAssignemt.setInt(1, userId);
                    pstmtAssignemt.setInt(2, permisionId);
                    pstmtAssignemt.executeUpdate();
                }
                connection.commit();
            }else {
                connection.rollback();
            }

        } catch (SQLException ex) {
            try {
                if(connection != null)
                    connection.rollback();

            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        }finally {
            try {
                if(rs != null)
                    rs.close();
                if(pstmt != null) pstmt.close();
                if(pstmtAssignemt != null) pstmtAssignemt.close();
                if(connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }


    }

    @Override

    public void insertUpdateWithoutTransaction() {

        try (Connection conn = getConnection();

             Statement statement = conn.createStatement();

             PreparedStatement psInsert = conn.prepareStatement(SQL_INSERT);

             PreparedStatement psUpdate = conn.prepareStatement(SQL_UPDATE)) {



            statement.execute(SQL_TABLE_DROP);

            statement.execute(SQL_TABLE_CREATE);



            // Run list of insert commands

            psInsert.setString(1, "Quynh");

            psInsert.setBigDecimal(2, new BigDecimal(10));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            psInsert.setString(1, "Ngan");

            psInsert.setBigDecimal(2, new BigDecimal(20));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            // Run list of update commands



            // below line caused error, test transaction

            // org.postgresql.util.PSQLException: No value specified for parameter 1.

            psUpdate.setBigDecimal(2, new BigDecimal(999.99));



            //psUpdate.setBigDecimal(1, new BigDecimal(999.99));

            psUpdate.setString(2, "Quynh");

            psUpdate.execute();



        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    @Override
    public void insertUpdateUseTransaction() {
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             PreparedStatement psInsert = connection.prepareStatement(SQL_INSERT);
             PreparedStatement psUpdate = connection.prepareStatement(SQL_UPDATE)){
            statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);
            connection.setAutoCommit(false);
            psInsert.setString(1,"Quynh");
            psInsert.setBigDecimal(2,new BigDecimal(10));
            psInsert.setTimestamp(3,Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();

            psInsert.setString(1,"Ngan");
            psInsert.setBigDecimal(2, new BigDecimal(20));
            psInsert.setTimestamp(3,Timestamp.valueOf(LocalDateTime.now()));

            psUpdate.setBigDecimal(2,new BigDecimal(999.99));
            psUpdate.setString(2,"Quynh");
            psUpdate.execute();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> selectAllUsersUseCS() {
        String query = "{CALL select_all()}";
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> users = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             CallableStatement callableStatement = connection.prepareCall(query);) {
            System.out.println(callableStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = callableStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;

    }

    @Override
    public boolean updateUserUseCS(User user) {
        boolean rowUpdated = false;
        String query = "{call update_user(?,?,?,?)}";
        try (Connection connection = getConnection(); CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            callableStatement.setInt(1, user.getId());
            rowUpdated = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public boolean deleteUserUseCS(int id) throws SQLException {
        boolean rowDeleted;
        String query = "{call delete_user(?)}";
        try (Connection connection = getConnection(); CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_SQL);) {
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public void addUserTransaction() {
            try (Connection connection = getConnection();
                 Statement statement = connection.createStatement();
                 PreparedStatement psInsert = connection.prepareStatement(SQL_INSERT);
                 PreparedStatement psUpdate = connection.prepareStatement(SQL_UPDATE)){
                statement.execute(SQL_TABLE_DROP);
                statement.execute(SQL_TABLE_CREATE);
                connection.setAutoCommit(false);
                psInsert.setString(1,"Quynh");
                psInsert.setBigDecimal(2,new BigDecimal(10));
                psInsert.setTimestamp(3,Timestamp.valueOf(LocalDateTime.now()));

                Savepoint savepoint1 = connection.setSavepoint("ROWS_ADD1");

                psUpdate.setString(1,"Quynh");
                psUpdate.execute();
                connection.rollback(savepoint1);
                connection.commit();
                connection.setAutoCommit(true);




            } catch (SQLException e) {
                e.printStackTrace();
            }


    }


}
