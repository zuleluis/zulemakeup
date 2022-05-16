package controlador.productos;

import datos.DAO.ProductosDAO;
import modelo.Productos;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "RegistrarProducto", urlPatterns = {"/RegistrarProducto"})
public class RegistrarProducto extends HttpServlet {
    private int fkMarca;
    private String nombreProducto;
    private int fkAplicacion;
    private int fkTipo;
    private String modelo;
    private int cantidad;
    private String agotado;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        fkMarca = Integer.parseInt(request.getParameter("fkMarca"));
        nombreProducto = request.getParameter("nombreProducto");
        fkAplicacion = Integer.parseInt(request.getParameter("fkAplicacion"));
        fkTipo = Integer.parseInt(request.getParameter("fkTipo"));
        modelo = request.getParameter("modelo");
        cantidad = Integer.parseInt(request.getParameter("cantidad"));
        agotado = request.getParameter("agotado");

        try{
            Connection connection = conexion.getConnection();
            ProductosDAO productosDAO = new ProductosDAO(connection);

            boolean checkbox;

            if (agotado == null) checkbox = false;
            else checkbox = true;

            Productos producto = new Productos(fkMarca, nombreProducto, fkAplicacion, fkTipo, modelo, cantidad, checkbox);
            productosDAO.insertaProducto(producto);

            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        response.sendRedirect("/zulemakeup/Productos/RegistrarProducto.jsp");
    }
}
