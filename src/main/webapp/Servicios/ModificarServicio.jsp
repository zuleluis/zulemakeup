<%@ page import="modelo.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar servicio</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="icon" href="/zulemakeup/Recursos/favicon.ico">
</head>
<body>
<header>
    <nav class="navigation">
        <ul class="menu">
            <li class="menu"> <a class="menu" href="/zulemakeup">Inicio</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Citas/Citas.jsp">Citas</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Clientes/Clientes.jsp">Mis clientes</a> </li>
            <li class="menu"> <a class="menu active" href="/zulemakeup/Servicios/Servicios.jsp">Servicios </a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li>
        </ul>
    </nav>
</header>


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
