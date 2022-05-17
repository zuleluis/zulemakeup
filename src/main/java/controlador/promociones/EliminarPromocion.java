package controlador.promociones;

import datos.DAO.ProductosDAO;
import datos.DAO.PromocionesDAO;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "EliminarPromocion", urlPatterns = {"/EliminarPromocion"})
public class EliminarPromocion extends HttpServlet {
    private int idPromocion;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idPromocion = (int) request.getSession().getAttribute("idPromocion");
        try{
            Connection connection = conexion.getConnection();
            PromocionesDAO promocionesDAO = new PromocionesDAO(connection);
            promocionesDAO.eliminaPromocion(idPromocion);
            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Promociones/BuscarPromocion.jsp");
    }
}
