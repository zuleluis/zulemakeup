package controlador.citas;

import datos.DAO.CitasDAO;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "CancelarCita", urlPatterns = {"/CancelarCita"})
public class CancelarCita extends HttpServlet {
    private int idCita;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idCita = (int) request.getSession().getAttribute("idCita");
        try{
            Connection connection = conexion.getConnection();
            CitasDAO citasDAO = new CitasDAO(connection);
            citasDAO.eliminaCita(idCita);
            //System.out.println(idCita);
            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Citas/BuscarCita.jsp");
    }
}
