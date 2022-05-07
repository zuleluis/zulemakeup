import datos.Conexion;
import datos.DAO.CitasDAO;
import datos.DAO.ClientesDAO;
import datos.DAO.ProductosDAO;
import datos.DAO.PromocionesDAO;
import modelo.Clientes;
import modelo.auxiliares.JoinCitas;
import modelo.Citas;
import modelo.auxiliares.JoinProductos;
import modelo.Productos;
import modelo.Promociones;

import java.sql.*;
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) throws SQLException {
        Connection connection = Conexion.getConnection();
        ClientesDAO clientesDAO = new ClientesDAO(connection);
        CitasDAO citasDAO = new CitasDAO(connection);
        ProductosDAO productosDAO = new ProductosDAO(connection);
        PromocionesDAO promocionesDAO = new PromocionesDAO(connection);

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
        //Citas cita = new Citas(1, "2022-05-05", "13:00:00", true, "Facultad de Ingenieria", 1, 250.00F, "Pestañas buchonas por favor");
        //citasDAO.insertaCita(cita);

        //Elimina una cita
        //Citas cita = citasDAO.eliminaCita(2);

        //Modifica fecha de una cita
        //citasDAO.modificaFecha(1, java.sql.Date.valueOf("2022-05-05"));

        //Lista de productos
        //LinkedList<JoinProductos> lista = productosDAO.getProductos();

        //Mostrar producto por ID
        //JoinProductos producto = productosDAO.getProducto(1);

        //Insertar producto
        //Productos producto = new Productos(2, "Paleta de sombras Jasmine", 3, 25, null, 1, false);
        //productosDAO.insertaProducto(producto);

        //Elimina un producto
        //Productos producto = productosDAO.eliminaProducto(9);

        //Modifica fecha de una cita
        //productosDAO.modificaNombre(10, "Paleta de sombras Jasmine");

        //Mostrar lista de promociones
        //LinkedList<Promociones> lista = promocionesDAO.getPromociones();

        //Mostrar promocion individual
        //Promociones promocion = promocionesDAO.getPromocion(2);

        //Registra una promoción
        //Promociones promocion = new Promociones("Nombre promocion", 100.50F, false);
        //promocionesDAO.insertaPromocion(promocion);

        //Elimina una promoción
        //promocionesDAO.eliminaPromocion(3);

        //Modifica nombre de una promoción
        //promocionesDAO.modificaNombre(7, "Maquillaje social + transporte redondo");

    }
}
