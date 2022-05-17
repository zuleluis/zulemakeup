package controlador.promociones;

import datos.DAO.ProductosDAO;
import datos.DAO.PromocionesDAO;
import modelo.Productos;
import modelo.Promociones;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "RegistrarPromocion", value = "/RegistrarPromocion")
public class RegistrarPromocion extends HttpServlet {
    String nombrePromocion;
    float precio;
    String estado;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        nombrePromocion = request.getParameter("nombrePromocion");
        precio = Float.parseFloat(request.getParameter("precio"));
        estado = request.getParameter("estado");

        try{
            Connection connection = conexion.getConnection();
            PromocionesDAO promocionesDAO = new PromocionesDAO(connection);

            boolean checkbox;

            if (estado == null) checkbox = false;
            else checkbox = true;

            Promociones promocion = new Promociones(nombrePromocion, precio, checkbox);
            promocionesDAO.insertaPromocion(promocion);

            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        response.sendRedirect("/zulemakeup/Promociones/RegistrarPromocion.jsp");
    }
}
