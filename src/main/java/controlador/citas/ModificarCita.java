package controlador.citas;

import datos.DAO.CitasDAO;
import datos.DAO.PromocionesDAO;
import modelo.Promociones;
import modelo.auxiliares.JoinCitas;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet(name = "ModificarCita", urlPatterns = {"/ModificarCita"})
public class ModificarCita extends HttpServlet {
    private int idCita;
    CitasDAO citasDAO;
    PromocionesDAO promocionesDAO;

    private String fecha;
    private String hora;
    private String tipoLugar;
    private String lugar;
    private String fkPromocion;
    private String importe;
    private String nota;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idCita = (int) request.getSession().getAttribute("idCita");
        fecha = request.getParameter("fecha");
        hora = request.getParameter("hora");
        tipoLugar = request.getParameter("tipoLugar");
        lugar = request.getParameter("lugar");
        fkPromocion = request.getParameter("fkPromocion");
        importe = request.getParameter("importe");
        nota = request.getParameter("nota");

        try{
            Connection connection = conexion.getConnection();
            citasDAO = new CitasDAO(connection);
            promocionesDAO = new PromocionesDAO(connection);

            JoinCitas cita = citasDAO.getCita(idCita);

            request.getSession().setAttribute("datos", cita);
            request.getSession().setAttribute("servicios", citasDAO.getCitasServicios(idCita));
            request.getSession().setAttribute("promociones", promocionesDAO.getPromociones());

            if (fecha != null && hora != null && lugar != null && fkPromocion != null && importe != null && nota != null){
                citasDAO.modificaFecha(idCita, fecha);

                if (hora.length() == 8) citasDAO.modificaHora(idCita, hora);
                else citasDAO.modificaHora(idCita, hora + ":00");

                if (tipoLugar == null) citasDAO.modificaEstatusLugar(idCita, false);
                else citasDAO.modificaEstatusLugar(idCita, true);

                citasDAO.modificaLugar(idCita, lugar);
                citasDAO.modificaPromocion(idCita, Integer.parseInt(fkPromocion));
                citasDAO.modificaImporte(idCita, Float.parseFloat(importe));
                citasDAO.modificaNota(idCita, nota);
            }

            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
            request.getSession().setAttribute("promociones", new LinkedList<Promociones>());
        }
        response.sendRedirect("/zulemakeup/Citas/ModificarCita.jsp");
    }

}