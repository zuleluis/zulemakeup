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
