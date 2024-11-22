package porky.interfaces;

import java.util.List;

import porky.models.RecetasDerivadas;
import porky.models.RecetasDerivadasXrecetasBases;

public interface IRecetasDerivadasDAO {
    
    public void agregarRecetaDerivada(RecetasDerivadas recetaDerivada);
    public void agregarRecetasDerivadasXrecetasBases(RecetasDerivadasXrecetasBases recetaDerivadaXrecetaBase);
    public List<RecetasDerivadas> listarRecetasDerivadas();
    public List<RecetasDerivadasXrecetasBases> listarRecetasDerivadasXrecetasBases();

}
