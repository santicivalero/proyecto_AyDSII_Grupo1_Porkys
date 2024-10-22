package porky.config;

import org.sql2o.Sql2o;

public class DataBaseConnection {
    private static Sql2o sql2o;

    private DataBaseConnection() {
    }

    public static Sql2o getInstance() {
        if (sql2o == null) {
            sql2o = new Sql2o("jdbc:mysql://localhost:3306/porkycakesbd", "root", "");
        }
        return sql2o;
    }
}
