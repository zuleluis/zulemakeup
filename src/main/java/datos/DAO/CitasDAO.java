package datos.DAO;

import java.sql.*;
import java.util.LinkedList;

import datos.Conexion;
import modelo.Citas;
import modelo.Clientes;
import modelo.Promociones;
import modelo.auxiliares.JoinCitas;

public class CitasDAO {
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Citas cita;
    private Clientes cliente;
    private Promociones promocion;

    public CitasDAO(Connection connection){
        this.connection = connection;
    }

    //Muestra la lista de citas
    public LinkedList<JoinCitas> getCitas() throws SQLException{
        LinkedList<JoinCitas> lista = new LinkedList<>();

        this.ps = this.connection.prepareStatement("SELECT Clientes.nombre, Clientes.apPaterno, Clientes.apMaterno, Citas.fecha, Citas.hora, Citas.tipoLugar, Citas.lugar, Promociones.nombrePromocion, Citas.importe, Citas.nota FROM Citas\n" +
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
            cita = new Citas(fecha, hora, tipoLugar, lugar, importe, nota);

            JoinCitas auxCita = new JoinCitas(cliente, promocion, cita);
            lista.add(auxCita);

        }

        Conexion.close(rs);
        Conexion.close(ps);

        for(JoinCitas elemento: lista){
            System.out.println(elemento);
        }

        return lista;
    }

    //Obtiene las citas por idCita
    public JoinCitas getCita(int idCita) throws SQLException{
        this.ps = this.connection.prepareStatement("SELECT Clientes.nombre, Clientes.apPaterno, Clientes.apMaterno, Citas.fecha, Citas.hora, Citas.tipoLugar, Citas.lugar, Promociones.nombrePromocion, Citas.importe, Citas.nota FROM Citas\n" +
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
        cita = new Citas(rs.getString("fecha"), rs.getString("hora"), rs.getBoolean("tipoLugar"), rs.getString("lugar"), rs.getFloat("importe"), rs.getString("nota"));

        JoinCitas auxCita = new JoinCitas(cliente, promocion, cita);

        Conexion.close(rs);
        Conexion.close(ps);

        System.out.println("La cita con id " + idCita + " es: "  + auxCita.getCliente() + " " + auxCita.getCita() + " " + auxCita.getPromocion());

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

    //Elimina una cita
    public Clientes eliminaCita (int idCliente) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("DELETE FROM Clientes WHERE idCliente=?");

        this.ps.setInt(1,idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }
}
