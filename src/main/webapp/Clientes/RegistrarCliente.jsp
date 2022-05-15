<%@ page import="modelo.Clientes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Registro de Clientes</title>
</head>
<body>
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
