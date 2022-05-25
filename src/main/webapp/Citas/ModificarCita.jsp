<%@ page import="modelo.auxiliares.JoinCitas" %>
<%@ page import="modelo.auxiliares.CitasServicios" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Promociones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar cita</title>
</head>
<body>
<main class="main">
    <div class="container">
        <%
            JoinCitas cita = (JoinCitas) session.getAttribute("datos");
            LinkedList<CitasServicios> lista = (LinkedList)session.getAttribute("servicios");
            LinkedList<Promociones> listapromos = (LinkedList)session.getAttribute("promociones");

            if (cita != null){
                %>
                <tr>
                <p>Fecha <input type="date" name = "fecha" value="<%out.print(cita.getCita().getFecha());%>"> </p>
                <p>Hora <input type="time" name = "hora" value="<%out.print(cita.getCita().getHora());%>"> </p>
                <p>Servicio a domicilio <% if (cita.getCita().isTipoLugar()){%> <label><input type="checkbox" name = "tipoLugar" checked></label> <%} else %> <label><input type="checkbox" name = "tipoLugar"></label></p>
                <p>Lugar <input type="text" name = "lugar" value="<%out.print(cita.getCita().getLugar());%>"> </p>
                <p>Importe <input type="number" name = "importe" value="<%out.print(cita.getCita().getImporte());%>"> </p>
                <p>Nota <input type="text" name = "nota" value="<%out.print(cita.getCita().getNota());%>"> </p>

                <p/>
                <td>Servicios: </td>
                <table>
                    <%
                    if(lista != null){
                        for (CitasServicios servicio : lista){%>
                    <tr><td><%out.print(servicio.getServicio().getNombreServicio());%></td></tr>
                        <%}
                    }%>
                </table>
                <p/>
                <td>Promociones: </td>
                <table>
                    <%if(listapromos != null){
                        for (Promociones promocion : listapromos){%>
                            <tr><td><%out.print(promocion.getNombrePromocion());%></td></tr>
                        <%}
                    }%>
                </table>
                </tr>
                <%
            }
        %>
    </div>
</main>

</body>
</html>
