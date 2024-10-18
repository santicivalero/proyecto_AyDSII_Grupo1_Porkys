package porky;

import static spark.Spark.*;

import porky.controllers.ProductoControlador;
//import porky.controllers.RecetaControlador;

public class PorkyMain {
    public static void main(String[] args) {
        get("/porky/producto/:nombre", ProductoControlador.buscarProducto);
        //post("/porky/receta", RecetaControlador.agregarReceta);
    }
}
