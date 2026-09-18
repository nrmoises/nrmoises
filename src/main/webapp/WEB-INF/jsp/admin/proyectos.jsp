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

    <title>Proyectos</title>

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

        <a
            class="active"
            href="${pageContext.request.contextPath}/admin/proyectos"
        >
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

    <header class="top">

        <b>
            Proyectos
        </b>

        <span>
            MOISÉS · ADMIN
        </span>

    </header>


    <div class="content">

        <div class="eyebrow">
            PROYECTOS DESTACADOS
        </div>


        <h1>
            Construye tu vitrina.
        </h1>


        <!-- =================================
             NUEVO PROYECTO
        ================================== -->

        <section class="panel">

            <h2>
                Nuevo proyecto
            </h2>


            <form
                class="form"
                method="post"
                enctype="multipart/form-data"
                action="${pageContext.request.contextPath}/admin/proyectos/guardar"
            >

                <label>

                    TÍTULO

                    <input
                        type="text"
                        name="titulo"
                        required
                    >

                </label>


                <label>

                    DESCRIPCIÓN

                    <textarea
                        name="descripcion"
                        required
                    ></textarea>

                </label>


                <div class="grid2">

                    <label>

                        TECNOLOGÍAS

                        <input
                            type="text"
                            name="tecnologias"
                            placeholder="Java · Spring Boot · MySQL"
                        >

                    </label>


                    <label>

                        URL

                        <input
                            type="url"
                            name="url"
                            placeholder="https://..."
                        >

                    </label>

                </div>


                <label>

                    IMAGEN

                    <input
                        type="file"
                        name="imagen"
                        accept="image/*"
                    >

                </label>


                <button
                    type="submit"
                    class="primary"
                >
                    Agregar proyecto
                </button>

            </form>

        </section>


        <!-- =================================
             LISTA DE PROYECTOS
        ================================== -->

        <div class="cards">

            <c:forEach
                items="${proyectos}"
                var="p"
            >

                <article class="card">

                    <c:if test="${not empty p.imagen}">

                        <img
                            class="projectimg"
                            src="${pageContext.request.contextPath}${p.imagen}"
                            alt="${p.titulo}"
                        >

                    </c:if>


                    <div class="number">
                        ${p.tecnologias}
                    </div>


                    <h2>
                        ${p.titulo}
                    </h2>


                    <p class="muted">
                        ${p.descripcion}
                    </p>


                    <div class="actions">

                        <c:if test="${not empty p.url}">

                            <a
                                class="btn"
                                target="_blank"
                                rel="noopener noreferrer"
                                href="${p.url}"
                            >
                                Abrir ↗
                            </a>

                        </c:if>


                        <!-- BOTÓN ELIMINAR -->

                        <button
                            type="button"
                            class="btn danger delete-project-button"
                            data-url="${pageContext.request.contextPath}/admin/proyectos/eliminar/${p.id}"
                            data-title="${p.titulo}"
                        >
                            Eliminar
                        </button>

                    </div>

                </article>

            </c:forEach>

        </div>

    </div>

</main>


<!-- =========================================
     MODAL ELIMINAR PROYECTO
========================================== -->

<div
    class="delete-modal-overlay"
    id="deleteProjectModal"
>

    <div
        class="delete-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby="deleteProjectTitle"
    >

        <!-- CARITA -->

        <div
            class="face-box"
            id="projectFaceBox"
        >

            <div
                class="modal-face"
                id="projectFace"
            >

                <div class="face-eyes">

                    <span class="face-eye">
                        <span class="pupil"></span>
                    </span>

                    <span class="face-eye">
                        <span class="pupil"></span>
                    </span>

                </div>


                <div class="face-mouth"></div>

                <span class="face-tear"></span>

            </div>

        </div>


        <!-- TEXTO -->

        <div class="delete-modal-label">
            CONFIRMAR ACCIÓN
        </div>


        <h3 id="deleteProjectTitle">
            ¿Eliminar proyecto?
        </h3>


        <p class="delete-modal-text">

            Estás a punto de eliminar

            <strong
                class="delete-project-name"
                id="deleteProjectName"
            >
                este proyecto
            </strong>.

        </p>


        <!-- ADVERTENCIA -->

        <div class="delete-warning">

            <div class="delete-warning-symbol">
                !
            </div>

            <span>
                Esta acción no se puede deshacer.
            </span>

        </div>


        <!-- BOTONES -->

        <div class="delete-modal-actions">

            <button
                type="button"
                class="delete-cancel"
                id="cancelProjectDelete"
            >
                CANCELAR
            </button>


            <a
                class="delete-confirm"
                id="confirmProjectDelete"
                href="#"
            >
                ELIMINAR →
            </a>

        </div>

    </div>

