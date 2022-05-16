import datos.Conexion;

import modelo.*;
import datos.DAO.CitasDAO;
import datos.DAO.ClientesDAO;
import datos.DAO.ProductosDAO;
import datos.DAO.PromocionesDAO;
import datos.DAO.ServiciosDAO;
import modelo.auxiliares.CitasServicios;
import modelo.auxiliares.JoinCitas;

import java.sql.*;
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) throws SQLException {
        //Connection connection = Conexion.getConnection();
        //ClientesDAO clientesDAO = new ClientesDAO(connection);
        //CitasDAO citasDAO = new CitasDAO(connection);
        //ProductosDAO productosDAO = new ProductosDAO(connection);
        //PromocionesDAO promocionesDAO = new PromocionesDAO(connection);
        //ServiciosDAO serviciosDAO = new ServiciosDAO(connection);

        //Mostrar lista de clientes
        //LinkedList<Clientes> lista = clientesDAO.getClientes();

        //Obtiene cliente por ID
        //Clientes cliente = clientesDAO.getCliente(99);

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

        //Muestra los servicios de una cita
        //LinkedList<CitasServicios> lista = citasDAO.getCitasServicios(1);

        //Muestra las citas por cliente
        //citasDAO.getCitasCliente(2);

        //Registra una cita
        //Citas cita = new Citas(1, "2022-05-05", "13:00:00", true, "Facultad de Ingenieria", 1, 250.00F, "Pestañas buchonas por favor");
        //citasDAO.insertaCita(cita);

        //Elimina una cita
        //Citas cita = citasDAO.eliminaCita(4);

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

        //Muestra los servicios que incluye una promoción
        //promocionesDAO.getPromoServicios(4);

        //Mostrar lista de servicios
        //LinkedList<Servicios> lista = serviciosDAO.getServicios();

        //Mostrar servicio por id
        //serviciosDAO.getServicio(2);

        //Registra un servicio
        //Servicios servicio = new Servicios("Nombre servicio", 300.00F, "Descripción del servicio");
        //serviciosDAO.insertaServicio(servicio);

        //Elimina un servicio
        //serviciosDAO.eliminaServicio(11);

        //Modifica nombre de un servicio
        //serviciosDAO.modificaNombre(10, "Promoción");

        //Agrega servicios a una cita
        //citasDAO.insertaCitaServicios(2, 6);
    }
}
