package porky.DAO;

import org.sql2o.Connection;
import org.sql2o.Sql2o;
import porky.config.DataBaseConnection;
import porky.models.RecetasDerivadas;
import porky.models.RecetasDerivadasXrecetasBases;
import java.util.List;

public class RecetasDerivadasDAO {
    private Sql2o sql2o;

    public RecetasDerivadasDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    public void agregarRecetaDerivada(RecetasDerivadas recetaDerivada) {
        String sql = "INSERT INTO `recetasderivadas` (idRecetaDerivada, idReceta) VALUES (:idRecetaDerivada, :idReceta)";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql, true).bind(recetaDerivada).executeUpdate();
        }
    }

    public void agregarRecetasDerivadasXrecetasBases(RecetasDerivadasXrecetasBases recetaDerivadaXrecetaBase) {
        String sql = "INSERT INTO `recetasderivadasxrecetasbases` (idRecetaDerivada, idRecetaBase) VALUES (:idRecetaDerivada, :idRecetaBase)";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql, true).bind(recetaDerivadaXrecetaBase).executeUpdate();
        }
    }

    public List<RecetasDerivadas> listarRecetasDerivadas() {
        String sql = "SELECT * FROM `recetasderivadas`";

        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .executeAndFetch(RecetasDerivadas.class);
        }

    }

    public List<RecetasDerivadasXrecetasBases> listarRecetasDerivadasXrecetasBases() {
        String sql = "SELECT * FROM `recetasderivadasxrecetasbases`";

        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .executeAndFetch(RecetasDerivadasXrecetasBases.class);
        }

    }

}
