<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro de promoción</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/RegistrarPromocion">
            <p>Nombre <input type="text" name = "nombrePromocion"> </p>
            <p>Precio <input type="number" name = "precio"> </p>
            <p>Activo <label><input type="checkbox" name = "estado"></label> </p>

            <p class="center-content">
                <input type="submit" value="Registrar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>
