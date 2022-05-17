package controlador.promociones;

import datos.DAO.CitasDAO;
import datos.DAO.PromocionesDAO;
import modelo.Promociones;
import modelo.auxiliares.CitasServicios;
import modelo.auxiliares.JoinCitas;
import modelo.auxiliares.PromoServicios;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet(name = "BuscarPromocion", urlPatterns = {"/BuscarPromocion"})
public class BuscarPromocion extends HttpServlet {
    private int idPromocion;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idPromocion = Integer.parseInt(request.getParameter("idpromocion"));

        try{
            Connection connection = conexion.getConnection();
            PromocionesDAO promocionesDAO = new PromocionesDAO(connection);
            Promociones promocion = promocionesDAO.getPromocion(idPromocion);

            if (promocion != null){
                request.getSession().setAttribute("idPromocion", promocion.getIdPromocion());
                request.getSession().setAttribute("encontrado", true);
                request.getSession().setAttribute("servicios", promocionesDAO.getPromoServicios(idPromocion));
            }
            else{
                request.getSession().setAttribute("idPromocion", null);
                request.getSession().setAttribute("encontrado", false);
            }
            request.getSession().setAttribute("idPromocion", null);
            request.getSession().setAttribute("datos", promocion);

            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("encontrado",false);
            request.getSession().setAttribute("servicios", new LinkedList<PromoServicios>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Promociones/BuscarPromocion.jsp");
    }
}
