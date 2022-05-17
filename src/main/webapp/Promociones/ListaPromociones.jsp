<%@ page import="java.util.LinkedList" %>
<%@ page import="modelo.Promociones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de promociones</title>
</head>
<body>
<main class="main">
    <div class="container">
        <table align="center">
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Estado</th>
            </tr>
            </thead>
            <%
                LinkedList<Promociones> lista = (LinkedList)session.getAttribute("datos");
                //System.out.println(lista);
                if (lista != null){
                    for (Promociones promocion : lista){
            %><tr>
                <td><%out.print(promocion.getNombrePromocion());%></td>
                <td><%out.print("$" + promocion.getPrecio());%></td>
                <td><%if (promocion.isEstado()) out.print("Activo"); else out.print("Inactivo");%></td>
                </tr><%
                    }
                }
                else response.sendRedirect("/zulemakeup/ListaPromociones");
            session.removeAttribute("datos");
            %>
        </table>
    </div>
</main>
</body>
</html>
