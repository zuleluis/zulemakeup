package controlador.citas;

import datos.DAO.CitasDAO;
import datos.DAO.ClientesDAO;
import modelo.Citas;
import modelo.Clientes;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet(name = "ListaCitas", urlPatterns = {"/ListaCitas"})
public class ListaCitas extends HttpServlet {
    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            CitasDAO citasDAO = new CitasDAO(connection);
            request.getSession().setAttribute("datos", citasDAO.getCitas());
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("datos", new LinkedList<Citas>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Citas/ListaCitas.jsp");
    }
}
