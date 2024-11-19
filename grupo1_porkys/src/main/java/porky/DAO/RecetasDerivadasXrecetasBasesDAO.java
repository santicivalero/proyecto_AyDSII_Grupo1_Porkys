package porky.DAO;

import java.util.List;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import porky.config.DataBaseConnection;
import porky.models.RecetasDerivadasXrecetasBases;


public class RecetasDerivadasXrecetasBasesDAO {
    private Sql2o sql2o;

    public RecetasDerivadasXrecetasBasesDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    public List<RecetasDerivadasXrecetasBases> listarRecetasDerivadasXrecetasBases(){
        String sql = "SELECT * FROM `recetasderivadasxrecetasbases`";

        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .executeAndFetch(RecetasDerivadasXrecetasBases.class);
        }

    }
}
