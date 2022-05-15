package controlador.clientes;

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

@WebServlet(name = "EliminarCliente", urlPatterns = {"/EliminarCliente"})
public class EliminarCliente extends HttpServlet {
    private int idCliente;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idCliente = (int) request.getSession().getAttribute("idCliente");
        try{
            Connection connection = conexion.getConnection();
            ClientesDAO clientesDAO = new ClientesDAO(connection);
            clientesDAO.eliminaCliente(idCliente);
            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Clientes/BuscarCliente.jsp");
    }
}