</div>


<!-- =========================================
     ESTILOS DEL MODAL
========================================== -->

<style>

    /* FONDO */

    .delete-modal-overlay {
        position: fixed;
        inset: 0;

        z-index: 9999;

        display: flex;
        align-items: center;
        justify-content: center;

        padding: 20px;

        background: rgba(5, 6, 7, .78);

        backdrop-filter: blur(7px);
        -webkit-backdrop-filter: blur(7px);

        opacity: 0;
        visibility: hidden;

        transition:
            opacity .25s ease,
            visibility .25s ease;
    }


    .delete-modal-overlay.active {
        opacity: 1;
        visibility: visible;
    }


    /* TARJETA */

    .delete-modal {
        position: relative;

        width: 100%;
        max-width: 430px;

        padding: 34px;

        overflow: hidden;

        text-align: center;

        background:
            linear-gradient(
                145deg,
                #242527,
                #191a1c
            );

        border:
            1px solid rgba(255, 255, 255, .10);

        border-radius: 20px;

        box-shadow:
            0 30px 90px rgba(0, 0, 0, .55);

        transform:
            translateY(20px)
            scale(.96);

        transition:
            transform .25s ease;
    }


    .delete-modal-overlay.active
    .delete-modal {
        transform:
            translateY(0)
            scale(1);
    }


    .delete-modal::before {
        content: "";

        position: absolute;

        top: 0;
        left: 0;

        width: 100%;
        height: 3px;

        background:
            linear-gradient(
                90deg,
                #e86b20,
                #ff8736,
                #ffa45f
            );
    }


    .delete-modal::after {
        content: "";

        position: absolute;

        top: -100px;
        right: -100px;

        width: 220px;
        height: 220px;

        border-radius: 50%;

        background:
            rgba(255, 135, 54, .07);

        filter: blur(15px);

        pointer-events: none;
    }


    /* =========================================
       CARITA
    ========================================== */

    .face-box {
        position: relative;

        z-index: 2;

        width: 78px;
        height: 78px;

        display: flex;
        align-items: center;
        justify-content: center;

        margin:
            0
            auto
            22px;

        border:
            1px solid rgba(255, 135, 54, .28);

        border-radius: 22px;

        background:
            linear-gradient(
                145deg,
                rgba(255, 135, 54, .13),
                rgba(255, 135, 54, .04)
            );

        box-shadow:
            inset 0 0 25px rgba(255, 135, 54, .04),
            0 10px 30px rgba(0, 0, 0, .20);

        transition:
            transform .35s ease,
            background .35s ease,
            border-color .35s ease;
    }


    .modal-face {
        position: relative;

        width: 52px;
        height: 52px;

        border:
            2px solid #ff8736;

        border-radius: 50%;

        transition:
            transform .35s ease,
            box-shadow .35s ease;
    }


    /* OJOS */

    .face-eyes {
        position: absolute;

        top: 14px;
        left: 50%;

        width: 30px;

        display: flex;
        justify-content: space-between;

        transform:
            translateX(-50%);
    }


    .face-eye {
        position: relative;

        width: 9px;
        height: 10px;

        overflow: hidden;

        border:
            1.5px solid #ff8736;

        border-radius: 50%;

        transition:
            height .25s ease,
            transform .25s ease,
            border .25s ease;
    }


    .pupil {
        position: absolute;

        top: 3px;
        left: 3px;

        width: 3px;
        height: 3px;

        border-radius: 50%;

        background: #ff8736;

        transition:
            transform .12s linear,
            opacity .25s ease;
    }


    /* BOCA NORMAL */

    .face-mouth {
        position: absolute;

        left: 50%;
        bottom: 11px;

        width: 17px;
        height: 2px;

        border-radius: 20px;

        background: #ff8736;

        transform:
            translateX(-50%);

        transition:
            width .3s ease,
            height .3s ease,
            bottom .3s ease,
            border .3s ease,
            background .3s ease,
            border-radius .3s ease;
    }


    /* LÁGRIMA */

    .face-tear {
        position: absolute;

        top: 27px;
        right: 7px;

        width: 6px;
        height: 9px;

        border-radius:
            50%
            50%
            65%
            65%;

        background: #ff8736;

        opacity: 0;

        pointer-events: none;
    }


    /* =========================================
       CARITA FELIZ
    ========================================== */

    .modal-face.happy {
        transform:
            translateY(-3px)
            rotate(-3deg);

        box-shadow:
            0 0 22px
            rgba(255, 135, 54, .15);

        animation:
            happyBounce
            .55s ease;
    }


    .modal-face.happy .face-eye {
        height: 7px;

        border-top: 0;
        border-left: 0;
        border-right: 0;

        border-radius:
            0 0 50% 50%;
    }


    .modal-face.happy .pupil {
        opacity: 0;
    }


    .modal-face.happy .face-mouth {
        bottom: 8px;

        width: 22px;
        height: 12px;

        background: transparent;

        border-bottom:
            3px solid #ff8736;

        border-radius:
            0 0 50% 50%;
    }


    .face-box.happy-box {
        transform:
            translateY(-2px)
            rotate(-2deg);

        border-color:
            rgba(255, 135, 54, .55);

        background:
            rgba(255, 135, 54, .12);
    }


    @keyframes happyBounce {

        0% {
            transform:
                translateY(0)
                rotate(0);
        }

        35% {
            transform:
                translateY(-7px)
                rotate(-5deg);
        }

        65% {
            transform:
                translateY(-2px)
                rotate(4deg);
        }

        100% {
            transform:
                translateY(-3px)
                rotate(-3deg);
        }

    }


    /* =========================================
       CARITA TRISTE
    ========================================== */

    .modal-face.sad {
        transform:
            translateY(3px)
            rotate(2deg);

        animation:
            sadShake
            .65s ease;
    }


    .modal-face.sad .face-eye {
        transform:
            translateY(2px);
    }


    .modal-face.sad .pupil {
        transform:
            translateY(3px);
    }


    .modal-face.sad .face-mouth {
        bottom: 6px;

        width: 22px;
        height: 12px;

        background: transparent;

        border-top:
            3px solid #ff8736;

        border-radius:
            50% 50% 0 0;
    }


    .modal-face.sad .face-tear {
        opacity: 1;

        animation:
            cryingTear
            .9s ease-in
            infinite;
    }


    .face-box.sad-box {
        transform:
            translateY(3px);

        border-color:
            rgba(251, 113, 133, .30);

        background:
            rgba(251, 113, 133, .05);
    }


    @keyframes sadShake {

        0% {
            transform:
                translateY(0)
                rotate(0);
        }

        25% {
            transform:
                translateY(2px)
                rotate(-3deg);
        }

        50% {
            transform:
                translateY(3px)
                rotate(3deg);
        }

        75% {
            transform:
                translateY(3px)
                rotate(-2deg);
        }

        100% {
            transform:
                translateY(3px)
                rotate(2deg);
        }

    }


    @keyframes cryingTear {

        0% {
            opacity: 0;

            transform:
                translateY(-4px)
                scale(.5);
        }

        20% {
            opacity: 1;
        }

        75% {
            opacity: 1;

            transform:
                translateY(13px)
                scale(1);
        }

        100% {
            opacity: 0;

            transform:
                translateY(19px)
                scale(.7);
        }

    }


    /* =========================================
       TEXTO
    ========================================== */

    .delete-modal-label {
        position: relative;

        z-index: 2;

        margin-bottom: 8px;

        color: #ff8736;

        font-size: 9px;
        font-weight: 900;

        letter-spacing: 2px;

        text-align: center;
    }


    .delete-modal h3 {
        position: relative;

        z-index: 2;

        margin:
            0
            0
            10px;

        color: #ffffff;

        font-size: 25px;
        font-weight: 900;

        letter-spacing: -.6px;

        text-align: center;
    }


    .delete-modal-text {
        position: relative;

        z-index: 2;

        margin: 0;

        color: #999a9d;

        font-size: 13px;

        line-height: 1.65;

        text-align: center;
    }


    .delete-project-name {
        color: #ffffff;

        font-weight: 800;
    }


    /* =========================================
       ADVERTENCIA
    ========================================== */

    .delete-warning {
        position: relative;

        z-index: 2;

        display: flex;

        align-items: center;
        justify-content: center;

        gap: 10px;

        margin-top: 20px;

        padding: 12px 14px;

        border:
            1px solid rgba(251, 113, 133, .14);

        border-radius: 10px;

        background:
            rgba(251, 113, 133, .05);

        color: #aaa9a7;

        font-size: 11px;

        line-height: 1.5;

        text-align: center;
    }


    .delete-warning-symbol {
        width: 23px;
        height: 23px;

        flex-shrink: 0;

        display: flex;

        align-items: center;
        justify-content: center;

        border-radius: 7px;

        background:
            rgba(251, 113, 133, .10);

        color: #fb7185;

        font-weight: 900;
    }


    /* =========================================
       BOTONES
    ========================================== */

    .delete-modal-actions {
        position: relative;

        z-index: 2;

        display: grid;

        grid-template-columns:
            1fr 1fr;

        gap: 12px;

        margin-top: 25px;
    }


    .delete-cancel,
    .delete-confirm {
        height: 48px;

        display: flex;

        align-items: center;
        justify-content: center;

        border-radius: 11px;

        font-family: inherit;

        font-size: 11px;
        font-weight: 900;

        letter-spacing: .4px;

        cursor: pointer;

        text-decoration: none;

        transition:
            transform .2s ease,
            border-color .2s ease,
            background .2s ease,
            box-shadow .2s ease;
    }


    .delete-cancel {
        background: #242527;

        border:
            1px solid rgba(255, 255, 255, .10);

        color: #d4d4d4;
    }


    .delete-cancel:hover {
        transform:
            translateY(-2px);

        background: #2b2c2f;

        border-color:
            rgba(255, 135, 54, .30);
    }


    .delete-confirm {
        border:
            1px solid rgba(255, 135, 54, .35);

        background:
            linear-gradient(
                135deg,
                #e86b20,
                #ff8736
            );

        color: #ffffff;

        box-shadow:
            0 10px 25px
            rgba(255, 126, 47, .15);
    }


    .delete-confirm:hover {
        transform:
            translateY(-2px);

        box-shadow:
            0 14px 30px
            rgba(255, 126, 47, .28);
    }


    /* =========================================
       RESPONSIVE
    ========================================== */

    @media (max-width: 520px) {

        .delete-modal {
            padding: 28px 22px;

            border-radius: 17px;
        }


        .delete-modal h3 {
            font-size: 22px;
        }


        .delete-modal-actions {
            grid-template-columns: 1fr;
        }


        .face-box {
            width: 68px;
            height: 68px;
        }


        .modal-face {
            width: 48px;
            height: 48px;
        }

    }

