<%@ page import="modelo.Clientes" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Promociones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Registro de citas</title>
</head>
<body>
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

            <p class="center-content">
                <input type="submit" value="Registrar"/>
            </p>
        </form>
    </div>
</main>

</body>
</html>
