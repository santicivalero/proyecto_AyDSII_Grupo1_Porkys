package porky.DAO;

import java.util.List;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import porky.config.DataBaseConnection;
import porky.models.RecetasBases;


public class RecetasBasesDAO {
    private Sql2o sql2o;

    public RecetasBasesDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    public List<RecetasBases> listarRecetasBases(){
        String sql = "SELECT * FROM `recetasbases`";

        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .executeAndFetch(RecetasBases.class);
        }

    }
}

