package porky.models;

import lombok.Data;

@Data
public class Producto {

    private int idProducto;
    private String nombre;
    private int precio;
    private Boolean sinTacc;
    private String tamano;

}
