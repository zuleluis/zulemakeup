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
    <nav class="navigation">
        <ul class="menu">
            <li class="menu"> <a class="active menu" href="/zulemakeup">Sobre mi</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Citas/Citas.jsp">Contactame</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Clientes/Clientes.jsp">DAW</a> </li>
            <%-- <li class="menu"> <a class="menu" href="/zulemakeup/Servicios/Servicios.jsp">Servicios </a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li> --%>
        </ul>
    </nav>
</header>

<img src="/zulemakeup/Recursos/Zule-Makeup-index.jpg" class="responsive">

<%-- Todo lo de aqui se va a eliminar --%>
<li> <a href="/zulemakeup">Inicio</a> </li>
<li> <a href="/zulemakeup/Clientes/ListaClientes.jsp">Mostrar lista de clientes</a> </li>
<li> <a href="/zulemakeup/Clientes/RegistrarCliente.jsp">Registrar cliente</a> </li>
<li> <a href="/zulemakeup/Clientes/BuscarCliente.jsp">Buscar cliente</a> </li>

<li> <a href="/zulemakeup/Citas/ListaCitas.jsp">Mostrar lista de citas</a> </li>
<li> <a href="/zulemakeup/Citas/RegistrarCita.jsp">Registrar cita</a> </li>
<li> <a href="/zulemakeup/Citas/BuscarCita.jsp">Buscar cita</a> </li>

<li> <a href="/zulemakeup/Productos/ListaProductos.jsp">Mostrar lista de productos</a> </li>
<li> <a href="/zulemakeup/Productos/RegistrarProducto.jsp">Registrar producto</a> </li>
<li> <a href="/zulemakeup/Productos/BuscarProducto.jsp">Buscar producto</a> </li>

<li> <a href="/zulemakeup/Promociones/ListaPromociones.jsp">Mostrar lista de promociones</a> </li>
<li> <a href="/zulemakeup/Promociones/RegistrarPromocion.jsp">Registrar promocion</a> </li>
<li> <a href="/zulemakeup/Promociones/BuscarPromocion.jsp">Buscar promocion</a> </li>
<li> <a href="/zulemakeup/Promociones/AgregaServicios.jsp">Agregar servicios a promoción</a> </li>

<li> <a href="/zulemakeup/Servicios/ListaServicios.jsp">Mostrar lista de servicios</a> </li>
<li> <a href="/zulemakeup/Servicios/RegistrarServicio.jsp">Registrar servicio</a> </li>
<li> <a href="/zulemakeup/Servicios/BuscarServicio.jsp">Buscar servicio</a> </li>
<%-- Hasta aquí :) --%>



<div class="gridContainer">
    <div class="gridItem1 montserrat18">
        <a class="texto" href="/zulemakeup/Citas/Citas.jsp">
            <div class="margenSup boton">
                Citas
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/citas.png">
        </a>
    </div>

    <div class="gridItem2 montserrat18">
        <a class="texto" href="/zulemakeup/Clientes/Clientes.jsp">
            <div class="margenSup boton">
                Mis clientes
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/clientes.png">
        </a>
    </div>

    <div class="gridItem3 montserrat18">
        <a class="texto" href="/zulemakeup/Servicios/Servicios.jsp">
            <div class="margenSup boton">
                Servicios
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/servicios.png">
        </a>
    </div>

    <div class="gridItem4 montserrat18">
        <a class="texto" href="/zulemakeup/Promociones/Promociones.jsp">
            <div class="margenSup boton">
                Promociones
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/promociones.png">
        </a>
    </div>

    <div class="gridItem5 montserrat18">
        <a class="texto" href="/zulemakeup/Productos/Productos.jsp">
            <div class="margenSup boton">
                Productos
            </div>
            <img class="responsive escala50" src="/zulemakeup/Recursos/productos.png">
        </a>
    </div>
</div>
</body>
</html>
