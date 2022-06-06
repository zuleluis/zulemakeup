<%@ page import="modelo.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar servicio</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/ModificarServicio">
            <%
                Servicios servicio = (Servicios) session.getAttribute("datos");
                if (servicio != null){
            %>
            <tr>
                <p>Nombre <input type="text" name = "nombreServicio" value="<%out.print(servicio.getNombreServicio());%>"> </p>
                <p>Precio <input type="number" name = "precio" value="<%out.print(servicio.getPrecio());%>"> </p>
                <p>Descripcion <input type="text" name = "descripcion" value="<%out.print(servicio.getDescripcion());%>"> </p>

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
