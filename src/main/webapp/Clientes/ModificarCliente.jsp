<%@ page import="modelo.Clientes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar cliente</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="icon" href="/zulemakeup/Recursos/favicon.ico">
</head>
<body>
<header>
    <nav class="navigation">
        <ul class="menu">
            <li class="menu"> <a class="menu" href="/zulemakeup">Inicio</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Citas/Citas.jsp">Citas</a> </li>
            <li class="menu"> <a class="menu active" href="/zulemakeup/Clientes/Clientes.jsp">Mis clientes</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Servicios/Servicios.jsp">Servicios </a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li>
        </ul>
    </nav>
</header>

<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/ModificarCliente">
            <%
                Clientes cliente = (Clientes) session.getAttribute("datos");
                if (cliente != null){
            %>
            <tr>
                <p>Nombre <input type="text" name = "nombre" value="<%out.print(cliente.getNombre());%>"> </p>
                <p>Apellido paterno <input type="text" name = "apPaterno" value="<%out.print(cliente.getApPaterno());%>"> </p>
                <p>Apellito materno <input type="text" name = "apMaterno" value="<%out.print(cliente.getApMaterno());%>"> </p>
                <p>Fecha de nacimiento <input type="date" name = "fechaNac" value="<%out.print(cliente.getFechaNac());%>"> </p>
                <p>Calle <input type="text" name = "calle" value="<%out.print(cliente.getCalle());%>"> </p>
                <p>Numero <input type="number" name = "numero" value="<%out.print(cliente.getNumero());%>"> </p>
                <p>Colonia <input type="text" name = "colonia" value="<%out.print(cliente.getColonia());%>"> </p>
                <p>Ciudad <input type="text" name = "ciudad" value="<%out.print(cliente.getCiudad());%>"> </p>
                <p>Numero telefónico <input type="text" maxlength="12" name = "numTel" value="<%out.print(cliente.getNumTel());%>"> </p>
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
