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

    <title>
        ${semana.titulo} — MOISÉS
    </title>
    <link
            rel="icon"
            type="image/png"
            href="${pageContext.request.contextPath}/img/favicon.png"
        >

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/style.css"
    >

</head>

<body>

    <!-- =========================================
         NAVEGACIÓN
    ========================================== -->

    <nav class="nav">

        <div class="container navin">

            <!-- LOGO -->

            <a
                class="logo"
                href="${pageContext.request.contextPath}/"
            >
                MOISÉS<span>.</span>
            </a>


            <!-- VOLVER A SEMANAS -->

            <a
                class="btn"
                href="${pageContext.request.contextPath}/#semanas"
            >
                ← VOLVER
            </a>

        </div>

    </nav>


    <!-- =========================================
         CONTENIDO DE LA SEMANA
    ========================================== -->

    <section class="section">

        <div class="container">

            <!-- NÚMERO DE SEMANA -->

            <div class="kicker">
                SEMANA ${semana.numero}
            </div>


            <!-- TÍTULO -->

            <h2>
                ${semana.titulo}
            </h2>


            <!-- DESCRIPCIÓN -->

            <p class="lead">
                ${semana.descripcion}
            </p>


            <!-- =================================
                 TRABAJOS PUBLICADOS
            ================================== -->

            <div class="work-grid">

                <c:forEach
                    items="${trabajos}"
                    var="x"
                >

                    <article class="work">


                        <!-- =================================
                             IMAGEN DEL TRABAJO
                        ================================== -->

                        <c:choose>

                            <c:when test="${not empty x.imagen}">

                                <img
                                    src="${x.imagen}"
                                    alt="${x.titulo}"
                                >

                            </c:when>

                            <c:otherwise>

                                <div
                                    style="
                                        height: 190px;
                                        display: grid;
                                        place-items: center;
                                        background: #0d152b;
                                        color: #64748b;
                                        font-weight: 900;
                                    "
                                >
                                    SEMANA ${semana.numero}
                                </div>

                            </c:otherwise>

                        </c:choose>


                        <!-- =================================
                             INFORMACIÓN DEL TRABAJO
                        ================================== -->

                        <div class="work-body">

                            <h3>
                                ${x.titulo}
                            </h3>


                            <p>
                                ${x.descripcion}
                            </p>


                            <!-- =================================
                                 ARCHIVO DEL TRABAJO
                            ================================== -->

                            <c:if test="${not empty x.archivo}">

                                <div class="buttons">


                                    <!-- =========================
                                         VER ARCHIVO
                                    ========================== -->

                                    <a
                                        class="btn primary"
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        href="${x.archivo}"
                                    >
                                        VER ↗
                                    </a>


                                    <!-- =========================
                                         DESCARGAR ARCHIVO
                                    ========================== -->

                                    <a
                                        class="btn"
                                        href="${pageContext.request.contextPath}/descargar/trabajo/${x.id}"
                                    >
                                        DESCARGAR ↓
                                    </a>


                                </div>

                            </c:if>

                        </div>

                    </article>

                </c:forEach>

            </div>


            <!-- =================================
                 MENSAJE CUANDO NO HAY TRABAJOS
            ================================== -->

            <c:if test="${empty trabajos}">

                <p class="lead">
                    Todavía no hay trabajos publicados en esta semana.
                </p>

            </c:if>

        </div>

    </section>

</body>

</html>