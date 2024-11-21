package porky.main;

import static spark.Spark.*;

import porky.controllers.ProductosControlador;
import porky.controllers.RecetasDerivadasControlador;
import porky.controllers.RecetasControlador;

public class PorkyMain {
    public static void main(String[] args) {
        get("/porky/producto/:nombre", ProductosControlador.buscarProducto);
        post("/porky/receta/derivada", RecetasDerivadasControlador.agregarRecetaDerivada);
        get("/porky/receta", RecetasControlador.listarRecetas);
        post("/porky/producto", ProductosControlador.agregarProducto);
    }
}
