package controlador.promociones;

import datos.DAO.PromocionesDAO;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "EliminarServicios", urlPatterns = {"/EliminarServicios"})
public class EliminarServicios extends HttpServlet {
    private int idPromocion;
    private String[] fkServicio;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            PromocionesDAO promocionesDAO = new PromocionesDAO(connection);

            idPromocion = (int) request.getSession().getAttribute("idPromocion");
            fkServicio = request.getParameterValues("fkServicio");

            for(String item : fkServicio){
                promocionesDAO.eliminaServicio(idPromocion, Integer.parseInt(item));
            }

            connection.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Promociones/Promociones.jsp");
    }
}
