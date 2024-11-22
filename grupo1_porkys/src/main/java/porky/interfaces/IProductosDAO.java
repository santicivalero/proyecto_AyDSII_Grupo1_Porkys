package porky.interfaces;

import java.util.List;

import porky.models.Productos;

public interface IProductosDAO {
    
    public List<Productos> buscarProducto(String productoAbuscar);

}