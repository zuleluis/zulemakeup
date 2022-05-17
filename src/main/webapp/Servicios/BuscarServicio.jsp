<%@ page import="modelo.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buscar servicio</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/BuscarServicio">
            <p>Id <input type="number" name="idservicio"/></p>
            <p class="center-content">
                <input type="submit" value="Buscar"/>
            </p>
        </form>

        <%
            Boolean estado = (Boolean) session.getAttribute("encontrado");
            Servicios servicio = (Servicios) session.getAttribute("datos");

            if (estado != null){
                if (estado){
                    session.setAttribute("idServicio", servicio.getIdServicio());
                    %>
                        <tr>
                            <tr>Nombre:<%out.print(servicio.getNombreServicio());%></tr>
                            <tr>Precio:<%out.print(servicio.getPrecio());%></tr>
                            <tr>Descripción:<%out.print(servicio.getDescripcion());%></tr>
                        </tr>
                        <p/>
                        <p/>
                        <form action="../index.jsp">
                            <p class="center-content"><input type="submit" value="Modificar"/></p>
                        </form>
                        <form method="post" action="/zulemakeup/EliminarServicio">
                            <p class="center-content"><input type="submit" value="Eliminar"/></p>
                        </form>
                    <%
                }
                else %><p>Servicio no encontrado</p><%
                session.removeAttribute("datos");
                session.removeAttribute("encontrado");
            }
        %>
    </div>
</main>

</body>
</html>
