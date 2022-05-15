<%@ page import="modelo.Clientes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Búsqueda de cliente</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/BuscarCliente">
            <p>Id <input type="number" name="idcliente"/></p>
            <p class="center-content">
                <input type="submit" value="Buscar"/>
            </p>
        </form>
        <%!
        %><%
            Boolean estado = (Boolean) session.getAttribute("encontrado");
            Clientes cliente = (Clientes) session.getAttribute("datos");

            if (estado != null){
                if (estado){
                    session.setAttribute("idCliente", cliente.getIdCliente());
                    %><tr>
                        <td>Nombre: <%out.print(cliente.getNombre() + " " +  cliente.getApPaterno() + " " + cliente.getApMaterno());%></td>
                        <td>Fecha de nacimiento: <%out.print(cliente.getFechaNac());%></td>
                        <td>Dirección: <%out.print(cliente.getCalle() + " " + cliente.getNumero() + " " + cliente.getColonia());%></td>
                        <td>Ciudad: <%out.print(cliente.getCiudad());%></td>
                        <td>Teléfono: <%out.print(cliente.getNumTel());%></td>
                    </tr>
                    <p/>
                    <p/>
                    <form action="../index.jsp">
                        <p class="center-content"><input type="submit" value="Modificar"/></p>
                    </form>
                    <form method="post" action="/zulemakeup/EliminarCliente">
                        <p class="center-content"><input type="submit" value="Eliminar"/></p>
                    </form>
                    <%
                }
                else {
                    %><p>Cliente no encontrado</p><%
                }
            }
            session.removeAttribute("datos");
            session.removeAttribute("encontrado");
        %>
    </div>
</main>

</body>
</html>