package controlador.promociones;

import datos.DAO.PromocionesDAO;
import datos.DAO.ServiciosDAO;
import modelo.Promociones;
import modelo.Servicios;
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

@WebServlet(name = "EliminarServicios", urlPatterns = {"/EliminarServicios"})
public class EliminarServicios extends HttpServlet {
    private String[] fkServicio;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Connection connection = conexion.getConnection();

            fkServicio = request.getParameterValues("fkServicio");

            for(String item : fkServicio){
                System.out.println(item);
            }

            connection.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/zulemakeup/Promociones/Promociones.jsp");
    }
}
