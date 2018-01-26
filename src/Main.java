package project_Ivankov;

import java.sql.SQLException;
import java.util.Scanner;

/**
 * Created by Admin on 01.09.2017.
 */
public class Main {
    public static void main(String[] args) throws SQLException {
        DBHelper db = new DBHelper();
        Scanner sc = new Scanner(System.in);
        System.out.println("Введите 1 для вывода марки автомобиля");
        System.out.println("Введите 2 для вывода списка салонов ");
        System.out.println("Введите 3 для вывода доступных автомобилей в каждом салоне");
        switch (sc.nextLine()) {
            case "1":
                System.out.println(db.getBrands());
                System.out.println("Введите название бренда");
                System.out.println(db.getVehicles(sc.nextLine()));
                break;
            case "2":
                System.out.println(db.getSalon());
                break;
            case "3":
                System.out.println(db.getSalonVehicle());
                break;
        }



    }

}
