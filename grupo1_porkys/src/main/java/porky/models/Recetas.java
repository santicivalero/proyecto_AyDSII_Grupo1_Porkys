package porky.models;

import lombok.Data;

@Data
public class Recetas {

    private int idReceta;
    private String nombre;
    private String tiempoPreparacion;
    private int porciones;
    
}
