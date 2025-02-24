package porky.DAO;

import org.sql2o.Connection;
import org.sql2o.Sql2o;
import porky.config.DataBaseConnection;
import porky.interfaces.IPasosDAO;
import porky.models.Pasos;

public class PasosDAO implements IPasosDAO{
    private Sql2o sql2o;

    public PasosDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    @Override
    public void agregarPaso(Pasos paso){
        String sql = "INSERT INTO `pasos` (idPaso, descripcionPaso, idReceta) VALUES (:idPaso, :descripcionPaso, :idReceta)";
        try (Connection con = sql2o.open()){
            con.createQuery(sql, true).bind(paso).executeUpdate();
        }
    }
}
