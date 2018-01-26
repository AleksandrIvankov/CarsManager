package project_Ivankov;

import java.sql.*;

/**
 * Created by Admin on 01.09.2017.
 */
public class DBHelper {
    private final String url = "jdbc:mysql://localhost:3306/ivankov?useSSL=false";
    private final String user = "root";
    private final String password = "kappa123";

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;

    public DBHelper() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void connect() throws SQLException {
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();
    }

    private void close() {
        try {
            conn.close();
            stmt.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getVehicles(String brand) throws SQLException {
        connect();
        rs = stmt.executeQuery("SELECT brands.name, model, price FROM vehicle JOIN brands ON vehicle.brand = brands.id" +
                (brand.toLowerCase().equals("all") ? "" : (" WHERE brands.name='" + brand + "'")));
        String result = "*******************************************\n*    Brand    *    Model    *    Price    *\n*******************************************";
        while (rs.next()) {
            result += String.format("\n* %11s * %11s * %11d *", rs.getString("brands.name"), rs.getString("model"), rs.getInt("price"));
        }
        result += "\n*******************************************";
        close();
        return result;
    }

    public String getBrands() throws SQLException {
        connect();
        rs = stmt.executeQuery("SELECT brands.name FROM brands");
        String result = "Список доступных брендов";
        while (rs.next()) {
            result += "\n" + rs.getString("brands.name");
        }
        close();
        return result;

    }

    public String getSalon() throws SQLException {
        connect();
        rs = stmt.executeQuery("SELECT name,postal_code,address, working_hours FROM salon ");
        String result = "*****************************************************************************************\n" +
                "*     Name     *  Postal_Code  *               Address                *  Working_hours  *\n" +
                "*****************************************************************************************";
        while (rs.next()) {
            result += String.format("\n* %12s * %13d * %36s * %15s *", rs.getString("name"),
                    rs.getInt("postal_code"), rs.getString("address"), rs.getString("working_hours"));
        }
        result += "\n*****************************************************************************************";
        close();
        return result;
    }

    public String getSalonVehicle() throws SQLException {
        connect();
        rs = stmt.executeQuery("SELECT salon.name, brands.name, vehicle.model FROM salon_vehicle " +
                "JOIN salon ON salon_vehicle.salon = salon.id JOIN vehicle ON salon_vehicle.vehicle = vehicle.id JOIN brands ON vehicle.brand = brands.id ORDER BY salon.name");
        String result = "***************************************\n*    Salon    *    Brand    *  Model  *\n***************************************";

        while (rs.next()) {
            result += String.format("\n* %11s * %11s * %7s *", rs.getString("salon.name"), rs.getString("brands.name"), rs.getString("vehicle.model"));
        }
        result += "\n***************************************";
        close();
        return result;
    }
}
