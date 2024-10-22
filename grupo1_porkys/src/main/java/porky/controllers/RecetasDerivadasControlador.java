package porky.controllers;

import spark.Request;
import spark.Response;

import java.util.ArrayList;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import porky.DAO.RecetasDerivadasDAO;
import porky.DAO.PasosDAO;
import porky.DAO.RecetasDAO;
import porky.models.IngredientesXrecetas;
import porky.models.Pasos;
import porky.models.Recetas;
import porky.models.RecetasDerivadas;
import porky.models.RecetasDerivadasXrecetasBases;
import spark.Route;

public class RecetasDerivadasControlador {

    private static RecetasDerivadasDAO recetaDerivadaDAO = new RecetasDerivadasDAO();
    private static RecetasDAO recetaDAO = new RecetasDAO();
    private static PasosDAO pasoDAO = new PasosDAO();

    private static Gson gson = new Gson();

    public static Route agregarRecetaDerivada = (Request req, Response res) -> {
        try {

            ArrayList<IngredientesXrecetas> ingredientesXrecetas = gson.fromJson(
                    gson.fromJson(req.body(), JsonObject.class).get("ingredientesXrecetas").toString(),
                    new TypeToken<ArrayList<IngredientesXrecetas>>() {
                    }.getType());
            ArrayList<Pasos> pasos = gson.fromJson(gson.fromJson(req.body(), JsonObject.class).get("pasos").toString(),
                    new TypeToken<ArrayList<Pasos>>() {
                    }.getType());
            ArrayList<RecetasDerivadasXrecetasBases> recetaDerivadaXrecetasBases = gson.fromJson(
                    gson.fromJson(req.body(), JsonObject.class).get("recetaDerivadaXrecetasBases").toString(),
                    new TypeToken<ArrayList<RecetasDerivadasXrecetasBases>>() {
                    }.getType());

            recetaDAO.agregarReceta(gson.fromJson(req.body(), Recetas.class));
            recetaDerivadaDAO.agregarRecetaDerivada(gson.fromJson(req.body(), RecetasDerivadas.class));
            ingredientesXrecetas.forEach(ingredienteXreceta -> {
                recetaDAO.agregarIngredienteXreceta(ingredienteXreceta);
            });
            pasos.forEach(paso -> {
                pasoDAO.agregarPaso(paso);
            });
            recetaDerivadaXrecetasBases.forEach(recetaDerivadaXrecetaBase -> {
                recetaDerivadaDAO.agregarRecetasDerivadasXrecetasBases(recetaDerivadaXrecetaBase);
            });
            res.status(201);
            return gson.toJson("Receta derivada cargada exitosamente");
        } catch (Exception e) {
            res.status(500);
            return "Error interno del servidor: " + e.getMessage();
        }
    };
}
