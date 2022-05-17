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

@WebServlet(name = "BuscarServicio", urlPatterns = {"/BuscarServicio"})
public class BuscarServicio extends HttpServlet {
    private int idServicio;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idServicio = Integer.parseInt(request.getParameter("idservicio"));

        try{
            Connection connection = conexion.getConnection();
            ServiciosDAO serviciosDAO = new ServiciosDAO(connection);
            Servicios servicio = serviciosDAO.getServicio(idServicio);

            if (servicio != null){
                request.getSession().setAttribute("idServicio", servicio.getIdServicio());
                request.getSession().setAttribute("encontrado", true);
            }
            else{
                request.getSession().setAttribute("idServicio", null);
                request.getSession().setAttribute("encontrado", false);
            }
            request.getSession().setAttribute("idServicio", null);
            request.getSession().setAttribute("datos", servicio);
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("encontrado", false);
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Servicios/BuscarServicio.jsp");
    }
}
