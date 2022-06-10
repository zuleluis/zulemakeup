<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clientes</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="icon" href="/zulemakeup/Recursos/favicon.ico">
</head>
<body>
<header>
    <nav>
        <ul class="menu">
            <li class="navBar"> <a class="menu" href="/zulemakeup">Inicio</a> </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup/Citas/Citas.jsp">Citas</a> </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true" href="/zulemakeup/Clientes/Clientes.jsp">Mis clientes</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Clientes/ListaClientes.jsp">Lista de clientes</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Clientes/ListaClientes.jsp">Registrar cliente</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup/Servicios/Servicios.jsp">Servicios </a> </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li>
        </ul>
    </nav>
</header>

<main>
    <div class="margenNav gridContainer">
        <div class="gridItemA montserrat18">
            <a class="texto" href="/zulemakeup/Clientes/ListaClientes.jsp">
                <div class="margenSup boton">
                    Lista de clientes
                </div>
            </a>
        </div>

        <div class="gridItemB montserrat18">
            <a class="texto" href="/zulemakeup/Clientes/RegistrarCliente.jsp">
                <div class="margenSup boton">
                    Registrar cliente
                </div>
            </a>
        </div>

        <div class="gridItemC montserrat18">
            <a class="texto" href="/zulemakeup/Clientes/BuscarCliente.jsp">
                <div class="margenSup boton">
                    Buscar cliente
                </div>
            </a>
        </div>
    </div>
</main>

</body>
</html>
