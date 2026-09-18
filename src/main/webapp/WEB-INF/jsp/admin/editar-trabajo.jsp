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

    <title>Editar trabajo</title>

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

            <a
                class="active"
                href="${pageContext.request.contextPath}/admin/trabajos"
            >
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
                Editar trabajo
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
                EDICIÓN
            </div>


            <h1>
                ${trabajo.titulo}
            </h1>


            <!-- =================================
                 FORMULARIO
            ================================== -->

            <section class="panel">

                <form
                    class="form"
                    method="post"
                    enctype="multipart/form-data"
                    action="${pageContext.request.contextPath}/admin/trabajos/actualizar"
                >

                    <!-- ID DEL TRABAJO -->

                    <input
                        type="hidden"
                        name="id"
                        value="${trabajo.id}"
                    >


                    <!-- TÍTULO -->

                    <label>

                        TÍTULO

                        <input
                            type="text"
                            name="titulo"
                            value="${trabajo.titulo}"
                            required
                        >

                    </label>


                    <!-- DESCRIPCIÓN -->

                    <label>

                        DESCRIPCIÓN

                        <textarea
                            name="descripcion"
                            required
                        >${trabajo.descripcion}</textarea>

                    </label>


                    <!-- SEMANA -->

                    <label>

                        SEMANA

                        <select
                            name="semanaId"
                            required
                        >

                            <c:forEach
                                items="${semanas}"
                                var="s"
                            >

                                <option
                                    value="${s.id}"
                                    ${s.id == trabajo.semana.id ? 'selected' : ''}
                                >
                                    Semana ${s.numero}
                                </option>

                            </c:forEach>

                        </select>

                    </label>


                    <!-- =================================
                         ARCHIVOS
                    ================================== -->

                    <div class="grid2">

                        <!-- NUEVO ARCHIVO -->

                        <label>

                            NUEVO ARCHIVO

                            <input
                                type="file"
                                name="archivo"
                            >

                        </label>


                        <!-- NUEVA IMAGEN -->

                        <label>

                            NUEVA IMAGEN

                            <input
                                type="file"
                                name="imagen"
                                accept="image/*"
                            >

                        </label>

                    </div>


                    <!-- =================================
                         BOTONES
                    ================================== -->

                    <div class="actions">

                        <button
                            type="submit"
                            class="primary"
                        >
                            Guardar cambios
                        </button>


                        <a
                            class="btn"
                            href="${pageContext.request.contextPath}/admin/trabajos/semana/${trabajo.semana.id}"
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