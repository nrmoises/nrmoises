<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Dashboard</title>

       <link
            rel="icon"
            type="image/png"
            href="${pageContext.request.contextPath}/img/favicon.png"
        >

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/admin.css">
</head>

<body>

<!-- =========================================
     MENÚ LATERAL
========================================= -->

<aside class="side">

    <div class="brand">
        MOISÉS<span>.</span>
        <small>Panel administrativo</small>
    </div>

    <div class="badge">
        ● Administrador
    </div>

    <nav>

        <a class="active"
           href="${pageContext.request.contextPath}/admin">
            ▦ Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/admin/perfil">
            ◉ Mi perfil
        </a>

        <a href="${pageContext.request.contextPath}/admin/semanas">
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


<!-- =========================================
     CONTENIDO PRINCIPAL
========================================= -->

<main class="main">

    <header class="top">

        <b>Dashboard</b>

        <span>
            MOISÉS · ADMIN
        </span>

    </header>


    <div class="content dashboard-pro">


        <!-- =================================
             PRESENTACIÓN
        ================================== -->

        <section class="dash-header">

            <div>

                <div class="eyebrow">
                    PANEL PRINCIPAL
                </div>

                <h1>
                    Hola, Moisés<span>.</span>
                </h1>

                <p class="muted">
                    Administra tu portafolio académico,
                    organiza tus semanas de aprendizaje,
                    publica tus trabajos y revisa tus mensajes.
                </p>

            </div>


            <div class="system-status">

                <span></span>

                SISTEMA ACTIVO

            </div>

        </section>


        <!-- =================================
             ESTADÍSTICAS
        ================================== -->

        <section class="dash-stats">


            <!-- SEMANAS -->

            <article class="dash-stat">

                <div class="dash-stat-top">

                    <div class="dash-stat-icon">
                        01
                    </div>

                    <span>
                        DATA_01
                    </span>

                </div>

                <small>
                    SEMANAS ACADÉMICAS
                </small>

                <strong>
                    ${totalSemanas}
                </strong>

            </article>


            <!-- TRABAJOS -->

            <article class="dash-stat">

                <div class="dash-stat-top">

                    <div class="dash-stat-icon">
                        02
                    </div>

                    <span>
                        DATA_02
                    </span>

                </div>

                <small>
                    TRABAJOS REGISTRADOS
                </small>

                <strong>
                    ${totalTrabajos}
                </strong>

            </article>


            <!-- PROYECTOS -->

            <article class="dash-stat">

                <div class="dash-stat-top">

                    <div class="dash-stat-icon">
                        03
                    </div>

                    <span>
                        DATA_03
                    </span>

                </div>

                <small>
                    PROYECTOS
                </small>

                <strong>
                    ${totalProyectos}
                </strong>

            </article>


            <!-- MENSAJES -->

            <article class="dash-stat">

                <div class="dash-stat-top">

                    <div class="dash-stat-icon">
                        04
                    </div>

                    <span>
                        DATA_04
                    </span>

                </div>

                <small>
                    MENSAJES NUEVOS
                </small>

                <strong>
                    ${mensajesNuevos}
                </strong>

            </article>

        </section>


        <!-- =================================
             PARTE INFERIOR
        ================================== -->

        <section class="dash-bottom">


            <!-- =============================
                 RESUMEN
            ============================== -->

            <article class="dash-box dash-resumen">

                <div class="dash-box-title">

                    <h2>
                        Resumen del portafolio
                    </h2>

                    <span>
                        /overview
                    </span>

                </div>


                <div class="dash-resumen-content">

                    <div class="dash-resumen-text">

                        <p>
                            Este es el centro de control de tu
                            portafolio académico.
                        </p>

                        <p>
                            Desde aquí puedes administrar las
                            ${totalSemanas} semanas de formación,
                            registrar tus trabajos, gestionar tus
                            proyectos y revisar los mensajes recibidos.
                        </p>

                    </div>


                    <div class="dash-week-counter">

                        <strong>
                            ${totalSemanas}
                        </strong>

                        <span>
                            SEMANAS
                        </span>

                        <small>
                            PLANIFICADAS
                        </small>

                    </div>

                </div>


                <!-- ESTADO DE MENSAJES -->

                <div class="dash-message-status">

                    <div class="dash-message-symbol">
                        ◇
                    </div>

                    <div>

                        <strong>
                            Estado de mensajes
                        </strong>

                        <span>
                            Tienes ${mensajesNuevos}
                            mensajes nuevos por revisar.
                        </span>

                    </div>

                </div>

            </article>


            <!-- =============================
                 ACCIONES RÁPIDAS
            ============================== -->

            <article class="dash-box dash-tools">

                <div class="dash-box-title">

                    <h2>
                        Acciones rápidas
                    </h2>

                    <span>
                        /tools
                    </span>

                </div>


                <div class="dash-tools-grid">


                    <!-- PERFIL -->

                    <a href="${pageContext.request.contextPath}/admin/perfil"
                       class="dash-tool">

                        <div class="dash-tool-icon">
                            01
                        </div>

                        <strong>
                            Mi perfil
                        </strong>

                        <span>
                            Editar información personal
                        </span>

                    </a>


                    <!-- SEMANAS -->

                    <a href="${pageContext.request.contextPath}/admin/semanas"
                       class="dash-tool">

                        <div class="dash-tool-icon">
                            02
                        </div>

                        <strong>
                            Semanas
                        </strong>

                        <span>
                            Gestionar aprendizaje
                        </span>

                    </a>


                    <!-- TRABAJOS -->

                    <a href="${pageContext.request.contextPath}/admin/trabajos"
                       class="dash-tool">

                        <div class="dash-tool-icon">
                            03
                        </div>

                        <strong>
                            Trabajos
                        </strong>

                        <span>
                            Administrar evidencias
                        </span>

                    </a>


                    <!-- PROYECTOS -->

                    <a href="${pageContext.request.contextPath}/admin/proyectos"
                       class="dash-tool">

                        <div class="dash-tool-icon">
                            04
                        </div>

                        <strong>
                            Proyectos
                        </strong>

                        <span>
                            Gestionar proyectos
                        </span>

                    </a>


                    <!-- MENSAJES -->

                    <a href="${pageContext.request.contextPath}/admin/mensajes"
                       class="dash-tool">

                        <div class="dash-tool-icon">
                            05
                        </div>

                        <strong>
                            Mensajes
                        </strong>

                        <span>
                            Revisar mensajes recibidos
                        </span>

                    </a>


                    <!-- PORTAFOLIO -->

                    <a href="${pageContext.request.contextPath}/"
                       target="_blank"
                       class="dash-tool">

                        <div class="dash-tool-icon">
                            06
                        </div>

                        <strong>
                            Portafolio ↗
                        </strong>

                        <span>
                            Abrir página pública
                        </span>

                    </a>

                </div>

            </article>

        </section>

    </div>

</main>

</body>
</html>