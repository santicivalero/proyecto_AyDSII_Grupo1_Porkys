package porky.controllers;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import porky.DAO.RecetasBasesDAO;
import porky.DAO.RecetasDAO;
import porky.DAO.RecetasDerivadasDAO;
import porky.models.Recetas;
import porky.models.RecetasBases;
import porky.models.RecetasDerivadas;
import porky.models.RecetasDerivadasXrecetasBases;
import spark.Request;
import spark.Response;
import spark.Route;

public class RecetasControlador {

    private static RecetasDerivadasDAO recetaDerivadaDAO = new RecetasDerivadasDAO();
    private static RecetasDAO recetaDAO = new RecetasDAO();
    private static RecetasBasesDAO recetaBasesDAO = new RecetasBasesDAO();

    private static Gson gson = new Gson();

    public static Route listarRecetas = (Request req, Response res) -> {
        try {
            List<RecetasDerivadas> recetasDerivadas = recetaDerivadaDAO.listarRecetasDerivadas();
            List<Recetas> recetas = recetaDAO.listarRecetas();
            List<RecetasBases> recetasBases = recetaBasesDAO.listarRecetasBases();
            List<RecetasDerivadasXrecetasBases> recetasDerivadasXrecetasBases = recetaDerivadaDAO
                    .listarRecetasDerivadasXrecetasBases();

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

            for (RecetasBases recetaBase : recetasBases) {

                JsonObject jsonRecetaBase = new JsonObject();
                jsonRecetaBase.addProperty("idRecetaBase", recetaBase.getIdRecetaBase());
                jsonRecetaBase.addProperty("idReceta", recetaBase.getIdReceta());
                jsonRecetaBase.addProperty("tamaño", recetaBase.getTamaño());

                Recetas receta = recetas.stream()
                        .filter(r -> r.getIdReceta() == recetaBase.getIdReceta())
                        .findFirst()
                        .orElse(null);

                jsonRecetaBase.addProperty("nombre", receta.getNombre());
                jsonRecetaBase.addProperty("tiempoPreparacion", receta.getTiempoPreparacion());
                jsonRecetaBase.addProperty("porciones", receta.getPorciones());

                jsonArray.add(jsonRecetaBase);

            }

            return gson.toJson(jsonArray);

        } catch (Exception e) {
            res.status(500);
            return "Error interno del servidor: " + e.getMessage();
        }
    };
}
