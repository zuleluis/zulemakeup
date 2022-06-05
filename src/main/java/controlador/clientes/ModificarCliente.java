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

@WebServlet(name = "ModificarCliente", urlPatterns = {"/ModificarCliente"})
public class ModificarCliente extends HttpServlet {
    private int idCliente;
    ClientesDAO clientesDAO;

    private String nombre;
    private String apPaterno;
    private String apMaterno;
    private String fechaNac;
    private String calle;
    private String numero;
    private String colonia;
    private String ciudad;
    private String numTel;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idCliente = (int) request.getSession().getAttribute("idCliente");
        nombre = request.getParameter("nombre");
        apPaterno = request.getParameter("apPaterno");
        apMaterno = request.getParameter("apMaterno");
        fechaNac = request.getParameter("fechaNac");
        calle = request.getParameter("calle");
        numero = request.getParameter("numero");
        colonia = request.getParameter("colonia");
        ciudad = request.getParameter("ciudad");
        numTel = request.getParameter("numTel");

        try{
            Connection connection = conexion.getConnection();
            clientesDAO = new ClientesDAO(connection);

            Clientes cliente = clientesDAO.getCliente(idCliente);
            request.getSession().setAttribute("datos", cliente);

            if (nombre != null && apPaterno != null && apMaterno != null && fechaNac != null && calle != null && numero != null && colonia != null && ciudad != null && numTel != null){
                clientesDAO.modificaNombre(idCliente, nombre);
                clientesDAO.modificaApPaterno(idCliente, apPaterno);
                clientesDAO.modificaApMaterno(idCliente, apMaterno);
                clientesDAO.modificaFecha(idCliente, fechaNac);
                clientesDAO.modificaCalle(idCliente, calle);
                clientesDAO.modificaNumero(idCliente, Integer.parseInt(numero));
                clientesDAO.modificaColonia(idCliente, colonia);
                clientesDAO.modificaCiudad(idCliente, ciudad);
                clientesDAO.modificaNumTel(idCliente, numTel);
            }
            connection.close();

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Clientes/ModificarCliente.jsp");
    }
}
