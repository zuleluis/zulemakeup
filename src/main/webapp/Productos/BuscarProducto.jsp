<%@ page import="modelo.auxiliares.JoinProductos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Buscar producto</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/BuscarProducto">
            <p>Id <input type="number" name="idproducto"/></p>
            <p class="center-content">
                <input type="submit" value="Buscar"/>
            </p>
        </form>

        <%!
            %><%
            Boolean estado = (Boolean) session.getAttribute("encontrado");
            JoinProductos producto = (JoinProductos) session.getAttribute("datos");

            if (estado != null){
                if (estado){
                    session.setAttribute("idProducto", producto.getProducto().getIdProducto());
        %><tr>
            <tr>Producto: <%out.print(producto.getProducto().getNombreProducto());%></tr>
            <tr>Marca: <%out.print(producto.getMarca().getNombre());%></tr>
            <tr>Modelo: <%out.print(producto.getProducto().getModelo());%></tr>
            <tr>Tipo de producto: <%out.print(producto.getTipo().getNombre());%></tr>
            <tr>Aplicación: <%out.print(producto.getAplicacion().getNombre());%></tr>
            <tr>Cantidad: <%out.print(producto.getProducto().getCantidad());%></tr>
            <tr>Disponibilidad: <%if (producto.getProducto().isAgotado()) out.print("Disponible"); else out.print("Agotado");%></tr>
        </tr>
            <p/>
            <p/>
            <form action="../index.jsp">
                <p class="center-content"><input type="submit" value="Modificar"/></p>
            </form>
            <form method="post" action="/zulemakeup/EliminarProducto">
                <p class="center-content"><input type="submit" value="Eliminar"/></p>
            </form>
            <%
            }
            else {
            %><p>Producto no encontrado</p><%
                }
            }
            session.removeAttribute("datos");
            session.removeAttribute("encontrado");
        %>

    </div>
</main>

</body>
</html>
