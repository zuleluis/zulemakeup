<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.auxiliares.JoinCitas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Lista de citas</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="icon" href="/zulemakeup/Recursos/favicon.ico">
</head>
<body>
<header>
    <nav class="navigation">
        <ul class="menu">
            <li class="menu"> <a class="menu" href="/zulemakeup">Inicio</a> </li>
            <li class="menu"> <a class="menu active" href="/zulemakeup/Citas/Citas.jsp">Citas</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Clientes/Clientes.jsp">Mis clientes</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Servicios/Servicios.jsp">Servicios </a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li>
        </ul>
    </nav>
</header>

<main class="main">
    <div class="container">
        <h1>Lista de citas</h1>
        <table align="center">
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Fecha</th>
                <th>Lugar</th>
                <th>Promoción</th>
                <th>Importe</th>
                <th>Nota</th>
                <th>Estado</th>
            </tr>
            </thead>
            <%
                LinkedList<JoinCitas> lista = (LinkedList)session.getAttribute("datos");
                if (lista != null){
                    for (JoinCitas cita : lista){
            %><tr>
                <td><%out.print(cita.getCliente().getNombre() + " " +  cita.getCliente().getApPaterno() + " " + cita.getCliente().getApMaterno());%></td>
                <td><%out.print(cita.getCita().getFecha() + " " + cita.getCita().getHora());%></td>
                <td><%if (cita.getCita().isTipoLugar() == false) out.print("Visita en casa"); else out.print(cita.getCita().getLugar());%></td>
                <td><%out.print(cita.getPromocion().getNombrePromocion());%></td>
                <td><%out.print(cita.getCita().getImporte());%></td>
                <td><%out.print(cita.getCita().getNota());%></td>
                <td><%if (cita.getCita().isBorrar()) out.print("Cancelada"); else out.print("Activa");%></td>
            </tr><%
                }
            }
            else {
                response.sendRedirect("/zulemakeup/ListaCitas");
            }
            session.removeAttribute("datos");
        %>
        </table>
    </div>
</main>

</body>
</html>
