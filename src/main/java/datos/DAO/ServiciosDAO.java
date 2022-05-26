package datos.DAO;

import datos.Conexion;
import modelo.Servicios;

import java.sql.*;
import java.util.LinkedList;

public class ServiciosDAO {
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Servicios servicio;

    public ServiciosDAO(Connection connection){
        this.connection = connection;
    }

    //Muestra la lista de Servicios
        public LinkedList<Servicios> getServicios() throws SQLException{
        LinkedList<Servicios> lista = new LinkedList<>();
        this.ps = this.connection.prepareStatement("SELECT * FROM Servicios");
        this.rs = ps.executeQuery();

        while (rs.next()){
            int idServicio = rs.getInt("idServicio");
            String nombreServicio = rs.getString("nombreServicio");
            float precio = rs.getFloat("precio");
            String descripcion = rs.getString("descripcion");
            servicio = new Servicios(idServicio, nombreServicio, precio, descripcion);
            lista.add(servicio);
        }

        Conexion.close(rs);
        Conexion.close(ps);

        for(Servicios servicio: lista){
            System.out.println("Servicio: " + servicio.getNombreServicio() + ' ' + servicio.getPrecio() + ' ' + servicio.getDescripcion());
        }

        return lista;
    }

    //Obtiene servicio por ID
    public Servicios getServicio(int idServicio) throws SQLException{
        this.ps = this.connection.prepareStatement("SELECT * FROM Servicios WHERE idServicio = ?;");
        this.ps.setInt(1, idServicio);
        this.rs = this.ps.executeQuery();

        if (!this.rs.next()){
            Conexion.close(rs);
            Conexion.close(ps);
            return null;
        }

        Servicios auxServicio = new Servicios(rs.getInt("idServicio"), rs.getString("nombreServicio"), rs.getFloat("precio"), rs.getString("descripcion"));

        Conexion.close(rs);
        Conexion.close(ps);

        System.out.println("Servicio: " + auxServicio.getNombreServicio() + ' ' + auxServicio.getPrecio() + ' ' + auxServicio.getDescripcion());

        return auxServicio;
    }

    //Inserta un nuevo servicio
    public void insertaServicio(Servicios servicio) throws SQLException{
        this.ps = this.connection.prepareStatement("INSERT INTO Servicios(nombreServicio, precio, descripcion) VALUES (?, ?, ?);");
        ps.setString(1, servicio.getNombreServicio());
        ps.setFloat(2, servicio.getPrecio());
        ps.setString(3, servicio.getDescripcion());
        ps.executeUpdate();
        //Conexion.close(ps);
    }

    //Elimina un servicio
    public Servicios eliminaServicio (int idServicio) throws SQLException{
        Servicios auxServicio = getServicio(idServicio);

        if (auxServicio == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("DELETE FROM Servicios WHERE idServicio = ?");

        this.ps.setInt(1,idServicio);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxServicio;
    }

    //Modificar el nombre de un servicio
    public Servicios modificaNombre (int idServicio, String nombre) throws SQLException{
        Servicios auxServicio = getServicio(idServicio);

        if (auxServicio == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Servicios SET nombreServicio = ? WHERE idServicio = ?");

        this.ps.setString(1, nombre);
        this.ps.setInt(2, idServicio);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxServicio;
    }

    //Modificar el precio de un servicio
    public Servicios modificaPrecio (int idServicio, float precio) throws SQLException{
        Servicios auxServicio = getServicio(idServicio);

        if (auxServicio == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Servicios SET precio = ? WHERE idServicio = ?");

        this.ps.setFloat(1, precio);
        this.ps.setInt(2, idServicio);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxServicio;
    }

    //Modificar la descripción de un servicio
    public Servicios modificaDescripcion (int idServicio, String descripcion) throws SQLException{
        Servicios auxServicio = getServicio(idServicio);

        if (auxServicio == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Servicios SET descripcion = ? WHERE idServicio = ?");

        this.ps.setString(1, descripcion);
        this.ps.setInt(2, idServicio);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxServicio;
    }
}
