package controlador.citas;

import datos.DAO.ClientesDAO;
import datos.DAO.ServiciosDAO;
import modelo.Clientes;
import datos.DAO.PromocionesDAO;
import modelo.Promociones;
import modelo.Servicios;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet(name = "MapeoListas",urlPatterns = {"/MapeoListas"})
public class MapeoListas extends HttpServlet {
    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            ClientesDAO clientesDAO = new ClientesDAO(connection);
            PromocionesDAO promocionessDAO = new PromocionesDAO(connection);
            ServiciosDAO serviciosDAO = new ServiciosDAO(connection);

            request.getSession().setAttribute("clientes", clientesDAO.getClientes());
            request.getSession().setAttribute("promociones", promocionessDAO.getPromociones());
            request.getSession().setAttribute("servicios", serviciosDAO.getServicios());
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("clientes", new LinkedList<Clientes>());
            request.getSession().setAttribute("promociones", new LinkedList<Promociones>());
            request.getSession().setAttribute("servicios", new LinkedList<Servicios>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Citas/RegistrarCita.jsp");
    }
}
