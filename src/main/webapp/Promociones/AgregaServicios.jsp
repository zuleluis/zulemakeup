<%@ page import="modelo.Promociones" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agrega servicios</title>
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
        <form method="post" action="/zulemakeup/RegistrarServicios">
            <p>Promoción <select name="fkPromocion" >
                <%
                LinkedList<Promociones> promociones = (LinkedList)session.getAttribute("promociones");
                if (promociones != null){
                    for (Promociones promocion : promociones){%>
                        <option value ="<%=promocion.getIdPromocion()%>"><%=promocion.getNombrePromocion()%></option>
                    <%}
                }
                else response.sendRedirect("/zulemakeup/MapeoPromociones");
                %>
            </select>
            </p>

            <p>Servicios <select name="fkServicio">
                <%
                LinkedList<Servicios> servicios = (LinkedList)session.getAttribute("servicios");
                if (servicios != null){
                    for (Servicios servicio : servicios){%>
                        <option value ="<%=servicio.getIdServicio()%>"><%=servicio.getNombreServicio()%></option>
                    <%}
                }
                session.removeAttribute("servicios");
                session.removeAttribute("promociones");%>
            </select>
            </p>
            <p class="center-content">
                <input type="submit" value="Agregar"/>
            </p>
        </form>
    </div>
</main>
</body>
</html>
