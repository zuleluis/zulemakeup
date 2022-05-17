<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrar servicio</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/RegistrarServicio">
            <p>Nombre <input type="text" name = "nombreServicio"> </p>
            <p>Precio <input type="number" name = "precio"> </p>
            <p>Descripción <input type="text" name = "descripcion"> </p>

            <p class="center-content">
                <input type="submit" value="Registrar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>
