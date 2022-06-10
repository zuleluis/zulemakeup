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
    <nav class="navigation">
        <ul class="menu">
            <li class="menu"> <a class="menu" href="/zulemakeup">Inicio</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Citas/Citas.jsp">Citas</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Clientes/Clientes.jsp">Mis clientes</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Servicios/Servicios.jsp">Servicios </a> </li>
            <li class="menu"> <a class="menu active" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li>
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
