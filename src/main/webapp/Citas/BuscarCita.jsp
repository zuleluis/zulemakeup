<%@ page import="modelo.auxiliares.JoinCitas" %>
<%@ page import="modelo.auxiliares.CitasServicios" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Búsqueda de citas</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/BuscarCita">
            <p>Id <input type="number" name="idcita"/></p>
            <p class="center-content">
                <input type="submit" value="Buscar"/>
            </p>
        </form>
        <%!
            %><%
            Boolean estado = (Boolean) session.getAttribute("encontrado");
            JoinCitas cita = (JoinCitas) session.getAttribute("datos");
            LinkedList<CitasServicios> lista = (LinkedList)session.getAttribute("servicios");

            if (estado != null){
                if (estado){
                    session.setAttribute("idCita", cita.getCita().getIdCita());
            %><tr>
            <tr>Cliente: <%out.print(cita.getCliente().getNombre() + " " +  cita.getCliente().getApPaterno() + " " + cita.getCliente().getApMaterno());%></tr>
            <tr>Fecha: <%out.print(cita.getCita().getFecha() + " - " + cita.getCita().getHora());%></tr>
            <tr>Servicio a domicilio: <%if (cita.getCita().isTipoLugar()){out.print(cita.getCita().getLugar());} else out.print("No");%></tr>
            <tr>Importe: <%out.print("$" + cita.getCita().getImporte());%></tr>
            <tr>Nota: <%out.print(cita.getCita().getNota());%></tr>
            <tr>Estado: <%if (cita.getCita().isBorrar()) out.print("Cancelada"); else out.print("Activa");%></tr>

            <p/>
            <td>Servicios: </td>
            <table>
                <%
                    if(lista != null){
                    for (CitasServicios servicio : lista){%>
                    <tr><td><%out.print(servicio.getServicio().getNombreServicio());%></td></tr>
                    <%}
                }
                %>
            </table>
            <p/>
            <td>Promoción: <%out.print(cita.getPromocion().getNombrePromocion());%></td>
        </tr>
            <p/>
            <p/>
            <form action="../index.jsp">
                <p class="center-content"><input type="submit" value="Modificar"/></p>
            </form>
            <form method="post" action="/zulemakeup/CancelarCita">
                <p class="center-content"><input type="submit" value="Eliminar"/></p>
            </form>
            <%
            }
            else {
            %><p>Cita no encontrada</p><%
                }
            }
            session.removeAttribute("datos");
            session.removeAttribute("encontrado");
            session.removeAttribute("servicios");
        %>
    </div>
</main>

</body>
</html>