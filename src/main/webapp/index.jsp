<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zule Makeup & Beauty</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilosImagen.css">
    <link rel="icon" href="/zulemakeup/Recursos/favicon.ico">
</head>
<body>
<header>
    <nav>
        <ul class="menu">
            <li class="navBar"> <a class="menu" href="/zulemakeup">Inicio</a> </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Citas</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Citas/ListaCitas.jsp">Lista de citas</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Citas/RegistrarCita.jsp">Registrar cita</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Citas/BuscarCita.jsp">Buscar cita</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Mis clientes</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Clientes/ListaClientes.jsp">Lista de clientes</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Clientes/RegistrarCliente.jsp">Registrar cliente</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Clientes/BuscarCliente.jsp">Buscar cliente</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Servicios </a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Servicios/ListaServicios.jsp">Lista de servicios</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Servicios/RegistrarServicio.jsp">Registrar servicio</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Servicios/BuscarServicio.jsp">Buscar servicio</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Promociones</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Promociones/ListaPromociones.jsp">Lista de promociones</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Promociones/RegistrarPromocion.jsp">Registrar promocion</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Promociones/BuscarPromocion.jsp">Buscar promocion</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Promociones/AgregaServicios.jsp">Agregar servicio a promocion</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Productos</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Productos/ListaProductos.jsp">Lista de productos</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Productos/RegistrarProducto.jsp">Registrar producto</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Productos/BuscarProducto.jsp">Buscar producto</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup">Sobre mi</a> </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup">Contacto</a> </li>
        </ul>
    </nav>
</header>


<img src="/zulemakeup/Recursos/Zule-Makeup-index.jpg" class="responsive margenNav">

<div class="gridContainer">
    <div class="gridItem1 montserrat18">
        <a class="texto" href="/zulemakeup/Citas/ListaCitas.jsp">
            <div class="margenSup boton">
                Citas
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/citas.png">
        </a>
    </div>

    <div class="gridItem2 montserrat18">
        <a class="texto" href="/zulemakeup/Clientes/ListaClientes.jsp">
            <div class="margenSup boton">
                Mis clientes
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/clientes.png">
        </a>
    </div>

    <div class="gridItem3 montserrat18">
        <a class="texto" href="/zulemakeup/Servicios/ListaServicios.jsp">
            <div class="margenSup boton">
                Servicios
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/servicios.png">
        </a>
    </div>

    <div class="gridItem4 montserrat18">
        <a class="texto" href="/zulemakeup/Promociones/ListaPromociones.jsp">
            <div class="margenSup boton">
                Promociones
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/promociones.png">
        </a>
    </div>

    <div class="gridItem5 montserrat18">
        <a class="texto" href="/zulemakeup/Productos/ListaProductos.jsp">
            <div class="margenSup boton">
                Productos
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/productos.png">
        </a>
    </div>
</div>
</body>
</html>
