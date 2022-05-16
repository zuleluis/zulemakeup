package controlador.citas;

import datos.DAO.CitasDAO;
import modelo.Citas;
import modelo.auxiliares.CitasServicios;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet(name = "ServiciosCliente", urlPatterns = {"/ServiciosCliente"})
public class ServiciosCliente extends HttpServlet {
    private int idCita;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idCita = (int) request.getSession().getAttribute("idCita");
        try{
            Connection connection = conexion.getConnection();
            CitasDAO citasDAO = new CitasDAO(connection);
            request.getSession().setAttribute("servicios", citasDAO.getCitasServicios(idCita));
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("servicios", new LinkedList<CitasServicios>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Citas/BuscarCita.jsp");
    }
}
