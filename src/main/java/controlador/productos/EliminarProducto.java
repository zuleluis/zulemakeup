package controlador.productos;

import datos.DAO.ProductosDAO;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "EliminarProducto", urlPatterns = {"/EliminarProducto"})
public class EliminarProducto extends HttpServlet {
    private int idProducto;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idProducto = (int) request.getSession().getAttribute("idProducto");
        try{
            Connection connection = conexion.getConnection();
            ProductosDAO productosDAO = new ProductosDAO(connection);
            productosDAO.eliminaProducto(idProducto);
            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Productos/BuscarProducto.jsp");
    }
}
