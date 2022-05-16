package controlador.productos;

import datos.DAO.ProductosDAO;
import modelo.catalogos.Aplicacion;
import modelo.catalogos.Marcas;
import modelo.catalogos.Tipos;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet(name = "MapeoProductos", urlPatterns = {"/MapeoProductos"})
public class MapeoProductos extends HttpServlet {
    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            ProductosDAO productosDAO = new ProductosDAO(connection);

            request.getSession().setAttribute("marcas", productosDAO.getMarcas());
            request.getSession().setAttribute("tipos", productosDAO.getTipos());
            request.getSession().setAttribute("aplicaciones", productosDAO.getAplicacion());
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("marcas", new LinkedList<Marcas>());
            request.getSession().setAttribute("tipos",new LinkedList<Tipos>());
            request.getSession().setAttribute("aplicaciones", new LinkedList<Aplicacion>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Productos/RegistrarProducto.jsp");
    }

}
