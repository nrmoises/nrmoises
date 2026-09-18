<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>MOISÉS Portafolio</title>
     <link
            rel="icon"
            type="image/png"
            href="${pageContext.request.contextPath}/img/favicon.png"
        >

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/style.css"
    >


    <style>

        /* =====================================================
           PERFIL DE USUARIO EN EL MENÚ
        ===================================================== */

        .user-menu {
            position: relative;
        }


        .user-menu summary {
            list-style: none;

            display: flex;
            align-items: center;

            gap: 9px;

            padding:
                7px
                12px;

            border:
                1px solid rgba(255, 135, 54, .30);

            border-radius: 12px;

            background:
                rgba(255, 135, 54, .05);

            cursor: pointer;

            user-select: none;

            transition:
                background .25s ease,
                border-color .25s ease,
                transform .25s ease;
        }


        .user-menu summary::-webkit-details-marker {
            display: none;
        }


        .user-menu summary:hover {
            background:
                rgba(255, 135, 54, .10);

            border-color:
                rgba(255, 135, 54, .55);

            transform:
                translateY(-1px);
        }


        /* =========================================
           AVATAR
        ========================================== */

        .user-avatar {
            width: 31px;
            height: 31px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 50%;

            background:
                linear-gradient(
                    135deg,
                    #e86b20,
                    #ff8736,
                    #ffa45f
                );

            color: #ffffff;
        }


        .user-avatar svg {
            width: 16px;
            height: 16px;

            fill: none;
            stroke: currentColor;

            stroke-width: 1.8;

            stroke-linecap: round;
            stroke-linejoin: round;
        }


        /* =========================================
           NOMBRE
        ========================================== */

        .user-menu-name {
            max-width: 110px;

            overflow: hidden;

            color: #ffffff;

            font-size: 11px;
            font-weight: 800;

            white-space: nowrap;
            text-overflow: ellipsis;
        }


        .user-menu-arrow {
            color: #ff8736;

            font-size: 10px;

            transition:
                transform .25s ease;
        }


        .user-menu[open]
        .user-menu-arrow {
            transform:
                rotate(180deg);
        }


        /* =========================================
           MENÚ DESPLEGABLE
        ========================================== */

        .user-dropdown {
            position: absolute;

            top: calc(100% + 12px);
            right: 0;

            z-index: 999;

            width: 225px;

            overflow: hidden;

            background:
                linear-gradient(
                    145deg,
                    #242527,
                    #191a1c
                );

            border:
                1px solid rgba(255, 255, 255, .10);

            border-radius: 15px;

            box-shadow:
                0 20px 55px rgba(0, 0, 0, .42);

            animation:
                userDropdownEnter
                .22s ease;
        }


        @keyframes userDropdownEnter {

            from {
                opacity: 0;

                transform:
                    translateY(-8px)
                    scale(.97);
            }

            to {
                opacity: 1;

                transform:
                    translateY(0)
                    scale(1);
            }

        }


        /* =========================================
           INFORMACIÓN DEL USUARIO
        ========================================== */

        .user-dropdown-header {
            display: flex;
            align-items: center;

            gap: 11px;

            padding: 17px;

            border-bottom:
                1px solid rgba(255, 255, 255, .07);
        }


        .user-dropdown-avatar {
            width: 40px;
            height: 40px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 12px;

            background:
                rgba(255, 135, 54, .10);

            border:
                1px solid rgba(255, 135, 54, .30);

            color: #ff8736;
        }


        .user-dropdown-avatar svg {
            width: 20px;
            height: 20px;

            fill: none;
            stroke: currentColor;

            stroke-width: 1.8;

            stroke-linecap: round;
            stroke-linejoin: round;
        }


        .user-dropdown-info {
            min-width: 0;

            display: flex;
            flex-direction: column;

            gap: 4px;
        }


        .user-dropdown-info strong {
            overflow: hidden;

            color: #ffffff;

            font-size: 12px;
            font-weight: 850;

            white-space: nowrap;
            text-overflow: ellipsis;
        }


        .user-dropdown-info span {
            color: #ff8736;

            font-size: 8px;
            font-weight: 900;

            letter-spacing: 1.5px;
        }


        /* =========================================
           OPCIONES
        ========================================== */

        .user-dropdown-body {
            padding: 8px;
        }


        .user-dropdown-item {
            width: 100%;

            display: flex;
            align-items: center;

            gap: 10px;

            padding:
                11px
                12px;

            border-radius: 9px;

            color: #b6b6b6;

            font-size: 11px;
            font-weight: 700;

            text-decoration: none;

            transition:
                background .2s ease,
                color .2s ease;
        }


        .user-dropdown-item:hover {
            background:
                rgba(255, 135, 54, .08);

            color: #ffffff;
        }


        .user-dropdown-item svg {
            width: 16px;
            height: 16px;

            fill: none;
            stroke: currentColor;

            stroke-width: 1.8;

            stroke-linecap: round;
            stroke-linejoin: round;
        }


        .user-dropdown-item.logout-user {
            color: #ff9b59;
        }


        .user-dropdown-item.logout-user:hover {
            background:
                rgba(255, 135, 54, .10);

            color: #ff8736;
        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 760px) {

            .user-menu-name {
                display: none;
            }


            .user-menu summary {
                padding: 6px;
            }


            .user-menu-arrow {
                display: none;
            }


            .user-dropdown {
                right: 0;

                width: 210px;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVEGACIÓN
====================================================== -->

<nav class="nav">

    <div class="container navin">


        <!-- LOGO -->

        <a
            class="logo"
            href="${pageContext.request.contextPath}/"
        >
            MOISÉS<span>.</span>
        </a>


        <!-- MENÚ -->

        <div class="links">


            <a href="#sobre">
                Sobre mí
            </a>


            <a href="#semanas">
                Semanas
            </a>


            <a href="#proyectos">
                Proyectos
            </a>


            <a href="#contacto">
                Contacto
            </a>



            <!-- =================================================
                 SESIÓN
            ================================================== -->

            <c:choose>


                <%-- =============================================
                     ADMINISTRADOR
                ============================================== --%>

                <c:when test="${not empty sessionScope.usuario
                               and sessionScope.usuario.rol == 'ADMIN'}">

                    <a
                        class="adminlink"
                        href="${pageContext.request.contextPath}/admin"
                    >
                        PANEL ADMIN
                    </a>

                </c:when>



                <%-- =============================================
                     USUARIO NORMAL
                ============================================== --%>

                <c:when test="${not empty sessionScope.usuario}">


                    <details class="user-menu">


                        <!-- BOTÓN DEL PERFIL -->

                        <summary>


                            <span class="user-avatar">

                                <svg viewBox="0 0 24 24">

                                    <circle
                                        cx="12"
                                        cy="8"
                                        r="4">
                                    </circle>

                                    <path
                                        d="M4 21c0-4.2 3.6-7 8-7s8 2.8 8 7">
                                    </path>

                                </svg>

                            </span>


                            <span class="user-menu-name">
                                ${sessionScope.usuario.usuario}
                            </span>


                            <span class="user-menu-arrow">
                                ▼
                            </span>

                        </summary>



                        <!-- MENÚ DESPLEGABLE -->

                        <div class="user-dropdown">


                            <!-- INFORMACIÓN -->

                            <div class="user-dropdown-header">


                                <div class="user-dropdown-avatar">

                                    <svg viewBox="0 0 24 24">

                                        <circle
                                            cx="12"
                                            cy="8"
                                            r="4">
                                        </circle>

                                        <path
                                            d="M4 21c0-4.2 3.6-7 8-7s8 2.8 8 7">
                                        </path>

                                    </svg>

                                </div>


                                <div class="user-dropdown-info">

                                    <strong>
                                        ${sessionScope.usuario.usuario}
                                    </strong>

                                    <span>
                                        USUARIO
                                    </span>

                                </div>

                            </div>



                            <!-- OPCIONES -->

                            <div class="user-dropdown-body">


                                <a
                                    class="user-dropdown-item"
                                    href="${pageContext.request.contextPath}/"
                                >

                                    <svg viewBox="0 0 24 24">

                                        <path
                                            d="M3 11l9-8 9 8">
                                        </path>

                                        <path
                                            d="M5 10v10h14V10">
                                        </path>

                                    </svg>

                                    Inicio

                                </a>



                                <a
                                    class="user-dropdown-item logout-user"
                                    href="${pageContext.request.contextPath}/logout"
                                >

                                    <svg viewBox="0 0 24 24">

                                        <path
                                            d="M10 17l5-5-5-5">
                                        </path>

                                        <path
                                            d="M15 12H3">
                                        </path>

                                        <path
                                            d="M14 3h5a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-5">
                                        </path>

                                    </svg>

                                    Cerrar sesión

                                </a>

                            </div>

                        </div>

                    </details>

                </c:when>



                <%-- =============================================
                     SIN SESIÓN
                ============================================== --%>

                <c:otherwise>

                    <a
                        class="adminlink"
                        href="${pageContext.request.contextPath}/login"
                    >
                        ADMIN
                    </a>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</nav>



<!-- =====================================================
     PORTADA
====================================================== -->

<header class="hero">

    <div class="container hero-grid">


        <!-- INFORMACIÓN PRINCIPAL -->

        <div>

            <div class="eyebrow">
                DISEÑO · CÓDIGO · EXPERIENCIAS
            </div>


            <h1>

                Hola, soy

                <span class="accent">
                    Moisés Molina Crispín.
                </span>

            </h1>


            <p>

                Estudiante de

                <strong>
                    ${perfil.carrera}
                </strong>,

                apasionado por la tecnología, el diseño y el
                desarrollo de soluciones digitales modernas.

                Aquí encontrarás mis proyectos, trabajos y
                evolución profesional.

            </p>


            <div class="buttons">

                <a
                    class="btn primary"
                    href="#semanas"
                >
                    EXPLORAR TRABAJOS
                </a>


                <a
                    class="btn"
                    href="#sobre"
                >
                    SOBRE MÍ
                </a>

            </div>

        </div>



        <!-- =================================================
             FOTO DE PERFIL
        ================================================== -->

        <div class="profile-orb">

            <c:choose>

                <c:when test="${not empty perfil.foto}">

                    <img
                        src="${pageContext.request.contextPath}${perfil.foto}"
                        alt="Foto de Moisés"
                    >

                </c:when>


                <c:otherwise>

                    <strong>
                        M
                    </strong>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</header>



<!-- =====================================================
     SOBRE MÍ
====================================================== -->

<section
    id="sobre"
    class="section alt"
>

    <div class="container">

        <div class="kicker">
            01 · PERFIL
        </div>


        <h2>
            Sobre mí
        </h2>


        <p class="lead">
            ${perfil.descripcion}
        </p>



        <!-- =================================================
             TECNOLOGÍAS
        ================================================== -->

        <div class="tech-grid">


            <!-- HTML -->

            <article class="tech-card">

                <div class="tech-card-top">

                    <img
                        src="${pageContext.request.contextPath}/img/tecnologias/html.png"
                        alt="HTML"
                        class="tech-image"
                    >

                    <span class="tech-number">
                        01
                    </span>

                </div>

                <h3>
                    HTML
                </h3>

                <p>
                    Construcción de estructuras web
                    semánticas y organizadas.
                </p>

                <span class="tech-arrow">
                    →
                </span>

            </article>



            <!-- CSS -->

            <article class="tech-card">

                <div class="tech-card-top">

                    <img
                        src="${pageContext.request.contextPath}/img/tecnologias/css.png"
                        alt="CSS"
                        class="tech-image"
                    >

                    <span class="tech-number">
                        02
                    </span>

                </div>

                <h3>
                    CSS
                </h3>

                <p>
                    Creación de interfaces visuales,
                    diseños adaptables y efectos modernos.
                </p>

                <span class="tech-arrow">
                    →
                </span>

            </article>



            <!-- JAVASCRIPT -->

            <article class="tech-card">

                <div class="tech-card-top">

                    <img
                        src="${pageContext.request.contextPath}/img/tecnologias/javascript.png"
                        alt="JavaScript"
                        class="tech-image"
                    >

                    <span class="tech-number">
                        03
                    </span>

                </div>

                <h3>
                    JavaScript
                </h3>

                <p>
                    Interactividad y comportamiento dinámico
                    para las aplicaciones web.
                </p>

                <span class="tech-arrow">
                    →
                </span>

            </article>



            <!-- PHP -->

            <article class="tech-card">

                <div class="tech-card-top">

                    <img
                        src="${pageContext.request.contextPath}/img/tecnologias/php.png"
                        alt="PHP"
                        class="tech-image"
                    >

                    <span class="tech-number">
                        04
                    </span>

                </div>

                <h3>
                    PHP
                </h3>

                <p>
                    Desarrollo de aplicaciones web dinámicas
                    y procesamiento de datos del lado
                    del servidor.
                </p>

                <span class="tech-arrow">
                    →
                </span>

            </article>



            <!-- SPRING BOOT -->

            <article class="tech-card">

                <div class="tech-card-top">

                    <img
                        src="${pageContext.request.contextPath}/img/tecnologias/springboot.png"
                        alt="Spring Boot"
                        class="tech-image"
                    >

                    <span class="tech-number">
                        05
                    </span>

                </div>

                <h3>
                    Spring Boot
                </h3>

                <p>
                    Construcción de aplicaciones web
                    y servicios utilizando el
                    ecosistema Spring.
                </p>

                <span class="tech-arrow">
                    →
                </span>

            </article>



            <!-- MYSQL -->

            <article class="tech-card">

                <div class="tech-card-top">

                    <img
                        src="${pageContext.request.contextPath}/img/tecnologias/mysql.png"
                        alt="MySQL"
                        class="tech-image"
                    >

                    <span class="tech-number">
                        06
                    </span>

                </div>

                <h3>
                    MySQL
                </h3>

                <p>
                    Organización, almacenamiento y gestión
                    de información mediante bases de datos.
                </p>

                <span class="tech-arrow">
                    →
                </span>

            </article>

        </div>

    </div>

</section>



<!-- =====================================================
     SEMANAS
====================================================== -->

<section
    id="semanas"
    class="section"
>

    <div class="container">

        <div class="kicker">
            02 · PROGRESO ACADÉMICO
        </div>


        <h2>
            16 semanas. Una evolución.
        </h2>


        <p class="lead">
            Cada semana reúne actividades, prácticas,
            documentos y evidencias de aprendizaje.
        </p>



        <!-- LISTA DE SEMANAS -->

        <div class="week-grid">

            <c:forEach
                items="${semanas}"
                var="s"
            >

                <a
                    class="week"
                    href="${pageContext.request.contextPath}/semana/${s.id}"
                >

                    <div class="num">
                        ${s.numero}
                    </div>


                    <small>
                        SEMANA ${s.numero}
                    </small>


                    <h3>
                        ${s.titulo}
                    </h3>


                    <p>
                        ${s.descripcion}
                    </p>


                    <span class="go">
                        EXPLORAR →
                    </span>

                </a>

            </c:forEach>

        </div>

    </div>

</section>



<!-- =====================================================
     PROYECTOS
====================================================== -->

<section
    id="proyectos"
    class="section alt"
>

    <div class="container">

        <div class="kicker">
            03 · PROYECTOS
        </div>


        <h2>
            Lo que he construido.
        </h2>



        <!-- LISTA DE PROYECTOS -->

        <div class="project-grid">

            <c:forEach
                items="${proyectos}"
                var="p"
            >

                <article class="project">


                    <c:if test="${not empty p.imagen}">

                        <img
                            src="${pageContext.request.contextPath}${p.imagen}"
                            alt="${p.titulo}"
                        >

                    </c:if>



                    <div class="project-body">

                        <h3>
                            ${p.titulo}
                        </h3>


                        <p>
                            ${p.descripcion}
                        </p>



                        <c:if test="${not empty p.tecnologias}">

                            <div class="skills">

                                <span class="skill">
                                    ${p.tecnologias}
                                </span>

                            </div>

                        </c:if>



                        <c:if test="${not empty p.url}">

                            <a
                                class="btn"
                                target="_blank"
                                rel="noopener noreferrer"
                                href="${p.url}"
                            >
                                VER PROYECTO ↗
                            </a>

                        </c:if>

                    </div>

                </article>

            </c:forEach>

        </div>

    </div>

</section>



<!-- =====================================================
     CONTACTO
====================================================== -->

<section
    id="contacto"
    class="section"
>

    <div class="container contact-grid">


        <!-- INFORMACIÓN -->

        <div>

            <div class="kicker">
                04 · CONTACTO
            </div>


            <h2>
                Hablemos.
            </h2>


            <p class="lead">
                ¿Tienes una idea, proyecto o colaboración?
                Puedes enviarme un mensaje directamente
                desde aquí.
            </p>

        </div>



        <!-- FORMULARIO -->

        <form
            class="form"
            method="post"
            action="${pageContext.request.contextPath}/contacto/enviar"
        >


            <input
                type="text"
                name="nombre"
                placeholder="Tu nombre"
                autocomplete="name"
                required
            >


            <input
                type="email"
                name="correo"
                placeholder="Tu correo"
                autocomplete="email"
                required
            >


            <input
                type="text"
                name="asunto"
                placeholder="Asunto"
                required
            >


            <textarea
                name="mensaje"
                placeholder="Escribe tu mensaje..."
                required
            ></textarea>


            <button
                type="submit"
                class="btn primary"
            >
                ENVIAR MENSAJE →
            </button>

        </form>

    </div>

</section>



<!-- =====================================================
     FOOTER
====================================================== -->

<footer class="footer">

    <div class="container">

        © 2026 MOISÉS.
        · Portafolio académico
        · Diseño y Programación Web

    </div>

</footer>


</body>

</html>