<%@ page import="modelo.Promociones" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agrega servicios</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/RegistrarServicios">
            <p>Promoción <select name="fkPromocion" >
                <%
                LinkedList<Promociones> promociones = (LinkedList)session.getAttribute("promociones");
                if (promociones != null){
                    for (Promociones promocion : promociones){%>
                        <option value ="<%=promocion.getIdPromocion()%>"><%=promocion.getNombrePromocion()%></option>
                    <%}
                }
                else response.sendRedirect("/zulemakeup/MapeoPromociones");
                %>
            </select>
            </p>

            <p>Servicios <select name="fkServicio">
                <%
                LinkedList<Servicios> servicios = (LinkedList)session.getAttribute("servicios");
                if (servicios != null){
                    for (Servicios servicio : servicios){%>
                        <option value ="<%=servicio.getIdServicio()%>"><%=servicio.getNombreServicio()%></option>
                    <%}
                }
                session.removeAttribute("servicios");
                session.removeAttribute("promociones");%>
            </select>
            </p>
            <p class="center-content">
                <input type="submit" value="Agregar"/>
            </p>
        </form>
    </div>
</main>
</body>
</html>
