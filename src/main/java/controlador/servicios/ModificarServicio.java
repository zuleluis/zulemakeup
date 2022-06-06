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

@WebServlet(name = "ModificarServicio", urlPatterns = {"/ModificarServicio"})
public class ModificarServicio extends HttpServlet {
    private int idServicio;
    ServiciosDAO serviciosDAO;

    private String nombreServicio;
    private String precio;
    private String descripcion;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idServicio = (int) request.getSession().getAttribute("idServicio");
        nombreServicio = request.getParameter("nombreServicio");
        precio = request.getParameter("precio");
        descripcion = request.getParameter("descripcion");

        try{
            Connection connection = conexion.getConnection();
            serviciosDAO = new ServiciosDAO(connection);

            Servicios servicio = serviciosDAO.getServicio(idServicio);

            request.getSession().setAttribute("datos", servicio);

            if (nombreServicio != null && precio != null && descripcion != null){
                serviciosDAO.modificaNombre(idServicio, nombreServicio);
                serviciosDAO.modificaPrecio(idServicio, Float.parseFloat(precio));
                serviciosDAO.modificaDescripcion(idServicio, descripcion);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Servicios/ModificarServicio.jsp");
    }
}
