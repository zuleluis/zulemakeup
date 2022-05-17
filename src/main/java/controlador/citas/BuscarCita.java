package controlador.citas;

import datos.DAO.CitasDAO;
import modelo.auxiliares.CitasServicios;
import modelo.auxiliares.JoinCitas;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet(name = "BuscarCita", urlPatterns = {"/BuscarCita"})
public class BuscarCita extends HttpServlet {
    private int idCita;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idCita = Integer.parseInt(request.getParameter("idcita"));

        try{
            Connection connection = conexion.getConnection();
            CitasDAO citasDAO = new CitasDAO(connection);
            JoinCitas cita = citasDAO.getCita(idCita);

            if (cita != null){
                request.getSession().setAttribute("idCita", cita.getCita().getIdCita());
                request.getSession().setAttribute("encontrado", true);
                request.getSession().setAttribute("servicios", citasDAO.getCitasServicios(idCita));
            }
            else{
                request.getSession().setAttribute("idCita", null);
                request.getSession().setAttribute("encontrado", false);
            }
            request.getSession().setAttribute("idCita", null);
            request.getSession().setAttribute("datos", cita);

            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("encontrado",false);
            request.getSession().setAttribute("servicios", new LinkedList<CitasServicios>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Citas/BuscarCita.jsp");
    }
}
