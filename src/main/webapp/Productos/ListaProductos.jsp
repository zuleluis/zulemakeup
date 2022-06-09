<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.auxiliares.JoinProductos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de productos</title>
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
            <li class="menu"> <a class="menu" href="/zulemakeup/Promociones/Promociones.jsp">Promociones</a> </li>
            <li class="menu"> <a class="menu active" href="/zulemakeup/Productos/Productos.jsp">Productos</a> </li>
        </ul>
    </nav>
</header>

<main class="main">
    <div class="container">
        <h1>Lista de productos</h1>
        <table align="center">
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Marca</th>
                <th>Lugar de aplicación</th>
                <th>Tipo de producto</th>
                <th>Cantidad</th>
                <th>Agotado</th>
            </tr>
            </thead>
            <%
                LinkedList<JoinProductos> lista = (LinkedList)session.getAttribute("datos");
                //System.out.println(lista);
                if (lista != null){
                    for (JoinProductos producto : lista){
            %><tr>
            <td><%out.print(producto.getProducto().getNombreProducto() + " - " + producto.getProducto().getModelo());%></td>
            <td><%out.print(producto.getMarca().getNombre());%></td>
            <td><%out.print(producto.getAplicacion().getNombre());%></td>
            <td><%out.print(producto.getTipo().getNombre());%></td>
            <td><%out.print(producto.getProducto().getCantidad());%></td>
            <td><%if (producto.getProducto().isAgotado()) out.print("Pocas existencias"); else out.print("--");%></td>
        </tr><%
                }
            }
            else {
                response.sendRedirect("/zulemakeup/ListaProductos");
            }
            session.removeAttribute("datos");
        %>
        </table>
    </div>
</main>

</body>
</html>
