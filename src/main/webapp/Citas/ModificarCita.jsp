<%@ page import="modelo.auxiliares.JoinCitas" %>
<%@ page import="modelo.auxiliares.CitasServicios" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Promociones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar cita</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="icon" href="/zulemakeup/Recursos/favicon.ico">
</head>
<body>
<header>
    <nav>
        <ul class="menu">
            <li class="navBar"> <a class="menu" href="/zulemakeup">Inicio</a> </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Citas</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Citas/ListaCitas.jsp">Lista de citas</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Citas/RegistrarCita.jsp">Registrar cita</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Citas/BuscarCita.jsp">Buscar cita</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Mis clientes</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Clientes/ListaClientes.jsp">Lista de clientes</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Clientes/RegistrarCliente.jsp">Registrar cliente</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Clientes/BuscarCliente.jsp">Buscar cliente</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Servicios </a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Servicios/ListaServicios.jsp">Lista de servicios</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Servicios/RegistrarServicio.jsp">Registrar servicio</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Servicios/BuscarServicio.jsp">Buscar servicio</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Promociones</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Promociones/ListaPromociones.jsp">Lista de promociones</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Promociones/RegistrarPromocion.jsp">Registrar promocion</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Promociones/BuscarPromocion.jsp">Buscar promocion</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Promociones/AgregaServicios.jsp">Agregar servicio a promocion</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" aria-haspopup="true">Productos</a>
                <ul class="dropdown">
                    <li> <a class="menu" href="/zulemakeup/Productos/ListaProductos.jsp">Lista de productos</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Productos/RegistrarProducto.jsp">Registrar producto</a> </li>
                    <li> <a class="menu" href="/zulemakeup/Productos/BuscarProducto.jsp">Buscar producto</a> </li>
                </ul>
            </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup/SobreMi.jsp">Sobre mi</a> </li>
            <li class="navBar"> <a class="menu" href="/zulemakeup/Contacto.jsp">Contacto</a> </li>
        </ul>
    </nav>
</header>

<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/ModificarCita">
        <%
            JoinCitas cita = (JoinCitas) session.getAttribute("datos");
            LinkedList<CitasServicios> lista = (LinkedList)session.getAttribute("servicios");
            LinkedList<Promociones> listapromos = (LinkedList)session.getAttribute("promociones");
            if (cita != null){
        %>
        <tr>
            <p>Fecha <input type="date" name = "fecha" value="<%out.print(cita.getCita().getFecha());%>"> </p>
            <p>Hora <input type="time" name = "hora" value="<%out.print(cita.getCita().getHora());%>"> </p>
            <p>Servicio a domicilio <% if (cita.getCita().isTipoLugar()){%> <label><input type="checkbox" name = "tipoLugar" checked></label> <%} else %> <label><input type="checkbox" name = "tipoLugar"></label></p>
            <p>Lugar <input type="text" name = "lugar" value="<%out.print(cita.getCita().getLugar());%>"> </p>
            <p>Importe <input type="number" name = "importe" value="<%out.print(cita.getCita().getImporte());%>"> </p>
            <p>Nota <input type="text" name = "nota" value="<%out.print(cita.getCita().getNota());%>"> </p>

            <p/>
            <td>Servicios: </td>
            <table>
                <%
                    if(lista != null){
                        for (CitasServicios servicio : lista){%>
                <tr><td><%out.print(servicio.getServicio().getNombreServicio());%></td></tr>
                <%}
                }%>
            </table>
            <p/>
            <td>Promoción </td>
            <select name="fkPromocion" >
                <%if(listapromos != null){
                    for (Promociones promocion : listapromos){%>
                <option value ="<%=promocion.getIdPromocion()%>" <%if (cita.getCita().getFkPromocion() == promocion.getIdPromocion()){%>selected<%;}%>><%=promocion.getNombrePromocion()%></option>
                <%}
                }%>
            </select>
        </tr>
        <%
            }
            session.removeAttribute("datos");
            session.removeAttribute("servicios");
            session.removeAttribute("promociones");
        %>
        <p class="center-content">
            <input type="submit" value="Modificar"/>
        </p>
    </form>
    </div>
</main>

</body>
</html>