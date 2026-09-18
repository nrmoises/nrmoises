<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="es">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Mi perfil</title>

       <link
            rel="icon"
            type="image/png"
            href="${pageContext.request.contextPath}/img/favicon.png"
        >

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/admin.css">
</head>

<body>

<!-- =========================
     MENÚ LATERAL
========================= -->

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

        <a class="active"
           href="${pageContext.request.contextPath}/admin/perfil">
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


<!-- =========================
     CONTENIDO PRINCIPAL
========================= -->

<main class="main">

    <header class="top">

        <b>Mi perfil</b>

        <span>
            MOISÉS · ADMIN
        </span>

    </header>


    <div class="content perfil-page">

        <!-- ENCABEZADO -->

        <div class="perfil-page-header">

            <div class="eyebrow">
                IDENTIDAD PROFESIONAL
            </div>

            <h1>
                Tu información
            </h1>

            <p class="muted">
                Administra los datos que forman parte de tu
                perfil profesional.
            </p>

        </div>


        <!-- MENSAJE -->

        <c:if test="${param.ok != null}">

            <div class="alert">
                Perfil actualizado correctamente.
            </div>

        </c:if>


        <!-- =========================
             FORMULARIO
        ========================= -->

        <form
            class="form perfil-form"
            method="post"
            enctype="multipart/form-data"
            action="${pageContext.request.contextPath}/admin/perfil/guardar">


            <!-- ==========================================
                 INFORMACIÓN PERSONAL
            =========================================== -->

            <section class="perfil-bloque">

                <div class="perfil-titulo">

                    <span class="perfil-acento"></span>

                    <div>

                        <small>
                            DATOS PRINCIPALES
                        </small>

                        <h2>
                            Información personal
                        </h2>

                    </div>

                </div>


                <div class="grid2 perfil-grid">

                    <label>

                        NOMBRE

                        <input
                            type="text"
                            name="nombre"
                            value="${perfil.nombre}"
                            required>

                    </label>


                    <label>

                        CARRERA

                        <input
                            type="text"
                            name="carrera"
                            value="${perfil.carrera}">

                    </label>


                    <label>

                        INSTITUCIÓN

                        <input
                            type="text"
                            name="institucion"
                            value="${perfil.institucion}">

                    </label>


                    <label>

                        CIUDAD

                        <input
                            type="text"
                            name="ciudad"
                            value="${perfil.ciudad}">

                    </label>

                </div>

            </section>


            <!-- ==========================================
                 PRESENTACIÓN
            =========================================== -->

            <section class="perfil-bloque">

                <div class="perfil-titulo">

                    <span class="perfil-acento"></span>

                    <div>

                        <small>
                            PRESENTACIÓN
                        </small>

                        <h2>
                            Acerca de mí
                        </h2>

                    </div>

                </div>


                <div class="perfil-campos">

                    <label>

                        DESCRIPCIÓN

                        <textarea
                            name="descripcion"
                            rows="6">${perfil.descripcion}</textarea>

                    </label>


                    <label>

                        HABILIDADES

                        <input
                            type="text"
                            name="habilidades"
                            value="${perfil.habilidades}">

                    </label>

                </div>

            </section>


            <!-- ==========================================
                 CONTACTO
            =========================================== -->

            <section class="perfil-bloque">

                <div class="perfil-titulo">

                    <span class="perfil-acento"></span>

                    <div>

                        <small>
                            CONTACTO
                        </small>

                        <h2>
                            Información de contacto
                        </h2>

                    </div>

                </div>


                <div class="perfil-grid-contacto">

                    <label>

                        CORREO ELECTRÓNICO

                        <input
                            type="email"
                            name="correo"
                            value="${perfil.correo}"
                            placeholder="correo@ejemplo.com">

                    </label>

                </div>

            </section>


            <!-- ==========================================
                 REDES
            =========================================== -->

            <section class="perfil-bloque">

                <div class="perfil-titulo">

                    <span class="perfil-acento"></span>

                    <div>

                        <small>
                            ENLACES
                        </small>

                        <h2>
                            Redes profesionales
                        </h2>

                    </div>

                </div>


                <div class="grid2 perfil-grid">

                    <label>

                        GITHUB

                        <input
                            type="text"
                            name="github"
                            value="${perfil.github}"
                            placeholder="https://github.com/usuario">

                    </label>


                    <label>

                        LINKEDIN

                        <input
                            type="text"
                            name="linkedin"
                            value="${perfil.linkedin}"
                            placeholder="https://linkedin.com/in/usuario">

                    </label>

                </div>

            </section>


            <!-- ==========================================
                 FOTO
            =========================================== -->

            <section class="perfil-bloque">

                <div class="perfil-titulo">

                    <span class="perfil-acento"></span>

                    <div>

                        <small>
                            IMAGEN
                        </small>

                        <h2>
                            Foto de perfil
                        </h2>

                    </div>

                </div>


                <div class="perfil-foto-area">


                    <!-- FOTO ACTUAL -->

                    <div class="perfil-preview">

                        <div class="perfil-preview-foto">

                            <c:choose>

                                <c:when test="${not empty perfil.foto}">

                                    <img
                                        src="${pageContext.request.contextPath}${perfil.foto}"
                                        alt="Foto de perfil">

                                </c:when>

                                <c:otherwise>

                                    <div class="perfil-preview-letra">
                                        M
                                    </div>

                                </c:otherwise>

                            </c:choose>

                        </div>


                        <div class="perfil-preview-info">

                            <strong>
                                ${perfil.nombre}
                            </strong>

                            <span>
                                Foto actual
                            </span>

                        </div>

                    </div>


                    <!-- CAMBIAR FOTO -->

                    <div class="perfil-upload">

                        <label class="perfil-upload-label">

                            CAMBIAR FOTO

                            <input
                                id="fotoArchivo"
                                type="file"
                                name="fotoArchivo"
                                accept="image/png,image/jpeg,image/jpg,image/webp">

                        </label>


                        <p>
                            Puedes seleccionar una imagen JPG, PNG o WEBP.
                        </p>

                    </div>

                </div>

            </section>


            <!-- ==========================================
                 GUARDAR
            =========================================== -->

            <div class="perfil-footer">

                <div>

                    <strong>
                        ¿Todo listo?
                    </strong>

                    <span>
                        Guarda los cambios para actualizar tu perfil.
                    </span>

                </div>


                <button
                    type="submit"
                    class="primary">

                    Guardar cambios

                </button>

            </div>

        </form>

    </div>

</main>

</body>
</html>