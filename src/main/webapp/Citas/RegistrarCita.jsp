<%@ page import="modelo.Clientes" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Promociones" %>
<%@ page import="modelo.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro de citas</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilosForm.css" type="text/css">
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

<main class="boxContainer">
    <div class="margenNav box">
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
            <p>Fecha <input required type="date" name = "fecha"> </p>
            <p>Hora <input required type="time" name = "hora"> </p>
            <p>A domicilio <label><input type="checkbox" name = "tipoLugar"></label> </p>
            <p>Lugar <input required type="text" name = "lugar"> </p>
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
                %>

            </select>
            </p>
            <p> Servicios
                <select name="fkServicio" multiple>
                    <%
                        LinkedList<Servicios> listaServicios = (LinkedList)session.getAttribute("servicios");
                        if (listaServicios != null){
                            for (Servicios servicio : listaServicios){
                    %>
                    <option value ="<%=servicio.getIdServicio()%>"><%=servicio.getNombreServicio()%></option>
                    <%
                            }
                        }
                        session.removeAttribute("clientes");
                        session.removeAttribute("promociones");
                        session.removeAttribute("servicios");
                    %>
                </select>
            </p>
            <p>Importe <input required type="number" name = "importe"> </p>
            <p>Nota <input required type="text" name = "nota"> </p>

            <p class="center-content">
                <input class="botonSubmit" type="submit" value="Registrar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>