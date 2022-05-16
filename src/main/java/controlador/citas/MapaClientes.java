package controlador.citas;

import datos.DAO.ClientesDAO;
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

@WebServlet(name = "MapaClientes",urlPatterns = {"/MapaClientes"})
public class MapaClientes extends HttpServlet {
    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            ClientesDAO clientesDAO = new ClientesDAO(connection);
            request.getSession().setAttribute("datos", clientesDAO.getClientes());
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("datos", new LinkedList<Clientes>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Citas/RegistrarCita.jsp");
    }
}