</style>


<!-- =========================================
     JAVASCRIPT
========================================== -->

<script>

    const deleteProjectModal =
        document.getElementById(
            "deleteProjectModal"
        );


    const deleteProjectName =
        document.getElementById(
            "deleteProjectName"
        );


    const confirmProjectDelete =
        document.getElementById(
            "confirmProjectDelete"
        );


    const cancelProjectDelete =
        document.getElementById(
            "cancelProjectDelete"
        );


    const projectFace =
        document.getElementById(
            "projectFace"
        );


    const projectFaceBox =
        document.getElementById(
            "projectFaceBox"
        );


    const projectPupils =
        document.querySelectorAll(
            "#projectFace .pupil"
        );


    const deleteProjectButtons =
        document.querySelectorAll(
            ".delete-project-button"
        );


    /* =========================================
       ABRIR MODAL
    ========================================== */

    deleteProjectButtons.forEach(
        function (button) {

            button.addEventListener(
                "click",
                function () {

                    const url =
                        this.getAttribute(
                            "data-url"
                        );


                    const titulo =
                        this.getAttribute(
                            "data-title"
                        );


                    deleteProjectName.textContent =
                        '"' + titulo + '"';


                    confirmProjectDelete.setAttribute(
                        "href",
                        url
                    );


                    caraProyectoNormal();


                    deleteProjectModal.classList.add(
                        "active"
                    );


                    document.body.style.overflow =
                        "hidden";

                }
            );

        }
    );


    /* =========================================
       CERRAR
    ========================================== */

    function cerrarModalProyecto() {

        deleteProjectModal.classList.remove(
            "active"
        );


        document.body.style.overflow =
            "";


        caraProyectoNormal();

    }


    cancelProjectDelete.addEventListener(
        "click",
        cerrarModalProyecto
    );


    /* =========================================
       CANCELAR = FELIZ
    ========================================== */

    cancelProjectDelete.addEventListener(
        "mouseenter",
        function () {

            projectFace.classList.remove(
                "sad"
            );


            projectFaceBox.classList.remove(
                "sad-box"
            );


            projectFace.classList.add(
                "happy"
            );


            projectFaceBox.classList.add(
                "happy-box"
            );

        }
    );


    /* =========================================
       ELIMINAR = TRISTE
    ========================================== */

    confirmProjectDelete.addEventListener(
        "mouseenter",
        function () {

            projectFace.classList.remove(
                "happy"
            );


            projectFaceBox.classList.remove(
                "happy-box"
            );


            projectFace.classList.add(
                "sad"
            );


            projectFaceBox.classList.add(
                "sad-box"
            );

        }
    );


    /* =========================================
       CARA NORMAL
    ========================================== */

    function caraProyectoNormal() {

        projectFace.classList.remove(
            "happy",
            "sad"
        );


        projectFaceBox.classList.remove(
            "happy-box",
            "sad-box"
        );


        projectPupils.forEach(
            function (pupil) {

                pupil.style.transform =
                    "translate(0px, 0px)";

            }
        );

    }


    cancelProjectDelete.addEventListener(
        "mouseleave",
        caraProyectoNormal
    );


    confirmProjectDelete.addEventListener(
        "mouseleave",
        caraProyectoNormal
    );


    /* =========================================
       OJOS SIGUEN EL MOUSE
    ========================================== */

    deleteProjectModal.addEventListener(
        "mousemove",
        function (event) {

            if (
                projectFace.classList.contains("happy") ||
                projectFace.classList.contains("sad")
            ) {
                return;
            }


            const faceRect =
                projectFace.getBoundingClientRect();


            const centerX =
                faceRect.left +
                faceRect.width / 2;


            const centerY =
                faceRect.top +
                faceRect.height / 2;


            const mouseX =
                event.clientX -
                centerX;


            const mouseY =
                event.clientY -
                centerY;


            const distance =
                Math.sqrt(
                    mouseX * mouseX +
                    mouseY * mouseY
                );


            if (distance === 0) {
                return;
            }


            const maxMovement =
                2.5;


            const movementX =
                (mouseX / distance) *
                maxMovement;


            const movementY =
                (mouseY / distance) *
                maxMovement;


            projectPupils.forEach(
                function (pupil) {

                    pupil.style.transform =
                        "translate(" +
                        movementX +
                        "px, " +
                        movementY +
                        "px)";

                }
            );

        }
    );


    /* =========================================
       CERRAR AL TOCAR EL FONDO
    ========================================== */

    deleteProjectModal.addEventListener(
        "click",
        function (event) {

            if (
                event.target ===
                deleteProjectModal
            ) {

                cerrarModalProyecto();

            }

        }
    );


    /* =========================================
       CERRAR CON ESC
    ========================================== */

    document.addEventListener(
        "keydown",
        function (event) {

            if (
                event.key === "Escape" &&
                deleteProjectModal.classList.contains(
                    "active"
                )
            ) {

                cerrarModalProyecto();

            }

        }
    );

</script>

</body>

</html>