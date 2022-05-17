package datos.DAO;

import java.sql.*;
import java.util.LinkedList;

import datos.Conexion;
import modelo.Citas;
import modelo.Clientes;
import modelo.Promociones;
import modelo.Servicios;
import modelo.auxiliares.CitasServicios;
import modelo.auxiliares.JoinCitas;

public class CitasDAO {
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Citas cita;
    private Clientes cliente;
    private Promociones promocion;
    private Servicios servicio;

    public CitasDAO(Connection connection){
        this.connection = connection;
    }

    //Muestra la lista de citas
    public LinkedList<JoinCitas> getCitas() throws SQLException{
        LinkedList<JoinCitas> lista = new LinkedList<>();

        this.ps = this.connection.prepareStatement("SELECT Clientes.nombre, Clientes.apPaterno, Clientes.apMaterno, Citas.fecha, Citas.hora, Citas.tipoLugar, Citas.lugar, Promociones.nombrePromocion, Citas.importe, Citas.nota, Citas.borrar FROM Citas\n" +
                "JOIN Clientes ON Citas.fkCliente = Clientes.idCliente\n" +
                "JOIN Promociones ON Citas.fkPromocion = Promociones.idPromocion");
        this.rs = ps.executeQuery();

        while (rs.next()){
            String nombre = rs.getString("nombre");
            String apPaterno = rs.getString("apPaterno");
            String apMaterno = rs.getString("apMaterno");
            cliente = new Clientes(nombre, apPaterno, apMaterno);

            String nombrePromocion = rs.getString("nombrePromocion");
            promocion = new Promociones(nombrePromocion);

            String fecha = rs.getString("fecha");
            String hora = rs.getString("hora");
            boolean tipoLugar = rs.getBoolean("tipoLugar");
            String lugar = rs.getString("lugar");
            float importe = rs.getFloat("importe");
            String nota = rs.getString("nota");
            boolean borrar = rs.getBoolean("borrar");
            cita = new Citas(fecha, hora, tipoLugar, lugar, importe, nota, borrar);

            JoinCitas auxCita = new JoinCitas(cliente, promocion, cita);
            lista.add(auxCita);

        }

        Conexion.close(rs);
        Conexion.close(ps);

//        for(JoinCitas elemento: lista){
//            System.out.println(elemento);
//        }

        return lista;
    }

    //Obtiene las citas por idCita
    public JoinCitas getCita(int idCita) throws SQLException{
        this.ps = this.connection.prepareStatement("SELECT Citas.idCita, Clientes.nombre, Clientes.apPaterno, Clientes.apMaterno, Citas.fecha, Citas.hora, Citas.tipoLugar, Citas.lugar, Promociones.nombrePromocion, Citas.importe, Citas.nota, Citas.borrar FROM Citas\n" +
                "JOIN Clientes ON Citas.fkCliente = Clientes.idCliente\n" +
                "JOIN Promociones ON Citas.fkPromocion = Promociones.idPromocion\n" +
                "WHERE idCita = ?");
        this.ps.setInt(1, idCita);
        this.rs = this.ps.executeQuery();

        if (!this.rs.next()){
            Conexion.close(rs);
            Conexion.close(ps);
            return null;
        }

        cliente = new Clientes(rs.getString("nombre"), rs.getString("apPaterno"), rs.getString("apMaterno"));
        promocion = new Promociones(rs.getString("nombrePromocion"));
        cita = new Citas(rs.getInt("idCita"), rs.getString("fecha"), rs.getString("hora"), rs.getBoolean("tipoLugar"), rs.getString("lugar"), rs.getFloat("importe"), rs.getString("nota"), rs.getBoolean("borrar"));

        JoinCitas auxCita = new JoinCitas(cliente, promocion, cita);

        Conexion.close(rs);
        Conexion.close(ps);

        //System.out.println("La cita con id " + idCita + " es: "  + auxCita.getCliente() + " " + auxCita.getCita() + " " + auxCita.getPromocion());

        return auxCita;
    }

