package controlador.servicios;

import datos.DAO.PromocionesDAO;
import datos.DAO.ServiciosDAO;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "EliminarServicio", urlPatterns = {"/EliminarServicio"})
public class EliminarServicio extends HttpServlet {
    private int idServicio;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idServicio = (int) request.getSession().getAttribute("idServicio");
        try{
            Connection connection = conexion.getConnection();
            ServiciosDAO serviciosDAO = new ServiciosDAO(connection);
            serviciosDAO.eliminaServicio(idServicio);
            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Servicios/BuscarServicio.jsp");
    }
}
