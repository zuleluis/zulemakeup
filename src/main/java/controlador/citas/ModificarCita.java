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
    private Boolean tLugar;
    private String lugar;
    private int fkPromocion;
    private float importe;
    private String nota;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        idCita = (int) request.getSession().getAttribute("idCita");
        this.fecha = request.getParameter("fecha");
        this.hora = request.getParameter("hora");
        this.tipoLugar = request.getParameter("tipoLugar");
        this.lugar = request.getParameter("lugar");
        this.fkPromocion = Integer.parseInt(request.getParameter("fkPromocion"));
        this.importe = Float.parseFloat(request.getParameter("importe"));
        this.nota = request.getParameter("nota");

        try{
            Connection connection = conexion.getConnection();
            citasDAO = new CitasDAO(connection);
            promocionesDAO = new PromocionesDAO(connection);

            JoinCitas cita = citasDAO.getCita(idCita);

            request.getSession().setAttribute("datos", cita);
            request.getSession().setAttribute("servicios", citasDAO.getCitasServicios(idCita));
            request.getSession().setAttribute("promociones", promocionesDAO.getPromociones());

            if (tipoLugar == null) tLugar = false;
            else tLugar = true;

            if (actualizacion()){
                request.getSession().setAttribute("modificacion", true);
                response.sendRedirect("/zulemakeup/Citas/BuscarCita.jsp");
            }
            else{
                request.getSession().setAttribute("modificacion", false);
                response.sendRedirect("/zulemakeup/Citas/ModificarCita.jsp");
            }


            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
            request.getSession().setAttribute("promociones", new LinkedList<Promociones>());
        }
        response.sendRedirect("/zulemakeup/Citas/ModificarCita.jsp");
    }

    private boolean actualizacion() throws SQLException{
        boolean estado = false; //Variable que indica si se ejecutó o no la actualización
        if (fecha != null) citasDAO.modificaFecha(idCita, fecha);
        if (hora != null) citasDAO.modificaHora(idCita, hora);
        if (tipoLugar != null) citasDAO.modificaEstatusLugar(idCita, Boolean.parseBoolean(tipoLugar));
        if (lugar != null) citasDAO.modificaLugar(idCita, lugar);
        //if (fkPromocion != null) citasDAO.modificaPromocion(idCita, fkPromocion);
        //if (importe != null) citasDAO.modificaFecha(idCita, fecha);
        if (nota != null) citasDAO.modificaNota(idCita, fecha);

        return estado;
    }
}
