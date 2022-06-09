<%@ page import="modelo.Servicios" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de servicios</title>
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
            <li class="menu"> <a class="menu active" href="/zulemakeup/Servicios/Servicios.jsp">Servicios </a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li>
        </ul>
    </nav>
</header>

<main class="main">
    <div class="container">
        <table>
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Descripción</th>
            </tr>
            </thead>
            <%
                LinkedList<Servicios> lista = (LinkedList)session.getAttribute("datos");
                //System.out.println(lista);
                if (lista != null){
                    for (Servicios servicio : lista){
                    %><tr>
                        <td><%out.print(servicio.getNombreServicio());%></td>
                        <td><%out.print("$" + servicio.getPrecio());%></td>
                        <td><%out.print(servicio.getDescripcion());%></td>
                    </tr><%
                    }
                }
                else response.sendRedirect("/zulemakeup/ListaServicios");
                session.removeAttribute("datos");
            %>
        </table>
    </div>
</main>

</body>
</html>
