package controlador.promociones;

import datos.DAO.PromocionesDAO;
import modelo.Promociones;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "ModificarPromocion", urlPatterns = {"/ModificarPromocion"})
public class ModificarPromocion extends HttpServlet {
    private int idPromocion;
    PromocionesDAO promocionesDAO;

    private String nombrePromocion;
    private String precio;
    private String estado;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idPromocion = (int) request.getSession().getAttribute("idPromocion");
        nombrePromocion = request.getParameter("nombrePromocion");
        precio = request.getParameter("precio");
        estado = request.getParameter("estado");

        try {
            Connection connection = conexion.getConnection();
            promocionesDAO = new PromocionesDAO(connection);

            Promociones promocion = promocionesDAO.getPromocion(idPromocion);

            request.getSession().setAttribute("datos", promocion);

            if (nombrePromocion != null && precio != null){
                promocionesDAO.modificaNombre(idPromocion, nombrePromocion);
                promocionesDAO.modificaPrecio(idPromocion, Float.parseFloat(precio));
                if (estado == null) promocionesDAO.modificaDisponibilidad(idPromocion, false);
                else promocionesDAO.modificaDisponibilidad(idPromocion, true);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Promociones/ModificarPromocion.jsp");
    }
}
