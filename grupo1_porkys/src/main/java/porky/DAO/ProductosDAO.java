package porky.DAO;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import porky.config.DataBaseConnection;
import porky.models.Productos;

import java.util.List;

public class ProductosDAO {
    private Sql2o sql2o;

    public ProductosDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    public List<Productos> buscarProducto(String productoAbuscar) {
        String sql = "SELECT * FROM `productos` WHERE `nombre` LIKE :nombre";

        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .addParameter("nombre", "%" + productoAbuscar + "%")
                    .executeAndFetch(Productos.class);
        }
    }
}
