import datos.Conexion;
import datos.DAO.CitasDAO;
import datos.DAO.ClientesDAO;
import modelo.Clientes;
import modelo.auxiliares.JoinCitas;
import modelo.Citas;

import java.sql.*;
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) throws SQLException {
        Connection connection = Conexion.getConnection();
        ClientesDAO clientesDAO = new ClientesDAO(connection);
        CitasDAO citasDAO = new CitasDAO(connection);

        //Mostrar lista de clientes
        //LinkedList<Clientes> lista = clientesDAO.getClientes();

        //Obtiene cliente por ID
        //Clientes cliente = clientesDAO.getCliente(1);

        //Registra a un cliente
        //Clientes cliente = new Clientes("nombre", "apPaterno", "apMaterno", "2000-11-01", "calle", 0, "colonia", "ciudad", "numTel");
        //clientesDAO.insertaCliente(cliente);

        //Elimina a un cliente
        //Clientes cliente = clientesDAO.eliminaCliente(8);

        //Modifica el nombre de un cliente
        //clientesDAO.modificaNombre(1, "Zulema Concepción");

        //Muestra las citas
        //LinkedList<JoinCitas> lista = citasDAO.getCitas();

        //Muestra una cita individual
        //JoinCitas cita = citasDAO.getCita(2);

        //Registra una cita
        //Clientes cliente = new Clientes()
        //Citas cita = new Citas(1, "2022-05-05", "13:00:00", true, "Facultad de Ingenieria", 1, 250.00F, "Pestañas buchonas por favor");
        //citasDAO.insertaCita(cita);
    }
}
