<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sobre mi</title>
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilos.css" type="text/css">
    <link rel="stylesheet" href="/zulemakeup/Estilos/estilosZule.css" type="text/css">
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

<main>
    <div class="margenNav box">
        <div>
            <img src="/zulemakeup/Recursos/zule1.jpg">
            <img src="/zulemakeup/Recursos/zule2.jpg">
        </div>

        <div class="cajaTexto">
            <p class="titulo">
                Sobre mi: Zule Luis
            </p>
            <p class="texto">
                ??Hola! Soy Zulema Concepci??n Luis Cruz, mejor conocida
                como Zule Luis y trabajo como maquillista desde el a??o
                2018.
            </p>
            <p class="texto">
                Comenc?? maquillando a unas amigas para su graduaci??n y,
                a partir de ahi, mi trabajo comenzo a llegar a m??s y m??s personas :)
            </p>

            <p class="texto">
                Desde ese entonces, he maquillado en diferentes ciudades, fui invitada a un
                evento en la ciudad de Boca del R??o, Veracruz para hablar acerca de mi
                emprendimiento y he instruido a varias chicas con el prop??sito de que aprendan
                de este bello arte.
            </p>

            <p class="texto">
                A??n queda un gran camino por recorrer, mis metas consisten en asistir a cursos
                de maquillaje con reconocidos Makeup Artists y realizar tutorales de belleza
                a trav??s de mis redes sociales. Vamos lento, ??pero seguro!
            </p>

            <p class="textoCentrado">
                ??Visita mi perfil de Instagram para ver mi trabajo!
                <p class="titulo"> @zulemakp</p>
            </p>
        </div>
    </div>
    <div class="box">
        <div class="cajaTextoFull">
            <p class="textoCentrado">
                Tambi??n soy programadora y este sitio web lo he dise??ado para la materia
            </p>
            <p class="titulo">
                Dise??o de Aplicaciones Web
            </p>
            <p class="textoCentrado">
                impartida por la Mtra. Yuliana Berumen D??az.
            </p>

            <p class="textoCentrado">
                Universidad Veracruzana, junio de 2022
            </p>
        </div>
    </div>
</main>
</body>
</html>
