<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.auxiliares.JoinProductos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Lista de productos</title>
</head>
<body>
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
