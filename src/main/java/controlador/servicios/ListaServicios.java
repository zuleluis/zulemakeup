package controlador.servicios;

import datos.DAO.ServiciosDAO;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet(name = "ListaServicios", urlPatterns = {"/ListaServicios"})
public class ListaServicios extends HttpServlet {
    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            ServiciosDAO serviciosDAO = new ServiciosDAO(connection);
            request.getSession().setAttribute("datos", serviciosDAO.getServicios());
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("datos", new LinkedList<ServiciosDAO>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Servicios/ListaServicios.jsp");
    }
}
