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
import java.util.LinkedList;

@WebServlet(name = "ListaProductos", urlPatterns = {"/ListaProductos"})
public class ListaProductos extends HttpServlet {
    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            ProductosDAO productosDAO = new ProductosDAO(connection);
            request.getSession().setAttribute("datos", productosDAO.getProductos());
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("datos", new LinkedList<Productos>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Productos/ListaProductos.jsp");
    }
}
