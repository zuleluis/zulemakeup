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

@WebServlet(name = "BuscarCliente", urlPatterns = {"/BuscarCliente"})
public class BuscarCliente extends HttpServlet {
    private int idCliente;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idCliente = Integer.parseInt(request.getParameter("idcliente"));

        try{
            Connection connection = conexion.getConnection();
            ClientesDAO clientesDAO = new ClientesDAO(connection);
            Clientes cliente = clientesDAO.getCliente(idCliente);

            if (cliente != null){
                request.getSession().setAttribute("idCliente", cliente.getIdCliente());
                request.getSession().setAttribute("encontrado", true);
            }
            else{
                request.getSession().setAttribute("idCliente", null);
                request.getSession().setAttribute("encontrado", false);
            }
            request.getSession().setAttribute("idCliente", null);
            request.getSession().setAttribute("datos", cliente);
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("encontrado", false);

            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Clientes/BuscarCliente.jsp");
    }
}
