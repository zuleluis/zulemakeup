package controlador.promociones;

import datos.DAO.PromocionesDAO;
import datos.DAO.ServiciosDAO;
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

@WebServlet(name = "MapeoPromociones", urlPatterns = {"/MapeoPromociones"})
public class MapeoPromociones extends HttpServlet {
    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            PromocionesDAO promocionessDAO = new PromocionesDAO(connection);
            ServiciosDAO serviciosDAO = new ServiciosDAO(connection);

            request.getSession().setAttribute("promociones", promocionessDAO.getPromociones());
            request.getSession().setAttribute("servicios", serviciosDAO.getServicios());

            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("servicios", new LinkedList<Servicios>());
            request.getSession().setAttribute("promociones", new LinkedList<Promociones>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Promociones/AgregaServicios.jsp");

    }
}
