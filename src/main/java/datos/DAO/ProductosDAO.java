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
            /*System.out.println(elemento.getMarca().getNombre() + " - " + elemento.getProducto().getNombreProducto() + " - " + elemento.getAplicacion().getNombre() + " - " + elemento.getTipo().getNombre() + " - " + elemento.getProducto().getModelo() + " - " + elemento.getProducto().getCantidad() + " - " + disponibilidad);*/
            //System.out.println(elemento.getMarca() + " - " + elemento.getProducto() + " - " +  elemento.getAplicacion() + " - " + elemento.getTipo());
        }

        return lista;
    }

    //Obtiene los productos por idProducto
    public JoinProductos getProducto(int idProducto) throws SQLException{
        this.ps = this.connection.prepareStatement("SELECT Marcas.nombre as Marca, Productos.nombreProducto, Aplicacion.nombre as Aplicacion, Tipos.nombre as Tipo, Productos.idProducto, Productos.modelo, Productos.cantidad, Productos.agotado FROM Productos\n" +
                "JOIN Marcas ON Productos.fkMarca = Marcas.idMarca\n" +
                "JOIN Aplicacion ON Productos.fkAplicacion = Aplicacion.idAplicacion\n" +
                "JOIN Tipos ON Productos.fkTipo = Tipos.idTipo\n" +
                "WHERE idProducto = ?");
        this.ps.setInt(1, idProducto);
        this.rs = this.ps.executeQuery();

        if (!this.rs.next()){
            Conexion.close(rs);
            Conexion.close(ps);
            return null;
        }

        marca = new Marcas(rs.getString("Marca"));
        tipo = new Tipos(rs.getString("Tipo"));
        aplicacion = new Aplicacion(rs.getString("Aplicacion"));

        producto = new Productos(rs.getInt("idProducto"), rs.getString("nombreProducto"), rs.getString("modelo"), rs.getInt("cantidad"), rs.getBoolean("agotado"));

        JoinProductos auxProducto = new JoinProductos(producto, marca, tipo, aplicacion);

        Conexion.close(rs);
        Conexion.close(ps);

        //System.out.println(auxProducto);
        String disponibilidad = (auxProducto.getProducto().isAgotado())? "Agotado" :"Disponible";
        /*System.out.println(auxProducto.getMarca().getNombre() + " - " + auxProducto.getProducto().getNombreProducto() + " - " + auxProducto.getAplicacion().getNombre() + " - " + auxProducto.getTipo().getNombre() + " - " + auxProducto.getProducto().getModelo() + " - " + auxProducto.getProducto().getCantidad() + " - " + disponibilidad);*/

        return auxProducto;
    }

    //Obtiene producto "primitivo", es decir, solamente de la tabla Productos
    public Productos getProductoPrimitivo(int idProducto) throws SQLException{
        this.ps = this.connection.prepareStatement("SELECT * FROM Productos WHERE idProducto = ?;");
        this.ps.setInt(1, idProducto);
        this.rs = this.ps.executeQuery();

        if (!this.rs.next()){
            Conexion.close(rs);
            Conexion.close(ps);
            return null;
        }

        Productos auxProducto = new Productos(rs.getInt("fkMarca"), rs.getString("nombreProducto"), rs.getInt("fkAplicacion"), rs.getInt("fkTipo"), rs.getString("modelo"), rs.getInt("cantidad"), rs.getBoolean("agotado"));

        Conexion.close(rs);
        Conexion.close(ps);

        //System.out.println(auxProducto);
        return auxProducto;
    }

    //Inserta un producto
    public void insertaProducto(Productos producto) throws SQLException{
        this.ps = this.connection.prepareStatement("INSERT INTO Productos (fkMarca, nombreProducto, fkAplicacion, fkTipo, modelo, cantidad, agotado) VALUES (?, ?, ?, ?, ?, ?, ?);");
        ps.setInt(1, producto.getFkMarca());
        ps.setString(2, producto.getNombreProducto());
        ps.setInt(3, producto.getFkAplicacion());
        ps.setInt(4, producto.getFkTipo());
        ps.setString(5, producto.getModelo());
        ps.setInt(6, producto.getCantidad());
        ps.setBoolean(7, producto.isAgotado());

        ps.executeUpdate();
        //Conexion.close(ps);
    }

    //Elimina una producto
    public Productos eliminaProducto (int idProducto) throws SQLException{
        Productos auxProducto = getProductoPrimitivo(idProducto);

        if (auxProducto == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("DELETE FROM Productos WHERE idProducto=?");

        this.ps.setInt(1, idProducto);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxProducto;
    }

    //Modificar el nombre de un producto
    public Productos modificaNombre(int idProducto, String nombre) throws SQLException{
        Productos auxProducto = getProductoPrimitivo(idProducto);

        if (auxProducto == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Productos SET nombreProducto = ? WHERE idProducto = ?");

        this.ps.setString(1, nombre);
        this.ps.setInt(2, idProducto);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxProducto;
    }

    //Modificar la marca de un producto
    public Productos modificaMarca(int idProducto, int fkMarca) throws SQLException{
        Productos auxProducto = getProductoPrimitivo(idProducto);

        if (auxProducto == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Productos SET fkMarca = ? WHERE idProducto = ?");

        this.ps.setInt(1, fkMarca);
        this.ps.setInt(2, idProducto);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxProducto;
    }

    //Modificar el tipo de aplicación de un producto
    public Productos modificaAplicacion(int idProducto, int fkAplicacion) throws SQLException{
        Productos auxProducto = getProductoPrimitivo(idProducto);

        if (auxProducto == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Productos SET fkAplicacion = ? WHERE idProducto = ?");

        this.ps.setInt(1, fkAplicacion);
        this.ps.setInt(2, idProducto);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxProducto;
    }

    //Modificar el tipo de un producto
    public Productos modificaTipo(int idProducto, int fkTipo) throws SQLException{
        Productos auxProducto = getProductoPrimitivo(idProducto);

        if (auxProducto == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Productos SET fkTipo = ? WHERE idProducto = ?");

        this.ps.setInt(1, fkTipo);
        this.ps.setInt(2, idProducto);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxProducto;
    }

    //Modificar el modelo de un producto
    public Productos modificaModelo(int idProducto, String modelo) throws SQLException{
        Productos auxProducto = getProductoPrimitivo(idProducto);

        if (auxProducto == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Productos SET modelo = ? WHERE idProducto = ?");

        this.ps.setString(1, modelo);
        this.ps.setInt(2, idProducto);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxProducto;
    }

    //Modificar la cantidad de existencias de un producto
    public Productos modificaCantidad(int idProducto, int cantidad) throws SQLException{
        Productos auxProducto = getProductoPrimitivo(idProducto);

        if (auxProducto == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Productos SET cantidad = ? WHERE idProducto = ?");

        this.ps.setInt(1, cantidad);
        this.ps.setInt(2, idProducto);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxProducto;
    }

    //Modificar el estado de disponibilidad producto
    public Productos modificaDisponibilidad(int idProducto, boolean agotado) throws SQLException{
        Productos auxProducto = getProductoPrimitivo(idProducto);

        if (auxProducto == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Productos SET agotado = ? WHERE idProducto = ?");

        this.ps.setBoolean(1, agotado);
        this.ps.setInt(2, idProducto);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxProducto;
    }

    //Lista de marcas
    public LinkedList<Marcas> getMarcas() throws SQLException{
        LinkedList<Marcas> lista = new LinkedList<>();
        this.ps = this.connection.prepareStatement("SELECT * FROM Marcas");
        this.rs = ps.executeQuery();

        while (rs.next()){
            int idMarca = rs.getInt("idMarca");
            String nombre = rs.getString("nombre");
            marca = new Marcas(idMarca, nombre);
            lista.add(marca);
        }

        Conexion.close(rs);
        Conexion.close(ps);

        return lista;
    }

    //Lista de aplicación
    public LinkedList<Aplicacion> getAplicacion() throws SQLException{
        LinkedList<Aplicacion> lista = new LinkedList<>();
        this.ps = this.connection.prepareStatement("SELECT * FROM Aplicacion");
        this.rs = ps.executeQuery();

        while (rs.next()){
            int idAplicacion = rs.getInt("idAplicacion");
            String nombre = rs.getString("nombre");
            aplicacion = new Aplicacion(idAplicacion, nombre);
            lista.add(aplicacion);
        }

        Conexion.close(rs);
        Conexion.close(ps);

        return lista;
    }

    //Lista de tipos
    public LinkedList<Tipos> getTipos() throws SQLException{
        LinkedList<Tipos> lista = new LinkedList<>();
        this.ps = this.connection.prepareStatement("SELECT * FROM Tipos");
        this.rs = ps.executeQuery();

        while (rs.next()){
            int idTipo = rs.getInt("idTipo");
            String nombre = rs.getString("nombre");
            tipo = new Tipos(idTipo, nombre);
            lista.add(tipo);
        }

        Conexion.close(rs);
        Conexion.close(ps);

        return lista;
    }

}
