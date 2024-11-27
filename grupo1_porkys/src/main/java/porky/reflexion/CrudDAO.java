package porky.reflexion;

import java.lang.reflect.Field;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import porky.config.DataBaseConnection;

public abstract class CrudDAO<T> {

    private Sql2o sql2o;

    public CrudDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    abstract public Class<T> getTClass();

    abstract public String getTablePK();

    abstract public String getTableName();

    public void insert(T t) {

        Field[] fields = t.getClass().getDeclaredFields();

        String valuesInsertSQL = "(";
        String columnsInsertSQL = "(";

        for (Field field : fields) {
            columnsInsertSQL += field.getName();
            valuesInsertSQL += ":" + field.getName();

            if (!field.equals(fields[fields.length - 1])) {
                columnsInsertSQL += ", ";
                valuesInsertSQL += ", ";
            }

        }

        columnsInsertSQL += ")";
        valuesInsertSQL += ")";

        String sql = "INSERT INTO `" + this.getTableName() + "` " + columnsInsertSQL + " VALUES " + valuesInsertSQL;

        try (Connection con = sql2o.open()) {
            con.createQuery(sql).bind(t).executeUpdate();
        }
    }

}
