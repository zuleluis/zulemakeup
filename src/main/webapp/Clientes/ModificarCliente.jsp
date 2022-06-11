<%@ page import="modelo.Clientes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar cliente</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilosForm.css" type="text/css">
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
            <li class="navBar"> <a class="menu" href="/zulemakeup/SobreMi.jsp">Sobre mi</a> </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup/Contacto.jsp">Contacto</a> </li>
        </ul>
    </nav>
</header>

<main class="boxContainer">
    <div class="margenNav box">
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
                <input class="botonSubmit" type="submit" value="Modificar"/>
            </p>
        </form>
    </div>

</main>

</body>
</html>
