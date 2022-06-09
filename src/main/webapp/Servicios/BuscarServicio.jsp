<%@ page import="modelo.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buscar servicio</title>
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
                        <form method="post" action="/zulemakeup/ModificarServicio">
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
