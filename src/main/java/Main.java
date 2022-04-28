import datos.Conexion;
import datos.DAO.ClientesDAO;
import modelo.Clientes;
import java.sql.*;
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) throws SQLException {
        Connection connection = Conexion.getConnection();
        ClientesDAO clientesDAO = new ClientesDAO(connection);

        //Mostrar lista de clientes
        LinkedList<Clientes> lista = clientesDAO.getClientes();
    }
}
