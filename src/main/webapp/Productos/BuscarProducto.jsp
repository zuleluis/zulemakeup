<%@ page import="modelo.auxiliares.JoinProductos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Buscar producto</title>
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
            <tr>Disponibilidad: <%if (producto.getProducto().isAgotado()) out.print("Agotado"); else out.print("Disponible");%></tr>
        </tr>
            <p/>
            <p/>
            <form method="post" action="/zulemakeup/ModificarProducto">
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
