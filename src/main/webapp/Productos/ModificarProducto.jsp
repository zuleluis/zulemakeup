<%@ page import="modelo.Productos" %>
<%@ page import="modelo.catalogos.Marcas" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.catalogos.Aplicacion" %>
<%@ page import="modelo.catalogos.Tipos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Producto</title>
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
        <form method="post" action="/zulemakeup/ModificarProducto">
            <%
                Productos producto = (Productos) session.getAttribute("datos");
                LinkedList<Marcas> listaMarcas = (LinkedList)session.getAttribute("marcas");
                LinkedList<Aplicacion> listaAplicacion = (LinkedList)session.getAttribute("aplicacion");
                LinkedList<Tipos> listaTipos = (LinkedList)session.getAttribute("tipos");
                if (producto != null){
            %>
            <tr>
                <p>Marca
                    <select name="fkMarca" >
                        <%if(listaMarcas != null){
                            for (Marcas marca : listaMarcas){%>
                        <option value ="<%=marca.getIdMarca()%>" <%if (producto.getFkMarca() == marca.getIdMarca()){%>selected<%;}%>><%=marca.getNombre()%></option>
                        <%  }
                        }%>
                    </select>
                </p>
                <p>Nombre <input type="text" name = "nombreProducto" value="<%out.print(producto.getNombreProducto());%>"> </p>
                <p>Aplicación
                    <select name="fkAplicacion" >
                        <%if(listaAplicacion != null){
                            for (Aplicacion aplicacion: listaAplicacion){%>
                        <option value ="<%=aplicacion.getIdAplicacion()%>" <%if (producto.getFkAplicacion() == aplicacion.getIdAplicacion()){%>selected<%;}%>><%=aplicacion.getNombre()%></option>
                        <%  }
                        }%>
                    </select>
                </p>
                <p>Tipo
                    <select name="fkTipo" >
                        <%if(listaTipos != null){
                            for (Tipos tipo : listaTipos){%>
                        <option value ="<%=tipo.getIdTipo()%>" <%if (producto.getFkTipo() == tipo.getIdTipo()){%>selected<%;}%>><%=tipo.getNombre()%></option>
                        <%  }
                        }%>
                    </select>
                </p>
                <p>Modelo <input type="text" name = "modelo" value="<%out.print(producto.getModelo());%>"> </p>
                <p>Cantidad <input type="number" name = "cantidad" value="<%out.print(producto.getCantidad());%>"> </p>
                <p>Agotado <% if (producto.isAgotado()){%> <label><input type="checkbox" name = "agotado" checked></label> <%} else %> <label><input type="checkbox" name = "agotado"></label></p>
            </tr>

            <%
                }
                session.removeAttribute("datos");
                session.removeAttribute("marcas");
                session.removeAttribute("aplicacion");
                session.removeAttribute("tipos");
            %>
            <p class="center-content">
                <input type="submit" value="Modificar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>
