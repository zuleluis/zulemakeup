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

@WebServlet(name = "RegistrarCliente", urlPatterns = {"/RegistrarCliente"})
public class RegistrarCliente extends HttpServlet {
    private String nombre;
    private String apPaterno;
    private String apMaterno;
    private String fechaNac;
    private String calle;
    private int numero;
    private String colonia;
    private String ciudad;
    private String numTel;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        nombre = request.getParameter("nombre");
        apPaterno = request.getParameter("apPaterno");
        apMaterno = request.getParameter("apMaterno");
        fechaNac = request.getParameter("fechaNac");
        calle = request.getParameter("calle");
        numero = Integer.parseInt(request.getParameter("numero"));
        colonia = request.getParameter("colonia");
        ciudad = request.getParameter("ciudad");
        numTel = request.getParameter("numTel");

        try{
            Connection connection = conexion.getConnection();
            ClientesDAO clientesDAO = new ClientesDAO(connection);
            Clientes cliente = new Clientes(nombre, apPaterno, apMaterno, fechaNac, calle, numero, colonia, ciudad, numTel);
            clientesDAO.insertaCliente(cliente);
            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        response.sendRedirect("/zulemakeup/Clientes/RegistrarCliente.jsp");
    }
}
