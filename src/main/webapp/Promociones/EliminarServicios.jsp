<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.auxiliares.PromoServicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Eliminar servicios</title>
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
    <h1>Lista de Promociones</h1>
    <h1>Lista de Promociones</h1>
    <h1>Lista de Promociones</h1><h1>Lista de Promociones</h1>

    <div class="container">
        <form method="post" action="/zulemakeup/EliminarServicios">
            <p>Servicios
                <select name="fkServicio" multiple>
                    <%
                        LinkedList<PromoServicios> lista = (LinkedList)session.getAttribute("servicios");
                        if(lista != null){
                            for (PromoServicios servicio : lista){%>
                            <option value ="<%=servicio.getServicio().getIdServicio()%>"><%=servicio.getServicio().getNombreServicio()%></option>
                            <%}
                        }
                        session.removeAttribute("servicios");
                    %>
                </select>
            </table>
            </p>
            <p class="center-content">
                <input type="submit" value="Eliminar servicios"/>
            </p>
        </form>
    </div>
</main>
</body>
</html>
