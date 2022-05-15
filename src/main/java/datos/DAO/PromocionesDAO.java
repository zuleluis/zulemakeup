package datos.DAO;

import datos.Conexion;
import modelo.Promociones;
import modelo.Servicios;
import modelo.auxiliares.PromoServicios;

import java.sql.*;
import java.util.LinkedList;

public class PromocionesDAO {
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Promociones promocion;
    private Servicios servicio;

    public PromocionesDAO(Connection connection){
        this.connection = connection;
    }

    //Muestra la lista de Promociones
    public LinkedList<Promociones> getPromociones() throws SQLException{
        LinkedList<Promociones> lista = new LinkedList<>();
        this.ps = this.connection.prepareStatement("SELECT * FROM Promociones");
        this.rs = ps.executeQuery();

        while (rs.next()){
            String nombrePromocion = rs.getString("nombrePromocion");
            float precio = rs.getFloat("precio");
            boolean estado = rs.getBoolean("estado");
            promocion = new Promociones(nombrePromocion, precio, estado);
            lista.add(promocion);
        }

        Conexion.close(rs);
        Conexion.close(ps);

        for(Promociones promocion: lista){
            String disponibilidad = (promocion.isEstado() ? "No disponible" :"Disponible");
            System.out.println("Promocion: " + promocion.getNombrePromocion() + ' ' + promocion.getPrecio() + ' ' + disponibilidad);
        }

        return lista;
    }

    //Obtiene promoción por ID
    public Promociones getPromocion(int idPromocion) throws SQLException{
        this.ps = this.connection.prepareStatement("SELECT * FROM Promociones WHERE idPromocion = ?;");
        this.ps.setInt(1, idPromocion);
        this.rs = this.ps.executeQuery();

        if (!this.rs.next()){
            Conexion.close(rs);
            Conexion.close(ps);
            return null;
        }

        Promociones auxPromocion = new Promociones(rs.getString("nombrePromocion"), rs.getFloat("precio"), rs.getBoolean("estado"));

        Conexion.close(rs);
        Conexion.close(ps);

        String disponibilidad = (auxPromocion.isEstado() ? "No disponible" :"Disponible");
        System.out.println("Promocion: " + auxPromocion.getNombrePromocion() + ' ' + auxPromocion.getPrecio() + ' ' + disponibilidad);

        return auxPromocion;
    }

    //Inserta una nueva promoción
    public void insertaPromocion(Promociones promocion) throws SQLException{
        this.ps = this.connection.prepareStatement("INSERT INTO Promociones(nombrePromocion, precio, estado) VALUES (?, ?, ?);");
        ps.setString(1, promocion.getNombrePromocion());
        ps.setFloat(2, promocion.getPrecio());
        ps.setBoolean(3, promocion.isEstado());
        ps.executeUpdate();
        //Conexion.close(ps);
    }

    //Agregar servicios a una promoción
    public void insertaPromoServicios(int idPromocion, int idServicio) throws SQLException{
        this.ps = this.connection.prepareStatement("INSERT INTO PromoServicios(fkPromocion, fkServicio) VALUES (?, ?);");
        ps.setInt(1, idPromocion);
        ps.setInt(2, idServicio);
        ps.executeUpdate();
        //Conexion.close(ps);
    }

    //Muestra los servicios de una promoción
    public LinkedList<PromoServicios> getPromoServicios(int idPromocion) throws SQLException{
        LinkedList<PromoServicios> lista = new LinkedList<>();
        this.ps = this.connection.prepareStatement("SELECT Servicios.nombreServicio FROM PromoServicios\n" +
                "JOIN Servicios ON PromoServicios.fkServicio = Servicios.idServicio\n" +
                "WHERE fkPromocion = ?");

        this.ps.setInt(1, idPromocion);
        this.rs = this.ps.executeQuery();

        while (this.rs.next()){
            servicio = new Servicios(rs.getString("nombreServicio"));
            PromoServicios auxPromoServicio = new PromoServicios(servicio);

            lista.add(auxPromoServicio);

        }

        Conexion.close(rs);
        Conexion.close(ps);

        System.out.println("La promoción incluye");
        for(PromoServicios servicio: lista){
            System.out.println(servicio);
        }

        return lista;
    }

    //Elimina una promocion
    public Promociones eliminaPromocion (int idPromocion) throws SQLException{
        Promociones auxPromocion = getPromocion(idPromocion);

        if (auxPromocion == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("DELETE FROM Promociones WHERE idPromocion = ?");

        this.ps.setInt(1,idPromocion);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxPromocion;
    }

    //Modificar el nombre de una promoción
    public Promociones modificaNombre (int idPromocion, String nombre) throws SQLException{
        Promociones auxPromocion = getPromocion(idPromocion);

        if (auxPromocion == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Promociones SET nombrePromocion = ? WHERE idPromocion = ?");

        this.ps.setString(1, nombre);
        this.ps.setInt(2, idPromocion);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxPromocion;
    }
}
