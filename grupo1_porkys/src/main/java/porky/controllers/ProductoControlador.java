package porky.controllers;

import java.util.List;
import spark.*;
import com.google.gson.Gson;
import porky.DAO.ProductoDAO;
import porky.models.Producto;
import spark.Route;

public class ProductoControlador {
    private static ProductoDAO dao;
    private static Gson gson = new Gson();

    public static Route buscarProducto = (Request req, Response res) -> {
        try {
            List<Producto> productos = dao.buscarProducto(req.params(":nombre"));
            return gson.toJson(productos);
        } catch (Exception e) {
            res.status(500);
            return "Error interno del servidor: " + e.getMessage();
        }
    };
}
