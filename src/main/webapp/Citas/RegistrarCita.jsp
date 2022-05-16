<%@ page import="modelo.Clientes" %>
<%@ page import="modelo.Citas" %>
<%@ page import="java.util.LinkedList" %>
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
                        LinkedList<Clientes> lista = (LinkedList)session.getAttribute("datos");
                        if (lista != null){
                            for (Clientes cliente : lista){
                                %>
                                <option value ="<%=cliente.getIdCliente()%>"><%=cliente.getNombre() + " " + cliente.getApPaterno() + " " + cliente.getApMaterno()%></option>
                                <%
                            }
                        }
                        else response.sendRedirect("/zulemakeup/MapaClientes");
                    %>
                </select>
            </p>


            private int fkCliente;
            private String fecha;
            private String hora;
            private boolean tipoLugar;
            private String lugar;
            private int fkPromocion;
            private float importe;
            private String nota;
        </form>
    </div>
</main>

</body>
</html>
