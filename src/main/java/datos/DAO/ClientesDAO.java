package datos.DAO;

import datos.Conexion;
import modelo.Clientes;
import java.sql.*;
import java.util.LinkedList;

public class ClientesDAO {
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Clientes cliente;

    public ClientesDAO(Connection connection){
        this.connection = connection;
    }

    //Muestra la lista de clientes
    public LinkedList<Clientes> getClientes() throws SQLException{
        LinkedList<Clientes> lista = new LinkedList<>();
        this.ps = this.connection.prepareStatement("SELECT * FROM Clientes");
        this.rs = ps.executeQuery();

        while (rs.next()){
            int idCliente = rs.getInt("idCliente");
            String nombre = rs.getString("nombre");
            String apPaterno = rs.getString("apPaterno");
            String apMaterno = rs.getString("apMaterno");
            String fechaNac = rs.getString("fechaNac");
            String calle = rs.getString("calle");
            int numero = rs.getInt("numero");
            String colonia = rs.getString("colonia");
            String ciudad = rs.getString("ciudad");
            String numTel = rs.getString("numTel");
            cliente = new Clientes(idCliente, nombre, apPaterno, apMaterno, fechaNac, calle, numero, colonia, ciudad, numTel);
            lista.add(cliente);
        }

        Conexion.close(rs);
        Conexion.close(ps);

        /*for(Clientes cliente : lista){
            System.out.println("Cliente: " + cliente.getIdCliente() + " " + cliente.getNombre() + ' ' + cliente.getApPaterno() + ' ' + cliente.getApMaterno());
        }*/

        return lista;
    }

    //Obtiene un cliente por ID
    public Clientes getCliente(int idCliente) throws SQLException{
        this.ps = this.connection.prepareStatement("SELECT * FROM Clientes WHERE idCliente = ?;");
        this.ps.setInt(1, idCliente);
        this.rs = this.ps.executeQuery();

        if (!this.rs.next()){
            Conexion.close(rs);
            Conexion.close(ps);
            return null;
        }

        Clientes auxCliente = new Clientes(rs.getInt("idCliente"),
                rs.getString("nombre"),
                rs.getString("apPaterno"),
                rs.getString("apMaterno"),
                rs.getString("fechaNac"),
                rs.getString("calle"),
                rs.getInt("numero"),
                rs.getString("colonia"),
                rs.getString("ciudad"),
                rs.getString("numTel"));
        Conexion.close(rs);
        Conexion.close(ps);

        /*System.out.println("El cliente es:" + auxCliente.getNombre() + " " + auxCliente.getApPaterno() + " " + auxCliente.getApMaterno());*/

        return auxCliente;
    }

    //Inserta un cliente
    public void insertaCliente(Clientes cliente) throws SQLException{
        this.ps = this.connection.prepareStatement("INSERT INTO Clientes(nombre, apPaterno, apMaterno, fechaNac, calle, numero, colonia, ciudad, numTel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
        ps.setString(1, cliente.getNombre());
        ps.setString(2, cliente.getApPaterno());
        ps.setString(3, cliente.getApMaterno());
        ps.setDate(4, java.sql.Date.valueOf(cliente.getFechaNac()));
        ps.setString(5, cliente.getCalle());
        ps.setInt(6, cliente.getNumero());
        ps.setString(7, cliente.getColonia());
        ps.setString(8, cliente.getCiudad());
        ps.setString(9, cliente.getNumTel());
        ps.executeUpdate();
        //Conexion.close(ps);
    }

    //Elimina un cliente
    public Clientes eliminaCliente (int idCliente) throws SQLException{
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

    //Modificar el nombre de un cliente
    public Clientes modificaNombre (int idCliente, String nombre) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET nombre = ? WHERE idCliente = ?");

        this.ps.setString(1, nombre);
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

    //Modificar el apellido paterno de un cliente
    public Clientes modificaApPaterno (int idCliente, String apPaterno) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET apPaterno = ? WHERE idCliente = ?");

        this.ps.setString(1, apPaterno);
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

    //Modificar el apellido materno de un cliente
    public Clientes modificaApMaterno (int idCliente, String apMaterno) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET apMaterno = ? WHERE idCliente = ?");

        this.ps.setString(1, apMaterno);
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

    //Modificar la fecha de nacimiento de un cliente
    public Clientes modificaFecha (int idCliente, String fecha) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET fechaNac = ? WHERE idCliente = ?");

        this.ps.setDate(1, Date.valueOf(fecha));
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

    //Modificar la calle de un cliente
    public Clientes modificaCalle (int idCliente, String calle) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET calle = ? WHERE idCliente = ?");

        this.ps.setString(1, calle);
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

    //Modificar el numero de un cliente
    public Clientes modificaNumero(int idCliente, int numero) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET numero = ? WHERE idCliente = ?");

        this.ps.setInt(1, numero);
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

    //Modificar la colonia de un cliente
    public Clientes modificaColonia (int idCliente, String colonia) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET colonia = ? WHERE idCliente = ?");

        this.ps.setString(1, colonia);
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

    //Modificar la ciudad de un cliente
    public Clientes modificaCiudad(int idCliente, String ciudad) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET ciudad = ? WHERE idCliente = ?");

        this.ps.setString(1, ciudad);
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

    //Modificar el número telefónico de un cliente
    public Clientes modificaNumTel (int idCliente, String numTel) throws SQLException{
        Clientes auxCliente = getCliente(idCliente);

        if (auxCliente == null){
            return null;
        }

        this.ps = this.connection.prepareStatement ("UPDATE Clientes SET numTel = ? WHERE idCliente = ?");

        this.ps.setString(1, numTel);
        this.ps.setInt(2, idCliente);
        this.ps.executeUpdate();

        Conexion.close(ps);

        return auxCliente;
    }

}
