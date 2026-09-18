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

    <title>Editar semana</title>

       <link
            rel="icon"
            type="image/png"
            href="${pageContext.request.contextPath}/img/favicon.png"
        >

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/admin.css"
    >

</head>

<body>

    <!-- =========================================
         MENÚ LATERAL
    ========================================== -->

    <aside class="side">

        <div class="brand">

            MOISÉS<span>.</span>

            <small>
                Panel administrativo
            </small>

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


        <a
            class="logout"
            href="${pageContext.request.contextPath}/logout"
        >
            ↗ Cerrar sesión
        </a>

    </aside>


    <!-- =========================================
         CONTENIDO PRINCIPAL
    ========================================== -->

    <main class="main">

        <!-- ENCABEZADO -->

        <header class="top">

            <b>
                Editar semana
            </b>

            <span>
                MOISÉS · ADMIN
            </span>

        </header>


        <!-- =====================================
             CONTENIDO
        ====================================== -->

        <div class="content">

            <div class="eyebrow">
                CONFIGURACIÓN
            </div>


            <h1>
                Semana ${semana.numero}
            </h1>


            <!-- =================================
                 FORMULARIO
            ================================== -->

            <section class="panel">

                <form
                    class="form"
                    method="post"
                    action="${pageContext.request.contextPath}/admin/semanas/actualizar"
                >

                    <!-- ID DE LA SEMANA -->

                    <input
                        type="hidden"
                        name="id"
                        value="${semana.id}"
                    >


                    <!-- TÍTULO -->

                    <label>

                        TÍTULO

                        <input
                            type="text"
                            name="titulo"
                            value="${semana.titulo}"
                            required
                        >

                    </label>


                    <!-- DESCRIPCIÓN -->

                    <label>

                        DESCRIPCIÓN

                        <textarea
                            name="descripcion"
                            required
                        >${semana.descripcion}</textarea>

                    </label>


                    <!-- BOTONES -->

                    <div class="actions">

                        <button
                            type="submit"
                            class="primary"
                        >
                            Guardar cambios
                        </button>


                        <a
                            class="btn"
                            href="${pageContext.request.contextPath}/admin/semanas"
                        >
                            Cancelar
                        </a>

                    </div>

                </form>

            </section>

        </div>

    </main>

</body>

</html>