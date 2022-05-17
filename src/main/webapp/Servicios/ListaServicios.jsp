<%@ page import="modelo.Servicios" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de servicios</title>
</head>
<body>
<main class="main">
    <div class="container">
        <table>
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Descripción</th>
            </tr>
            </thead>
            <%
                LinkedList<Servicios> lista = (LinkedList)session.getAttribute("datos");
                //System.out.println(lista);
                if (lista != null){
                    for (Servicios servicio : lista){
                    %><tr>
                        <td><%out.print(servicio.getNombreServicio());%></td>
                        <td><%out.print("$" + servicio.getPrecio());%></td>
                        <td><%out.print(servicio.getDescripcion());%></td>
                    </tr><%
                    }
                }
                else response.sendRedirect("/zulemakeup/ListaServicios");
                session.removeAttribute("datos");
            %>
        </table>
    </div>
</main>

</body>
</html>
