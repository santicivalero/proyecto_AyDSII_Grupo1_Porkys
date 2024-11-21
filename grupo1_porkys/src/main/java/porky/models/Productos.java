package porky.models;

import lombok.Data;

@Data
public class Productos {

    private int idProducto;
    private String nombre;
    private int precio;
    private int stock;
    private Boolean sinTacc;
    private String tamaño;
    private int idReceta;
    private int idRecetaDerivada;

}
