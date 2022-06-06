<%@ page import="modelo.Promociones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Promocion</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/ModificarPromocion">
            <%
                Promociones promocion = (Promociones) session.getAttribute("datos");
                if (promocion != null){
            %>
            <tr>
                <p>Nombre <input type="text" name = "nombrePromocion" value="<%out.print(promocion.getNombrePromocion());%>"> </p>
                <p>Precio <input type="number" name = "precio" value="<%out.print(promocion.getPrecio());%>"> </p>
                <p>Disponibilidad <% if (promocion.isEstado()){%> <label><input type="checkbox" name = "estado" checked></label> <%} else %> <label><input type="checkbox" name = "estado"></label></p>

            </tr>
            <%
                }
                session.removeAttribute("datos");
            %>
            <p class="center-content">
                <input type="submit" value="Modificar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>
