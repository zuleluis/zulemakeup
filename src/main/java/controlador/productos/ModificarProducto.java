package controlador.productos;

import datos.DAO.ProductosDAO;
import modelo.Productos;
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

@WebServlet(name = "ModificarProducto", urlPatterns = {"/ModificarProducto"})
public class ModificarProducto extends HttpServlet {
    private int idProducto;
    ProductosDAO productosDAO;

    private String fkMarca;
    private String nombreProducto;
    private String fkAplicacion;
    private String fkTipo;
    private String modelo;
    private String cantidad;
    private String agotado;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idProducto = (int) request.getSession().getAttribute("idProducto");
        fkMarca = request.getParameter("fkMarca");
        nombreProducto = request.getParameter("nombreProducto");
        fkAplicacion = request.getParameter("fkAplicacion");
        fkTipo = request.getParameter("fkTipo");
        modelo = request.getParameter("modelo");
        cantidad = request.getParameter("cantidad");
        agotado = request.getParameter("agotado");

        try{
            Connection connection = conexion.getConnection();
            productosDAO = new ProductosDAO(connection);

            Productos producto = productosDAO.getProductoPrimitivo(idProducto);

            request.getSession().setAttribute("datos", producto);
            request.getSession().setAttribute("marcas", productosDAO.getMarcas());
            request.getSession().setAttribute("aplicacion", productosDAO.getAplicacion());
            request.getSession().setAttribute("tipos", productosDAO.getTipos());

            if (fkMarca != null && nombreProducto != null && fkAplicacion != null && fkTipo != null && modelo != null && cantidad != null){
                productosDAO.modificaMarca(idProducto, Integer.parseInt(fkMarca));
                productosDAO.modificaNombre(idProducto, nombreProducto);
                productosDAO.modificaAplicacion(idProducto, Integer.parseInt(fkAplicacion));
                productosDAO.modificaTipo(idProducto, Integer.parseInt(fkTipo));
                productosDAO.modificaModelo(idProducto, modelo);
                productosDAO.modificaCantidad(idProducto, Integer.parseInt(cantidad));
                if (agotado == null) productosDAO.modificaDisponibilidad(idProducto, false);
                else productosDAO.modificaDisponibilidad(idProducto, true);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
            request.getSession().setAttribute("marcas", new LinkedList<Marcas>());
            request.getSession().setAttribute("aplicacion", new LinkedList<Aplicacion>());
            request.getSession().setAttribute("tipos", new LinkedList<Tipos>());
        }
        response.sendRedirect("/zulemakeup/Productos/ModificarProducto.jsp");
    }
}
