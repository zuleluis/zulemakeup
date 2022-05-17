<%@ page import="modelo.Promociones" %>
<%@ page import="modelo.auxiliares.PromoServicios" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Busqueda de promoción</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/BuscarPromocion">
            <p>Id <input type="number" name="idpromocion"/></p>
            <p class="center-content">
                <input type="submit" value="Buscar"/>
            </p>
            <%
            Boolean estado = (Boolean) session.getAttribute("encontrado");
            Promociones promocion = (Promociones) session.getAttribute("datos");
            LinkedList<PromoServicios> lista = (LinkedList)session.getAttribute("servicios");

            if (estado != null){
                if (estado){
                    session.setAttribute("idPromocion", promocion.getIdPromocion());
                %>  <tr>
                    <tr>Nombre: <%out.print(promocion.getNombrePromocion());%></tr>
                    <tr>Precio: <%out.print(promocion.getPrecio());%></tr>
                    <tr>Estado: <%if (promocion.isEstado()) out.print("Activa"); else out.print("Inactiva");%></tr>
                    <p/>
                    <td>Servicios: </td>
                    <table><%
                        if(lista != null){
                            for (PromoServicios servicio : lista){%>
                                <tr><td><%out.print(servicio.getServicio().getNombreServicio());%></td></tr>
                            <%}
                        }
                    %></table>
                    <p/>
                    </tr>
                    <p/>
                    <p/>
                    <form action="../index.jsp">
                        <p class="center-content"><input type="submit" value="Modificar"/></p>
                    </form>
                    <form method="post" action="/zulemakeup/EliminarPromocion">
                        <p class="center-content"><input type="submit" value="Eliminar"/></p>
                    </form>
                    <%
                    }
                else %><p>Promoción no encontrada</p><%
            }
            session.removeAttribute("datos");
            session.removeAttribute("encontrado");
            session.removeAttribute("servicios");
            %>
        </form>
    </div>
</main>

</body>
</html>
