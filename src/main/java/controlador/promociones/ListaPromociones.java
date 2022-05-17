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
import java.util.LinkedList;

@WebServlet(name = "ListaPromociones", urlPatterns = {"/ListaPromociones"})
public class ListaPromociones extends HttpServlet {
    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();
            PromocionesDAO promocionesDAO = new PromocionesDAO(connection);
            request.getSession().setAttribute("datos", promocionesDAO.getPromociones());
            connection.close();
        } catch (SQLException e){
            request.getSession().setAttribute("datos", new LinkedList<Promociones>());
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Promociones/ListaPromociones.jsp");
    }
}
