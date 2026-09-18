<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="es">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Semanas</title>

       <link
            rel="icon"
            type="image/png"
            href="${pageContext.request.contextPath}/img/favicon.png"
        >

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/admin.css">
</head>

<body>

<aside class="side">

    <div class="brand">
        MOISÉS<span>.</span>
        <small>Panel administrativo</small>
    </div>

    <div class="badge">
        ● Administrador
    </div>

    <nav>

        <a href="${pageContext.request.contextPath}/admin">
            ▦ Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/admin/perfil">
            ◉ Mi perfil
        </a>

        <a class="active"
           href="${pageContext.request.contextPath}/admin/semanas">
            ▤ Semanas
        </a>

        <a href="${pageContext.request.contextPath}/admin/trabajos">
            ▣ Trabajos
        </a>

        <a href="${pageContext.request.contextPath}/admin/proyectos">
            ◇ Proyectos
        </a>

        <a href="${pageContext.request.contextPath}/admin/mensajes">
            ✉ Mensajes
        </a>

    </nav>

    <a class="logout"
       href="${pageContext.request.contextPath}/logout">
        ↗ Cerrar sesión
    </a>

</aside>


<main class="main">

    <header class="top">

        <b>Semanas</b>

        <span>
            MOISÉS · ADMIN
        </span>

    </header>


    <div class="content">

        <div class="eyebrow">
            PROGRESO ACADÉMICO
        </div>

        <h1>
            Las 16 semanas
        </h1>

        <p class="muted">
            Administra el título, descripción y trabajos de cada semana.
        </p>


        <div class="cards">

            <c:forEach items="${semanas}" var="s">

                <article class="card semana-card">

                    <!-- ESTAMPITA -->

                    <img
                        src="${pageContext.request.contextPath}/img/doraemon.png"
                        class="semana-sticker"
                        alt="Estampita">


                    <!-- NÚMERO DE SEMANA -->

                    <div class="number">
                        SEMANA ${s.numero}
                    </div>


                    <!-- TÍTULO -->

                    <h2>
                        ${s.titulo}
                    </h2>


                    <!-- DESCRIPCIÓN -->

                    <p class="muted">
                        ${s.descripcion}
                    </p>


                    <!-- BOTONES -->

                    <div class="actions">

                        <a
                            class="btn primary"
                            href="${pageContext.request.contextPath}/admin/trabajos/semana/${s.id}">

                            Ver trabajos

                        </a>


                        <a
                            class="btn"
                            href="${pageContext.request.contextPath}/admin/semanas/editar/${s.id}">

                            Editar

                        </a>

                    </div>

                </article>

            </c:forEach>

        </div>

    </div>

</main>

</body>

</html>