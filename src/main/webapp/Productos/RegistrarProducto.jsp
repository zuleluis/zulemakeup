<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.catalogos.Marcas" %>
<%@ page import="modelo.catalogos.Aplicacion" %>
<%@ page import="modelo.catalogos.Tipos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro de producto</title>
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
        <form method="post" action="/zulemakeup/RegistrarProducto">
            <p>Marca <select name="fkMarca" >
                <%
                    LinkedList<Marcas> listamarcas = (LinkedList)session.getAttribute("marcas");
                    if (listamarcas != null){
                        for (Marcas marcas : listamarcas){
                %>
                <option value ="<%=marcas.getIdMarca()%>"><%=marcas.getNombre()%></option>
                <%
                        }
                    }
                    else response.sendRedirect("/zulemakeup/MapeoProductos");
                %>
            </select>
            </p>
            <p>Nombre <input type="text" name = "nombreProducto"> </p>
            <p>Aplicación <select name="fkAplicacion" >
                <%
                    LinkedList<Aplicacion> listaaplicacion = (LinkedList)session.getAttribute("aplicaciones");
                    if (listaaplicacion != null){
                        for (Aplicacion aplicacion : listaaplicacion){
                %>
                <option value ="<%=aplicacion.getIdAplicacion()%>"><%=aplicacion.getNombre()%></option>
                <%      }
                    }%>
            </select>
            </p>
            <p>Tipo <select name="fkTipo" >
                <%
                    LinkedList<Tipos> listatipo = (LinkedList)session.getAttribute("tipos");
                    if (listatipo != null){
                        for (Tipos tipo : listatipo){
                %>
                <option value ="<%=tipo.getIdTipo()%>"><%=tipo.getNombre()%></option>
                <%      }
                }
                    session.removeAttribute("marcas");
                    session.removeAttribute("tipos");
                    session.removeAttribute("aplicaciones");
                %>
            </select>
            </p>
            <p>Modelo <input type="text" name = "modelo"> </p>
            <p>Cantidad <input type="number" name = "cantidad"> </p>
            <p>Agotado <label><input type="checkbox" name = "agotado"></label> </p>

            <p class="center-content">
                <input class="botonSubmit" type="submit" value="Registrar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>
