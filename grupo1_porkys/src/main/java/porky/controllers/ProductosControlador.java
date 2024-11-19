package porky.controllers;

import java.util.List;
import spark.*;
import com.google.gson.Gson;
import porky.DAO.ProductosDAO;
import porky.models.Productos;

public class ProductosControlador {
    private static ProductosDAO productoDAO = new ProductosDAO();
    private static Gson gson = new Gson();

    public static Route buscarProducto = (Request req, Response res) -> {
        try {
            List<Productos> productos = productoDAO.buscarProducto(req.params(":nombre"));
            return gson.toJson(productos);
        } catch (Exception e) {
            res.status(500);
            return "Error interno del servidor: " + e.getMessage();
        }
    };

    public static Route agregarProducto = (Request req, Response res) -> {
        try {
            productoDAO.insert(gson.fromJson(req.body(), Productos.class));
            return "Producto agregado con exito";
        } catch (Exception e) {
            res.status(500);
            return "Error interno del servidor: " + e.getMessage();
        }
    };
}
