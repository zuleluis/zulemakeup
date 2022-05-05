package datos.DAO;

import datos.Conexion;
import modelo.Productos;
import modelo.auxiliares.JoinProductos;
import modelo.catalogos.Tipos;
import modelo.catalogos.Aplicacion;
import modelo.catalogos.Marcas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ProductosDAO {
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Productos producto;
    private Marcas marca;
    private Tipos tipo;
    private Aplicacion aplicacion;

    public ProductosDAO(Connection connection){
        this.connection = connection;
    }

    //Muestra la lista de productos
    public LinkedList<JoinProductos> getProductos() throws SQLException {
        LinkedList<JoinProductos> lista = new LinkedList<>();

        this.ps = this.connection.prepareStatement("SELECT Marcas.nombre AS Marca, Productos.nombreProducto, Aplicacion.nombre as Aplicacion, Tipos.nombre as Tipo, Productos.modelo, Productos.cantidad, Productos.agotado FROM Productos\n" +
                "JOIN Marcas ON Productos.fkMarca = Marcas.idMarca\n" +
                "JOIN Aplicacion ON Productos.fkAplicacion = Aplicacion.idAplicacion\n" +
                "JOIN Tipos ON Productos.fkTipo = Tipos.idTipo\n");
        this.rs = ps.executeQuery();

        while (rs.next()){
            String nombreMarca = rs.getString("Marca");
            marca = new Marcas(nombreMarca);

            String nombreTipo = rs.getString("Tipo");
            tipo = new Tipos(nombreTipo);

            String nombreAplicacion = rs.getString("Aplicacion");
            aplicacion = new Aplicacion(nombreAplicacion);

            String nombreProducto = rs.getString("nombreProducto");
            String modelo = rs.getString("modelo");
            int cantidad = rs.getInt("cantidad");
            boolean agotado = rs.getBoolean("agotado");

            producto = new Productos(nombreProducto, modelo, cantidad, agotado);

            JoinProductos auxProducto = new JoinProductos(producto, marca, tipo, aplicacion);
            lista.add(auxProducto);

        }

        Conexion.close(rs);
        Conexion.close(ps);


        for(JoinProductos elemento: lista){
            String disponibilidad = (elemento.getProducto().isAgotado())? "Agotado" :"Disponible";
            System.out.println(elemento.getMarca().getNombre() + " - " + elemento.getProducto().getNombreProducto() + " - " + elemento.getAplicacion().getNombre() + " - " + elemento.getTipo().getNombre() + " - " + elemento.getProducto().getModelo() + " - " + elemento.getProducto().getCantidad() + " - " + disponibilidad);
            //System.out.println(elemento.getMarca() + " - " + elemento.getProducto() + " - " +  elemento.getAplicacion() + " - " + elemento.getTipo());
        }

        return lista;
    }

}
