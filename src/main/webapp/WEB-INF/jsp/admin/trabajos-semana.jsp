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
        Trabajos · Semana ${semana.numero} | MOISÉS.
    </title>

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/admin.css"
    >


    <style>

        /* =====================================================
           MODAL - FONDO
        ===================================================== */

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


        /* =====================================================
           MODAL - TARJETA
        ===================================================== */

        .delete-modal {
            position: relative;

            width: 100%;
            max-width: 430px;

            padding: 34px;

            overflow: hidden;

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


        /* =====================================================
           CARITA
        ===================================================== */

        .face-box {
            position: relative;
            z-index: 2;

            width: 78px;
            height: 78px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin-bottom: 22px;

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
                border-color .35s ease,
                box-shadow .35s ease;
        }


        /* =====================================================
           OJOS
        ===================================================== */

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


        /* =====================================================
           BOCA NORMAL
        ===================================================== */

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


        /* =====================================================
           LÁGRIMA
        ===================================================== */

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

            transform:
                translateY(-4px)
                scale(.5);

            pointer-events: none;
        }


        /* =====================================================
           CARITA FELIZ - CANCELAR
        ===================================================== */

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
                0
                0
                50%
                50%;
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
                0
                0
                50%
                50%;
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


        /* =====================================================
           CARITA TRISTE - ELIMINAR
        ===================================================== */

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
                50%
                50%
                0
                0;
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


        /* =====================================================
           TEXTO DEL MODAL
        ===================================================== */

        .delete-modal-label {
            position: relative;
            z-index: 2;

            margin-bottom: 8px;

            color: #ff8736;

            font-size: 9px;
            font-weight: 900;

            letter-spacing: 2px;
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
        }


        .delete-modal-text {
            position: relative;
            z-index: 2;

            margin: 0;

            color: #999a9d;

            font-size: 13px;
            line-height: 1.65;
        }


        .delete-work-name {
            color: #ffffff;

            font-weight: 800;
        }


        /* =====================================================
           ADVERTENCIA
        ===================================================== */

        .delete-warning {
            position: relative;
            z-index: 2;

            display: flex;
            align-items: center;

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


        /* =====================================================
           BOTONES DEL MODAL
        ===================================================== */

        .delete-modal-actions {
            position: relative;
            z-index: 2;

            display: grid;

            grid-template-columns:
                1fr
                1fr;

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


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 520px) {

            .delete-modal {
                padding:
                    28px
                    22px;

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
/* =====================================================
   MODAL DE ELIMINACIÓN - CONTENIDO CENTRADO
===================================================== */

/* TARJETA COMPLETA */

.delete-modal {
    text-align: center;
}


/* =====================================================
   CARITA CENTRADA
===================================================== */

.face-box {
    margin-left: auto;
    margin-right: auto;
    margin-bottom: 22px;
}


/* =====================================================
   TEXTO SUPERIOR
===================================================== */

.delete-modal-label {
    width: 100%;

    text-align: center;
}


/* =====================================================
   TÍTULO
===================================================== */

.delete-modal h3 {
    width: 100%;

    text-align: center;
}


/* =====================================================
   DESCRIPCIÓN
===================================================== */

.delete-modal-text {
    width: 100%;

    text-align: center;
}


/* NOMBRE DEL TRABAJO */

.delete-work-name {
    display: inline;

    text-align: center;
}


/* =====================================================
   ADVERTENCIA
===================================================== */

.delete-warning {
    width: 100%;

    display: flex;

    align-items: center;
    justify-content: center;

    text-align: center;
}


/* ICONO ! */

.delete-warning-symbol {
    flex-shrink: 0;
}


/* =====================================================
   BOTONES
===================================================== */

.delete-modal-actions {
    width: 100%;

    text-align: center;
}


.delete-cancel,
.delete-confirm {
    text-align: center;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 520px) {

    .delete-modal {
        text-align: center;
    }


    .face-box {
        margin-left: auto;
        margin-right: auto;
    }


    .delete-modal-label,
    .delete-modal h3,
    .delete-modal-text {
        text-align: center;
    }


    .delete-warning {
        justify-content: center;

        text-align: center;
    }

}
    </style>

</head>


<body>


<!-- =====================================================
     MENÚ LATERAL
====================================================== -->

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



<!-- =====================================================
     CONTENIDO
====================================================== -->

<main class="main">


    <!-- CABECERA -->

    <header class="top">

        <b>
            Trabajos · Semana ${semana.numero}
        </b>

        <span>
            MOISÉS · ADMIN
        </span>

    </header>



    <div class="content">


        <div class="eyebrow">
            SEMANA ${semana.numero}
        </div>


        <h1>
            ${semana.titulo}
        </h1>


        <p class="muted">
            ${semana.descripcion}
        </p>



        <!-- =================================================
             SUBIR NUEVO TRABAJO
        ================================================== -->

        <section class="panel">

            <h2>
                Subir nuevo trabajo
            </h2>


            <form
                class="form"
                method="post"
                enctype="multipart/form-data"
                action="${pageContext.request.contextPath}/admin/trabajos/guardar"
            >


                <input
                    type="hidden"
                    name="semanaId"
                    value="${semana.id}"
                >


                <!-- TÍTULO -->

                <label>

                    TÍTULO

                    <input
                        type="text"
                        name="titulo"
                        placeholder="Ej. Actividad práctica 01"
                        required
                    >

                </label>


                <!-- DESCRIPCIÓN -->

                <label>

                    DESCRIPCIÓN

                    <textarea
                        name="descripcion"
                        placeholder="Describe brevemente el trabajo..."
                        required
                    ></textarea>

                </label>


                <!-- ARCHIVOS -->

                <div class="grid2">

                    <label>

                        ARCHIVO

                        <input
                            type="file"
                            name="archivo"
                        >

                    </label>


                    <label>

                        IMAGEN DE PORTADA

                        <input
                            type="file"
                            name="imagen"
                            accept="image/*"
                        >

                    </label>

                </div>


                <!-- GUARDAR -->

                <button
                    type="submit"
                    class="primary"
                >
                    ↑ Guardar trabajo
                </button>

            </form>

        </section>



        <!-- =================================================
             TRABAJOS GUARDADOS
        ================================================== -->

        <section class="panel">

            <h2>
                Trabajos guardados
            </h2>


            <!-- SIN TRABAJOS -->

            <c:if test="${empty trabajos}">

                <div class="empty">
                    Aún no hay trabajos en esta semana.
                </div>

            </c:if>



            <!-- CON TRABAJOS -->

            <c:if test="${not empty trabajos}">

                <div class="tablewrap">

                    <table>

                        <thead>

                            <tr>

                                <th>
                                    TÍTULO
                                </th>

                                <th>
                                    DESCRIPCIÓN
                                </th>

                                <th>
                                    ARCHIVO
                                </th>

                                <th>
                                    ACCIONES
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                            <c:forEach
                                items="${trabajos}"
                                var="x"
                            >

                                <tr>


                                    <!-- TÍTULO -->

                                    <td>

                                        <strong>
                                            ${x.titulo}
                                        </strong>

                                    </td>


                                    <!-- DESCRIPCIÓN -->

                                    <td>
                                        ${x.descripcion}
                                    </td>


                                    <!-- ARCHIVO -->

                                    <td>

                                        <c:if test="${not empty x.archivo}">

                                            <a
                                                class="btn"
                                                target="_blank"
                                                rel="noopener noreferrer"
                                                href="${pageContext.request.contextPath}${x.archivo}"
                                            >
                                                Ver ↗
                                            </a>

                                        </c:if>

                                    </td>


                                    <!-- ACCIONES -->

                                    <td>

                                        <div class="actions">


                                            <!-- EDITAR -->

                                            <a
                                                class="btn"
                                                href="${pageContext.request.contextPath}/admin/trabajos/editar/${x.id}"
                                            >
                                                Editar
                                            </a>


                                            <!-- ELIMINAR -->

                                            <button
                                                type="button"
                                                class="btn danger delete-button"
                                                data-url="${pageContext.request.contextPath}/admin/trabajos/eliminar/${x.id}?semanaId=${semana.id}"
                                                data-title="${x.titulo}"
                                            >
                                                Eliminar
                                            </button>

                                        </div>

                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </c:if>

        </section>



        <!-- VOLVER -->

        <a
            class="btn"
            href="${pageContext.request.contextPath}/admin/semanas"
        >
            ← Volver
        </a>

    </div>

</main>



<!-- =====================================================
     MODAL DE ELIMINACIÓN
====================================================== -->

<div
    class="delete-modal-overlay"
    id="deleteModal"
>

    <div
        class="delete-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby="deleteModalTitle"
    >


        <!-- =================================================
             CARITA ANIMADA
        ================================================== -->

        <div
            class="face-box"
            id="faceBox"
        >

            <div
                class="modal-face"
                id="modalFace"
            >


                <!-- OJOS -->

                <div class="face-eyes">

                    <span class="face-eye">

                        <span class="pupil"></span>

                    </span>


                    <span class="face-eye">

                        <span class="pupil"></span>

                    </span>

                </div>


                <!-- BOCA -->

                <div class="face-mouth"></div>


                <!-- LÁGRIMA -->

                <span class="face-tear"></span>

            </div>

        </div>



        <!-- =================================================
             TEXTO
        ================================================== -->

        <div class="delete-modal-label">
            CONFIRMAR ACCIÓN
        </div>


        <h3 id="deleteModalTitle">
            ¿Eliminar trabajo?
        </h3>


        <p class="delete-modal-text">

            Estás a punto de eliminar

            <span
                class="delete-work-name"
                id="deleteWorkName"
            >
                este trabajo
            </span>.

        </p>



        <!-- =================================================
             ADVERTENCIA
        ================================================== -->

        <div class="delete-warning">

            <div class="delete-warning-symbol">
                !
            </div>

            <span>
                Esta acción no se puede deshacer.
            </span>

        </div>



        <!-- =================================================
             BOTONES
        ================================================== -->

        <div class="delete-modal-actions">


            <!-- CANCELAR -->

            <button
                type="button"
                class="delete-cancel"
                id="cancelDelete"
            >
                CANCELAR
            </button>


            <!-- ELIMINAR -->

            <a
                class="delete-confirm"
                id="confirmDelete"
                href="#"
            >
                ELIMINAR →
            </a>

        </div>

    </div>

</div>



<!-- =====================================================
     JAVASCRIPT
====================================================== -->

<script>

    /* =====================================================
       ELEMENTOS DEL MODAL
    ===================================================== */

    const deleteModal =
        document.getElementById("deleteModal");


    const deleteWorkName =
        document.getElementById("deleteWorkName");


    const confirmDelete =
        document.getElementById("confirmDelete");


    const cancelDelete =
        document.getElementById("cancelDelete");


    const deleteButtons =
        document.querySelectorAll(".delete-button");


    const modalFace =
        document.getElementById("modalFace");


    const faceBox =
        document.getElementById("faceBox");


    const pupils =
        document.querySelectorAll(".pupil");



    /* =====================================================
       ABRIR MODAL
    ===================================================== */

    deleteButtons.forEach(
        function (button) {

            button.addEventListener(
                "click",
                function () {

                    const url =
                        this.getAttribute("data-url");


                    const title =
                        this.getAttribute("data-title");


                    deleteWorkName.textContent =
                        '"' + title + '"';


                    confirmDelete.setAttribute(
                        "href",
                        url
                    );


                    caraNormal();


                    deleteModal.classList.add(
                        "active"
                    );


                    document.body.style.overflow =
                        "hidden";

                }
            );

        }
    );



    /* =====================================================
       CERRAR MODAL
    ===================================================== */

    function cerrarModal() {

        deleteModal.classList.remove(
            "active"
        );


        document.body.style.overflow =
            "";


        caraNormal();

    }



    cancelDelete.addEventListener(
        "click",
        cerrarModal
    );



    /* =====================================================
       CANCELAR = CARITA FELIZ
    ===================================================== */

    cancelDelete.addEventListener(
        "mouseenter",
        function () {

            modalFace.classList.remove(
                "sad"
            );


            faceBox.classList.remove(
                "sad-box"
            );


            modalFace.classList.add(
                "happy"
            );


            faceBox.classList.add(
                "happy-box"
            );

        }
    );



    /* =====================================================
       ELIMINAR = CARITA TRISTE
    ===================================================== */

    confirmDelete.addEventListener(
        "mouseenter",
        function () {

            modalFace.classList.remove(
                "happy"
            );


            faceBox.classList.remove(
                "happy-box"
            );


            modalFace.classList.add(
                "sad"
            );


            faceBox.classList.add(
                "sad-box"
            );

        }
    );



    /* =====================================================
       VOLVER A CARA NORMAL
    ===================================================== */

    function caraNormal() {

        modalFace.classList.remove(
            "happy",
            "sad"
        );


        faceBox.classList.remove(
            "happy-box",
            "sad-box"
        );


        pupils.forEach(
            function (pupil) {

                pupil.style.transform =
                    "translate(0px, 0px)";

            }
        );

    }



    cancelDelete.addEventListener(
        "mouseleave",
        caraNormal
    );


    confirmDelete.addEventListener(
        "mouseleave",
        caraNormal
    );



    /* =====================================================
       OJOS SIGUEN EL MOUSE
    ===================================================== */

    deleteModal.addEventListener(
        "mousemove",
        function (event) {


            /*
             * Cuando está feliz o triste,
             * dejamos que haga su propia animación.
             */

            if (
                modalFace.classList.contains("happy") ||
                modalFace.classList.contains("sad")
            ) {

                return;
            }


            const faceRect =
                modalFace.getBoundingClientRect();


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


            pupils.forEach(
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



    /* =====================================================
       CERRAR AL HACER CLIC FUERA
    ===================================================== */

    deleteModal.addEventListener(
        "click",
        function (event) {

            if (
                event.target === deleteModal
            ) {

                cerrarModal();

            }

        }
    );



    /* =====================================================
       CERRAR CON ESC
    ===================================================== */

    document.addEventListener(
        "keydown",
        function (event) {

            if (
                event.key === "Escape" &&
                deleteModal.classList.contains("active")
            ) {

                cerrarModal();

            }

        }
    );


</script>


</body>

</html>