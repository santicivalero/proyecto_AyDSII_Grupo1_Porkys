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
import porky.DAO.RecetasBasesDAO;
import porky.DAO.RecetasDerivadasXrecetasBasesDAO;
import porky.models.IngredientesXrecetas;
import porky.models.Pasos;
import porky.models.Recetas;
import porky.models.RecetasBases;
import porky.models.RecetasDerivadas;
import porky.models.RecetasDerivadasXrecetasBases;
import spark.Route;
import java.util.List;

import com.google.gson.JsonArray;

public class RecetasDerivadasControlador {

    private static RecetasDerivadasDAO recetaDerivadaDAO = new RecetasDerivadasDAO();
    private static RecetasDAO recetaDAO = new RecetasDAO();
    private static RecetasBasesDAO recetaBasesDAO = new RecetasBasesDAO();
    private static RecetasDerivadasXrecetasBasesDAO recetasDerivadasXrecetasBasesDAO = new RecetasDerivadasXrecetasBasesDAO();
    private static PasosDAO pasoDAO = new PasosDAO();

    private static Gson gson = new Gson();

    public static Route agregarRecetaDerivada = (Request req, Response res) -> {
        try {
            Recetas receta = gson.fromJson(req.body(), Recetas.class);
            RecetasDerivadas recetaDerivada = gson.fromJson(req.body(), RecetasDerivadas.class);
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

            if (receta == null || receta.getNombre() == null || receta.getTiempoPreparacion() == null
                    || receta.getPorciones() <= 0) {
                res.status(400);
                return "Error: Datos de la receta no válidos o incompletos.";
            }
            if (pasos == null || pasos.isEmpty()) {
                res.status(400);
                return "Error: La lista de pasos no puede ser nula o vacía.";
            }
            if (recetaDerivadaXrecetasBases == null || recetaDerivadaXrecetasBases.isEmpty()) {
                res.status(400);
                return "Error: La lista de recetas derivadas no puede ser nula o vacía.";
            }

            recetaDAO.agregarReceta(receta);
            recetaDerivadaDAO.agregarRecetaDerivada(recetaDerivada);
            if (ingredientesXrecetas != null && !ingredientesXrecetas.isEmpty()) {
                ingredientesXrecetas.forEach(ingredienteXreceta -> {
                    recetaDAO.agregarIngredienteXreceta(ingredienteXreceta);
                });
            }
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

    public static Route listarRecetasDerivadas = (Request req, Response res) -> {
        try {
            List<RecetasDerivadas> recetasDerivadas = recetaDerivadaDAO.listarRecetasDerivadas();
            List<Recetas> recetas = recetaDAO.listarRecetas();
            List<RecetasBases> recetasBases = recetaBasesDAO.listarRecetasBases();
            List<RecetasDerivadasXrecetasBases> recetasDerivadasXrecetasBases = recetasDerivadasXrecetasBasesDAO.listarRecetasDerivadasXrecetasBases();

            JsonArray jsonArray = new JsonArray();

            for (RecetasDerivadas recetaDerivada : recetasDerivadas) {

                JsonObject jsonRecetaDerivada = new JsonObject();
                jsonRecetaDerivada.addProperty("idRecetaDerivada", recetaDerivada.getIdRecetaDerivada());
                jsonRecetaDerivada.addProperty("idReceta", recetaDerivada.getIdReceta());

                Recetas receta = recetas.stream()
                        .filter(r -> r.getIdReceta() == recetaDerivada.getIdReceta())
                        .findFirst()
                        .orElse(null);

                jsonRecetaDerivada.addProperty("nombre", receta.getNombre());
                jsonRecetaDerivada.addProperty("tiempoPreparacion", receta.getTiempoPreparacion());
                jsonRecetaDerivada.addProperty("porciones", receta.getPorciones());

                JsonArray recetasBaseArray = new JsonArray();
                recetasDerivadasXrecetasBases.stream()
                        .filter(rxb -> rxb.getIdRecetaDerivada() == recetaDerivada.getIdRecetaDerivada())
                        .forEach(rxb -> {
                            RecetasBases recetaBase = recetasBases.stream()
                                    .filter(rb -> rb.getIdRecetaBase() == rxb.getIdRecetaBase())
                                    .findFirst()
                                    .orElse(null);

                            JsonObject jsonRecetaBase = new JsonObject();
                            jsonRecetaBase.addProperty("idRecetaBase", recetaBase.getIdRecetaBase());
                            jsonRecetaBase.addProperty("tamaño", recetaBase.getTamaño());
                            jsonRecetaBase.addProperty("idReceta", recetaBase.getIdReceta());

                            Recetas recetaBaseDetalle = recetas.stream()
                                    .filter(r -> r.getIdReceta() == recetaBase.getIdReceta())
                                    .findFirst()
                                    .orElse(null);

                            jsonRecetaBase.addProperty("nombre", recetaBaseDetalle.getNombre());
                            jsonRecetaBase.addProperty("tiempoPreparacion", recetaBaseDetalle.getTiempoPreparacion());
                            jsonRecetaBase.addProperty("porciones", recetaBaseDetalle.getPorciones());

                            recetasBaseArray.add(jsonRecetaBase);
                        });

                jsonRecetaDerivada.add("idRecetasBase", recetasBaseArray);

                jsonArray.add(jsonRecetaDerivada);

            }

            return gson.toJson(jsonArray);

        } catch (Exception e) {
            res.status(500);
            return "Error interno del servidor: " + e.getMessage();
        }
    };
}
