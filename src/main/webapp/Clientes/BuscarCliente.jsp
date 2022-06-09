<%@ page import="modelo.Clientes" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Citas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Búsqueda de cliente</title>
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
            LinkedList<Citas> citas = (LinkedList) session.getAttribute("datosCitas");

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
                    <td>Citas: </td>
                    <table>
                        <%if(citas != null){
                            for (Citas cita : citas){%>
                                <td><%out.print(cita.getFecha());%></td>
                                <td><%out.print(cita.getHora());%></td>
                                <td><%if (cita.isBorrar()) out.print("  - Cancelada");%></td>
                                <tr/>
                            <%}
                        }%>
                    </table>
                    <p/>
                    <p/>
                    <form method="post" action="/zulemakeup/ModificarCliente">
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
            session.removeAttribute("datosCitas");
        %>
    </div>
</main>

</body>
</html>
