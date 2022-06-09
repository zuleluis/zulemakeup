<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Promociones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Lista de promociones</title>
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
        <table align="center">
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Estado</th>
            </tr>
            </thead>
            <%
                LinkedList<Promociones> lista = (LinkedList)session.getAttribute("datos");
                //System.out.println(lista);
                if (lista != null){
                    for (Promociones promocion : lista){
            %><tr>
                <td><%out.print(promocion.getNombrePromocion());%></td>
                <td><%out.print("$" + promocion.getPrecio());%></td>
                <td><%if (promocion.isEstado()) out.print("Activo"); else out.print("Inactivo");%></td>
                </tr><%
                    }
                }
                else response.sendRedirect("/zulemakeup/ListaPromociones");
            session.removeAttribute("datos");
            %>
        </table>
    </div>
</main>
</body>
</html>
