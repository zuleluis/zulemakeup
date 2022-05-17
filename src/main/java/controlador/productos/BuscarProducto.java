package controlador.productos;

import datos.DAO.ProductosDAO;
import modelo.auxiliares.JoinProductos;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "BuscarProducto", urlPatterns = {"/BuscarProducto"})
public class BuscarProducto extends HttpServlet {
    private int idProducto;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idProducto = Integer.parseInt(request.getParameter("idproducto"));

        try{
            Connection connection = conexion.getConnection();
            ProductosDAO productosDAO = new ProductosDAO(connection);
            JoinProductos producto = productosDAO.getProducto(idProducto);

            if (producto != null){
                request.getSession().setAttribute("idProductos", producto.getProducto().getIdProducto());
                request.getSession().setAttribute("encontrado", true);
            }
            else{
                request.getSession().setAttribute("idProducto", null);
                request.getSession().setAttribute("encontrado", false);
            }
            request.getSession().setAttribute("idProducto", null);
            request.getSession().setAttribute("datos", producto);
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("encontrado", false);

            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Productos/BuscarProducto.jsp");
    }
}
