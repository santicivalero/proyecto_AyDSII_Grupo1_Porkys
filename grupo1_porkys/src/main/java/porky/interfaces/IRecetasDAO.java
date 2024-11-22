package porky.interfaces;

import java.util.List;

import porky.models.IngredientesXrecetas;
import porky.models.Recetas;

public interface IRecetasDAO {

    public void agregarReceta(Recetas receta);

    public void agregarIngredienteXreceta(IngredientesXrecetas ingredienteXreceta);

    public List<Recetas> listarRecetas();

}
