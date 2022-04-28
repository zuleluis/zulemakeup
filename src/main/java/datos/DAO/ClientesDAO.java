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
            String nombre = rs.getString("nombre");
            String apPaterno = rs.getString("apPaterno");
            String apMaterno = rs.getString("apMaterno");
            cliente = new Clientes(nombre, apPaterno, apMaterno);
            lista.add(cliente);
        }

        Conexion.close(rs);
        Conexion.close(ps);

        for(Clientes cliente : lista){
            System.out.println("Cliente: " + cliente.getNombre() + ' ' + cliente.getApPaterno() + ' ' + cliente.getApMaterno());
        }

        return lista;
    }
}
