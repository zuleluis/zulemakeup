package controlador.citas;

import datos.DAO.CitasDAO;
import datos.DAO.ServiciosDAO;
import modelo.Citas;


import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "RegistrarCita", urlPatterns = {"/RegistrarCita"})
public class RegistrarCita extends HttpServlet {
    private Citas cita;
    private int idCita;
    private int fkCliente;
    private String fecha;
    private String hora;
    private String tipoLugar;
    private String lugar;
    private int fkPromocion;
    private float importe;
    private String nota;
    private String[] fkServicio;

    @Resource(name = "jdbc/database")
    private DataSource conexion;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        fkCliente = Integer.parseInt(request.getParameter("fkCliente"));
        fecha = request.getParameter("fecha");
        hora = request.getParameter("hora");
        tipoLugar = request.getParameter("tipoLugar");
        lugar = request.getParameter("lugar");
        fkPromocion = Integer.parseInt(request.getParameter("fkPromocion"));
        importe = Float.parseFloat(request.getParameter("importe"));
        nota = request.getParameter("nota");
        fkServicio = request.getParameterValues("fkServicio");

        try{
            Connection connection = conexion.getConnection();
            CitasDAO citasDAO = new CitasDAO(connection);

            hora = hora + ":00";

            boolean checkbox;
            boolean borrar = false;

            if (tipoLugar == null) checkbox = false;
            else checkbox = true;

            cita = new Citas(fkCliente, fecha, hora, checkbox, lugar, fkPromocion, importe, nota, borrar);
            idCita = citasDAO.insertaCita(cita);


            for(String item : fkServicio){
                //System.out.println(item);
                citasDAO.insertaCitaServicios(idCita, Integer.parseInt(item));
            }

            connection.close();


        }
        catch (SQLException e){
            e.printStackTrace();
        }

        response.sendRedirect("/zulemakeup/Citas/RegistrarCita.jsp");
    }
}
