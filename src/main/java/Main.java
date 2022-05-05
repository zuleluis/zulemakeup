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
        //LinkedList<Clientes> lista = clientesDAO.getClientes();

        //Obtiene cliente por ID
        //Clientes cliente = clientesDAO.getCliente(1);

        //Registra a un cliente
        //Clientes cliente = new Clientes("nombre", "apPaterno", "apMaterno", "2000-11-01", "calle", 0, "colonia", "ciudad", "numTel");
        //clientesDAO.insertaCliente(cliente);

        //Elimina a un cliente
        //Clientes cliente = clientesDAO.eliminaCliente(8);
    }
}
