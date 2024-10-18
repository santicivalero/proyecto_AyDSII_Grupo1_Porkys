package porky.DAO;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import porky.config.DataBaseConnection;
import porky.models.Producto;

import java.util.List;

public class ProductoDAO {
    private Sql2o sql2o;

    public ProductoDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    public List<Producto> buscarProducto(String nombre) {
        String sql = "SELECT * FROM `Receta` WHERE nombre = :nombre";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql).executeAndFetch(Producto.class);
        }
    }
}
