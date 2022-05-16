<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.catalogos.Marcas" %>
<%@ page import="modelo.catalogos.Aplicacion" %>
<%@ page import="modelo.catalogos.Tipos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro de producto</title>
</head>
<body>
<main class="main">
    <div class="container">
        <form method="post" action="/zulemakeup/RegistrarProducto">
            <p>Marca <select name="fkMarca" >
                <%
                    LinkedList<Marcas> listamarcas = (LinkedList)session.getAttribute("marcas");
                    if (listamarcas != null){
                        for (Marcas marcas : listamarcas){
                %>
                <option value ="<%=marcas.getIdMarca()%>"><%=marcas.getNombre()%></option>
                <%
                        }
                    }
                    else response.sendRedirect("/zulemakeup/MapeoProductos");
                %>
            </select>
            </p>
            <p>Nombre <input type="text" name = "nombreProducto"> </p>
            <p>Aplicación <select name="fkAplicacion" >
                <%
                    LinkedList<Aplicacion> listaaplicacion = (LinkedList)session.getAttribute("aplicaciones");
                    if (listaaplicacion != null){
                        for (Aplicacion aplicacion : listaaplicacion){
                %>
                <option value ="<%=aplicacion.getIdAplicacion()%>"><%=aplicacion.getNombre()%></option>
                <%      }
                    }%>
            </select>
            </p>
            <p>Tipo <select name="fkTipo" >
                <%
                    LinkedList<Tipos> listatipo = (LinkedList)session.getAttribute("tipos");
                    if (listatipo != null){
                        for (Tipos tipo : listatipo){
                %>
                <option value ="<%=tipo.getIdTipo()%>"><%=tipo.getNombre()%></option>
                <%      }
                }
                    session.removeAttribute("marcas");
                    session.removeAttribute("tipos");
                    session.removeAttribute("aplicaciones");
                %>
            </select>
            </p>
            <p>Modelo <input type="text" name = "modelo"> </p>
            <p>Cantidad <input type="number" name = "cantidad"> </p>
            <p>Agotado <label><input type="checkbox" name = "agotado"></label> </p>

            <p class="center-content">
                <input type="submit" value="Registrar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>
