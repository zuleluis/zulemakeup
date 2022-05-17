package controlador.servicios;

import datos.DAO.ServiciosDAO;
import modelo.Servicios;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "RegistrarServicio", urlPatterns = {"/RegistrarServicio"})
public class RegistrarServicio extends HttpServlet {
    String nombreServicio;
    float precio;
    String descripcion;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        nombreServicio = request.getParameter("nombreServicio");
        precio = Float.parseFloat(request.getParameter("precio"));
        descripcion = request.getParameter("descripcion");

        try{
            Connection connection = conexion.getConnection();
            ServiciosDAO serviciosDAO = new ServiciosDAO(connection);

            Servicios servicio = new Servicios(nombreServicio, precio, descripcion);
            serviciosDAO.insertaServicio(servicio);

            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        response.sendRedirect("/zulemakeup/Servicios/RegistrarServicio.jsp");
    }
}
