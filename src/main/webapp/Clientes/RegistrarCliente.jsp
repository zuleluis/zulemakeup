<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Registro de Clientes</title>
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
        <form method="post" action="/zulemakeup/RegistrarCliente">
            <p>Nombre <input type="text" name = "nombre"> </p>
            <p>Apellido paterno <input type="text" name = "apPaterno"> </p>
            <p>Apellito materno <input type="text" name = "apMaterno"> </p>
            <p>Fecha de nacimiento <input type="date" name = "fechaNac"> </p>
            <p>Calle <input type="text" name = "calle"> </p>
            <p>Numero <input type="number" name = "numero"> </p>
            <p>Colonia <input type="text" name = "colonia"> </p>
            <p>Ciudad <input type="text" name = "ciudad"> </p>
            <p>Numero telefónico <input type="text" maxlength="12" name = "numTel"> </p>
            <p class="center-content">
                <input type="submit" value="Registrar"/>
            </p>
        </form>
    </div>
</main>
</body>
</html>
