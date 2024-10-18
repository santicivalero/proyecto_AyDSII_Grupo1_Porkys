package porky.DAO;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import porky.config.DataBaseConnection;
import porky.models.Receta;

public class RecetaDAO {
    private Sql2o sql2o;

    public RecetaDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    public void agregarReceta(Receta receta){
        String sql = "INSERT INTO `Receta` (idReceta, nombre, tiempoPreparacion, porciones) VALUES (:idReceta, :nombre, :tiempoPreparacion, :porciones)";
        try (Connection con = sql2o.open()){
            con.createQuery(sql, true).bind(receta).executeUpdate();
        }
    }
}
