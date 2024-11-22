package porky.DAO;

import java.util.List;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import porky.config.DataBaseConnection;
import porky.interfaces.IRecetasDAO;
import porky.models.IngredientesXrecetas;
import porky.models.Recetas;

public class RecetasDAO implements IRecetasDAO {
    private Sql2o sql2o;

    public RecetasDAO() {
        this.sql2o = DataBaseConnection.getInstance();
    }

    @Override
    public void agregarReceta(Recetas receta) {
        String sql = "INSERT INTO `recetas` (idReceta, nombre, tiempoPreparacion, porciones) VALUES (:idReceta, :nombre, :tiempoPreparacion, :porciones)";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql, true).bind(receta).executeUpdate();
        }
    }

    @Override
    public void agregarIngredienteXreceta(IngredientesXrecetas ingredienteXreceta) {
        String sql = "INSERT INTO `ingredientesxrecetas` (idIngrediente, idReceta, cantidad) VALUES (:idIngrediente, :idReceta, :cantidad)";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql, true).bind(ingredienteXreceta).executeUpdate();
        }
    }

    @Override
    public List<Recetas> listarRecetas() {
        String sql = "SELECT * FROM `recetas`";

        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .executeAndFetch(Recetas.class);
        }

    }
}
