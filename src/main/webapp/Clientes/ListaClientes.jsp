<%@ page import="modelo.Clientes" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Lista de clientes</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="icon" href="/zulemakeup/Recursos/favicon.ico">
</head>
<body>
<header>
    <nav class="navigation">
        <ul class="menu">
            <li class="menu"> <a class="menu" href="/zulemakeup">Inicio</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Citas/Citas.jsp">Citas</a> </li>
            <li class="menu"> <a class="menu active" href="/zulemakeup/Clientes/Clientes.jsp">Mis clientes</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Servicios/Servicios.jsp">Servicios </a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="menu"> <a class="menu" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li>
        </ul>
    </nav>
</header>

<main class="main">
    <div class="container">
        <h1>Lista de clientes</h1>
        <table align="center">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Fecha de nacimiento</th>
                    <th>Dirección</th>
                    <th>Ciudad</th>
                    <th>Teléfono</th>
                </tr>
            </thead>
            <%
                LinkedList<Clientes> lista = (LinkedList)session.getAttribute("datos");
                //System.out.println(lista);
                if (lista != null){
                    for (Clientes cliente : lista){
                        %><tr>
                            <td><%out.print(cliente.getNombre() + " " +  cliente.getApPaterno() + " " + cliente.getApMaterno());%></td>
                            <td><%out.print(cliente.getFechaNac());%></td>
                            <td><%out.print(cliente.getCalle() + " " + cliente.getNumero() + " " + cliente.getColonia());%></td>
                            <td><%out.print(cliente.getCiudad());%></td>
                            <td><%out.print(cliente.getNumTel());%></td>
                        </tr><%
                    }
                }
                else {
                    response.sendRedirect("/zulemakeup/ListaClientes");
                }
                session.removeAttribute("datos");
            %>
        </table>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>
