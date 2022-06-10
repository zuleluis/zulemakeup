<%@ page import="modelo.Promociones" %>
<%@ page import="modelo.auxiliares.PromoServicios" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Busqueda de promoción</title>
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
        <h1>Lista de Promociones</h1>
        <h1>Lista de Promociones</h1>
        <h1>Lista de Promociones</h1>
        <h1>Lista de Promociones</h1>
        <form method="post" action="/zulemakeup/BuscarPromocion">
            <p>Id <input type="number" name="idpromocion"/></p>
            <p class="center-content">
                <input type="submit" value="Buscar"/>
            </p>
        </form>
            <%
            Boolean estado = (Boolean) session.getAttribute("encontrado");
            Promociones promocion = (Promociones) session.getAttribute("datos");
            LinkedList<PromoServicios> lista = (LinkedList)session.getAttribute("servicios");

            if (estado != null){
                if (estado){
                    session.setAttribute("idPromocion", promocion.getIdPromocion());
                %>  <tr>
                    <tr>Nombre: <%out.print(promocion.getNombrePromocion());%></tr>
                    <tr>Precio: <%out.print(promocion.getPrecio());%></tr>
                    <tr>Estado: <%if (promocion.isEstado()) out.print("Activa"); else out.print("Inactiva");%></tr>
                    <p/>
                    <td>Servicios: </td>
                    <table><%
                        if(lista != null){
                            for (PromoServicios servicio : lista){%>
                                <tr><td><%out.print(servicio.getServicio().getNombreServicio());%></td></tr>
                            <%}
                        }
                    %></table>
                    <p/>
                    </tr>
                    <p/>
                    <p/>
        <h1>Lista de Promociones</h1>
        <h1>Lista de Promociones</h1>
        <h1>Lista de Promociones</h1>
        <h1>Lista de Promociones</h1>
                    <form method="post" action="/zulemakeup/ModificarPromocion">
                        <p class="center-content"><input type="submit" value="Modificar datos"/></p>
                    </form>
                    <form method="get" action="/zulemakeup/MapeoServicios">
                        <p class="center-content"><input type="submit" value="Modificar servicios"/></p>
                    </form>
                    <form method="post" action="/zulemakeup/EliminarPromocion">
                        <p class="center-content"><input type="submit" value="Eliminar promocion"/></p>
                    </form>
                    <%
                    }
                else %><p>Promoción no encontrada</p><%
            }
            session.removeAttribute("datos");
            session.removeAttribute("encontrado");
            session.removeAttribute("servicios");
            %>
    </div>
</main>

</body>
</html>
