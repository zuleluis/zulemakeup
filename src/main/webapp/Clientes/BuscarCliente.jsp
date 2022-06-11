<%@ page import="modelo.Clientes" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Citas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Búsqueda de cliente</title>
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
        <form method="post" action="/zulemakeup/BuscarCliente">
            <p>Id <input type="number" name="idcliente"/></p>
            <p class="center-content">
                <input class="botonSubmit" type="submit" value="Buscar"/>
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
                        <p>Nombre: <%out.print(cliente.getNombre() + " " +  cliente.getApPaterno() + " " + cliente.getApMaterno());%></p>
                        <p>Fecha de nacimiento: <%out.print(cliente.getFechaNac());%></p>
                        <p>Dirección: <%out.print(cliente.getCalle() + " " + cliente.getNumero() + " " + cliente.getColonia());%></p>
                        <p>Ciudad: <%out.print(cliente.getCiudad());%></p>
                        <p>Teléfono: <%out.print(cliente.getNumTel());%></p>
                    </tr>
                    <p/>
                    <p/>
                    <td>Citas: </td>
                    <table>
                        <%if(citas != null){
                            for (Citas cita : citas){%>
                            <tr>
                                <p><%out.print(cita.getFecha() + " - " + cita.getHora());if (cita.isBorrar()) out.print("  - Cancelada");%></p>
                            </tr>
                            <%}
                        }%>
                    </table>
                    <p/>
                    <p/>
                    <form method="post" action="/zulemakeup/ModificarCliente">
                        <p class="center-content"><input class="botonSubmit" type="submit" value="Modificar"/></p>
                    </form>
                    <form method="post" action="/zulemakeup/EliminarCliente">
                        <p class="center-content"><input class="botonSubmit" type="submit" value="Eliminar"/></p>
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
