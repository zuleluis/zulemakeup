//Agrega servicios a una promoción

package controlador.promociones;

import datos.DAO.PromocionesDAO;
import modelo.Citas;
import modelo.Promociones;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "RegistrarServicios", urlPatterns= {"/RegistrarServicios"})
public class RegistrarServicios extends HttpServlet {
    private int fkPromocion;
    private int fkServicio;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        fkPromocion = Integer.parseInt(request.getParameter("fkPromocion"));
        fkServicio = Integer.parseInt(request.getParameter("fkServicio"));

        try{
            Connection connection = conexion.getConnection();
            PromocionesDAO promocionesDAO = new PromocionesDAO(connection);

            //System.out.println("Promocion: " + fkPromocion);
            //System.out.println("Servicio: " + fkServicio);

            promocionesDAO.insertaPromoServicios(fkPromocion, fkServicio);

            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        response.sendRedirect("/zulemakeup/Promociones/AgregaServicios.jsp");
    }
}