    //Obtiene cita "primitiva", es decir, solamente de la tabla Citas
    public Citas getCitaPrimitiva(int idCita) throws SQLException{
        this.ps = this.connection.prepareStatement("SELECT * FROM Citas WHERE idCita = ?;");
        this.ps.setInt(1, idCita);
        this.rs = this.ps.executeQuery();

        if (!this.rs.next()){
            Conexion.close(rs);
            Conexion.close(ps);
            return null;
        }

        Citas auxCita = new Citas(rs.getInt("fkCliente"), rs.getString("fecha"), rs.getString("hora"), rs.getBoolean("tipoLugar"),  rs.getString("lugar"), rs.getInt("fkPromocion"), rs.getFloat("importe"), rs.getString("nota"), rs.getBoolean("borrar"));

        Conexion.close(rs);
        Conexion.close(ps);

        return auxCita;
    }

    //Inserta una cita
    public void insertaCita(Citas cita) throws SQLException{
        this.ps = this.connection.prepareStatement("INSERT INTO Citas(fkCliente, fecha, hora, tipoLugar, lugar, fkPromocion, importe, nota) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
        ps.setInt(1, cita.getFkCliente());
        ps.setDate(2, java.sql.Date.valueOf(cita.getFecha()));
        ps.setTime(3, java.sql.Time.valueOf(cita.getHora()));
        ps.setBoolean(4, cita.isTipoLugar());
        ps.setString(5, cita.getLugar());
        ps.setInt(6, cita.getFkPromocion());
        ps.setFloat(7, cita.getImporte());
        ps.setString(8, cita.getNota());
        ps.executeUpdate();
        //Conexion.close(ps);
    }

    //Elimina una cita. En realidad realizo un safe delete, para no borrar por completo los registros, solo "deshabilitarlos"
    public Citas eliminaCita (int idCita) throws SQLException{
        Citas auxCita = getCitaPrimitiva(idCita);

        if (auxCita == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Citas SET borrar = true WHERE idCita = ?");

        this.ps.setInt(1, idCita);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCita;
    }

    //Modificar la fecha de una cita
    public Citas modificaFecha (int idCita, Date fecha) throws SQLException{
        Citas auxCita = getCitaPrimitiva(idCita);

        if (auxCita == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Citas SET fecha = ? WHERE idCita = ?");

        this.ps.setDate(1, fecha);
        this.ps.setInt(2, idCita);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCita;
    }

    //Muestra los servicios brindados en una cita
    public LinkedList<CitasServicios> getCitasServicios(int idCita) throws SQLException{
        LinkedList<CitasServicios> lista = new LinkedList<>();
        this.ps = this.connection.prepareStatement("SELECT Servicios.nombreServicio FROM CitasServicios\n" +
                "JOIN Servicios ON CitasServicios.fkServicio = Servicios.idServicio\n" +
                "WHERE CitasServicios.fkCita = ?");

        this.ps.setInt(1, idCita);
        this.rs = this.ps.executeQuery();

        while (this.rs.next()){
            servicio = new Servicios(rs.getString("nombreServicio"));
            CitasServicios auxCitasServicios = new CitasServicios(servicio);

            lista.add(auxCitasServicios);

        }

        Conexion.close(rs);
        Conexion.close(ps);

        /*System.out.println("La cita incluye");
        for(CitasServicios servicio: lista){
            System.out.println(servicio);
        }*/

        return lista;
    }

    //Muestra la lista de citas por cliente
    public LinkedList<Citas> getCitasCliente(int idCliente) throws SQLException{
        LinkedList<Citas> lista = new LinkedList<>();

        this.ps = this.connection.prepareStatement("SELECT fecha, hora, tipoLugar, lugar, importe, nota, borrar FROM Citas\n" +
                "WHERE fkCliente = 2");
        this.rs = ps.executeQuery();

        while (rs.next()){
            Citas auxCita = new Citas(rs.getString("fecha"), rs.getString("hora"), rs.getBoolean("tipoLugar"), rs.getString("lugar"), rs.getFloat("importe"), rs.getString("nota"), rs.getBoolean("borrar"));
            lista.add(auxCita);
        }

        Conexion.close(rs);
        Conexion.close(ps);

        /*for(Citas elemento: lista){
            System.out.println(elemento);
        }*/

        return lista;
    }

    //Agregar servicios a una cita
    public void insertaCitaServicios(int idCita, int idServicio) throws SQLException{
        this.ps = this.connection.prepareStatement("INSERT INTO CitasServicios(fkCita, fkServicio) VALUES (?, ?);");
        ps.setInt(1, idCita);
        ps.setInt(2, idServicio);
        ps.executeUpdate();
        //Conexion.close(ps);
    }
}
