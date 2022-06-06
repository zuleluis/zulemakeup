<%@ page import="modelo.Productos" %>
<%@ page import="modelo.catalogos.Marcas" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.catalogos.Aplicacion" %>
<%@ page import="modelo.catalogos.Tipos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Producto</title>
</head>
<body>
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
