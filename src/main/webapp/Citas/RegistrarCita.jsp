<%@ page import="modelo.Clientes" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Promociones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro de citas</title>
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
        <form method="post" action="/zulemakeup/RegistrarCita">
            <p>Cliente <select name="fkCliente" >
                    <%
                        LinkedList<Clientes> listaclientes = (LinkedList)session.getAttribute("clientes");
                        if (listaclientes != null){
                            for (Clientes cliente : listaclientes){
                                %>
                                <option value ="<%=cliente.getIdCliente()%>"><%=cliente.getNombre() + " " + cliente.getApPaterno() + " " + cliente.getApMaterno()%></option>
                                <%
                            }
                        }
                        else response.sendRedirect("/zulemakeup/MapeoListas");
                    %>
                </select>
            </p>
            <p>Fecha <input type="date" name = "fecha"> </p>
            <p>Hora <input type="time" name = "hora"> </p>
            <p>A domicilio <label><input type="checkbox" name = "tipoLugar"></label> </p>
            <p>Lugar <input type="text" name = "lugar"> </p>
            <p>Promoción <select name="fkPromocion" >
                <%
                    LinkedList<Promociones> lista = (LinkedList)session.getAttribute("promociones");
                    if (lista != null){
                        for (Promociones promocion : lista){
                %>
                <option value ="<%=promocion.getIdPromocion()%>"><%=promocion.getNombrePromocion()%></option>
                <%
                        }
                    }
                    session.removeAttribute("clientes");
                    session.removeAttribute("promociones");
                %>
            </select>
            </p>
            <p>Importe <input type="number" name = "importe"> </p>
            <p>Nota <input type="text" name = "nota"> </p>

            <%--Aqui en el submit, como action, puedo poner que se redirija a otro JSP que
            permita registrar los servicios que va a incluir la cita--%>
            <p class="center-content">
                <input type="submit" value="Registrar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>
