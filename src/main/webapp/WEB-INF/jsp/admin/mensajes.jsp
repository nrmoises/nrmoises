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

    <title>Mensajes</title>

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

        <a href="${pageContext.request.contextPath}/admin/trabajos">
            ▣ Trabajos
        </a>

        <a href="${pageContext.request.contextPath}/admin/proyectos">
            ◇ Proyectos
        </a>

        <a
            class="active"
            href="${pageContext.request.contextPath}/admin/mensajes"
        >
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
     CONTENIDO PRINCIPAL
====================================================== -->

<main class="main">


    <!-- CABECERA -->

    <header class="top">

        <b>
            Mensajes
        </b>

        <span>
            MOISÉS · ADMIN
        </span>

    </header>



    <div class="content">


        <div class="eyebrow">
            BANDEJA DE ENTRADA
        </div>


        <h1>
            Mensajes recibidos
        </h1>


        <p class="mensajes-subtitle">
            Revisa y administra los mensajes enviados
            desde el formulario de contacto de tu portafolio.
        </p>



        <!-- =================================================
             TABLA DE MENSAJES
        ================================================== -->

        <section class="panel tablewrap mensajes-panel">

            <table class="mensajes-table">


                <!-- CABECERA -->

                <thead>

                    <tr>

                        <th>N°</th>

                        <th>ESTADO</th>

                        <th>NOMBRE</th>

                        <th>CORREO</th>

                        <th>ASUNTO</th>

                        <th>MENSAJE</th>

                        <th>ACCIONES</th>

                    </tr>

                </thead>



                <!-- CUERPO -->

                <tbody>


                <c:forEach
                    items="${mensajes}"
                    var="m"
                    varStatus="estado"
                >

                    <tr>


                        <!-- NÚMERO -->

                        <td>

                            <div class="mensaje-numero">
                                ${estado.count}
                            </div>

                        </td>



                        <!-- ESTADO -->

                        <td>

                            <c:choose>

                                <c:when test="${m.leido}">

                                    <span class="estado-badge estado-leido">
                                        LEÍDO
                                    </span>

                                </c:when>


                                <c:otherwise>

                                    <span class="estado-badge estado-nuevo">
                                        NUEVO
                                    </span>

                                </c:otherwise>

                            </c:choose>

                        </td>



                        <!-- NOMBRE -->

                        <td>

                            <div class="mensaje-persona">

                                <strong>
                                    ${m.nombre}
                                </strong>

                                <span>
                                    REMITENTE
                                </span>

                            </div>

                        </td>



                        <!-- CORREO -->

                        <td>

                            <span class="mensaje-correo">
                                ${m.correo}
                            </span>

                        </td>



                        <!-- ASUNTO -->

                        <td>

                            <strong class="mensaje-asunto">
                                ${m.asunto}
                            </strong>

                        </td>



                        <!-- MENSAJE -->

                        <td>

                            <div class="mensaje-texto">
                                ${m.mensaje}
                            </div>

                        </td>



                        <!-- ACCIONES -->

                        <td>

                            <div class="actions">


                                <!-- MARCAR COMO LEÍDO -->

                                <c:if test="${not m.leido}">

                                    <a
                                        class="btn"
                                        href="${pageContext.request.contextPath}/admin/mensajes/leer/${m.id}"
                                    >
                                        Marcar leído
                                    </a>

                                </c:if>



                                <!-- ELIMINAR -->

                                <button
                                    type="button"
                                    class="btn danger delete-message-button"
                                    data-url="${pageContext.request.contextPath}/admin/mensajes/eliminar/${m.id}"
                                    data-name="${m.nombre}"
                                    data-subject="${m.asunto}"
                                >
                                    Eliminar
                                </button>

                            </div>

                        </td>

                    </tr>

                </c:forEach>


                </tbody>

            </table>

        </section>

    </div>

</main>



<!-- =====================================================
     MODAL DE ELIMINACIÓN
====================================================== -->

<div
    class="delete-modal-overlay"
    id="deleteMessageModal"
>

    <div
        class="delete-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby="deleteMessageTitle"
    >


        <!-- =================================================
             CARITA ANIMADA
        ================================================== -->

        <div
            class="face-box"
            id="messageFaceBox"
        >

            <div
                class="modal-face"
                id="messageFace"
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
             INFORMACIÓN
        ================================================== -->

        <div class="delete-modal-label">
            CONFIRMAR ACCIÓN
        </div>


        <h3 id="deleteMessageTitle">
            ¿Eliminar mensaje?
        </h3>


        <p class="delete-modal-text">

            Estás a punto de eliminar el mensaje de

            <span
                class="delete-message-name"
                id="deleteMessageName"
            >
                este usuario
            </span>.

        </p>


        <p
            class="delete-message-subject"
            id="deleteMessageSubject"
        ></p>



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
                id="cancelMessageDelete"
            >
                CANCELAR
            </button>


            <!-- ELIMINAR -->

            <a
                class="delete-confirm"
                id="confirmMessageDelete"
                href="#"
            >
                ELIMINAR →
            </a>

        </div>

    </div>

</div>



<!-- =====================================================
     ESTILOS
====================================================== -->

<style>

    /* =====================================================
       DESCRIPCIÓN
    ===================================================== */

    .mensajes-subtitle {
        margin: -10px 0 30px;

        max-width: 620px;

        color: #929292;

        font-size: 13px;

        line-height: 1.7;
    }



    /* =====================================================
       PANEL
    ===================================================== */

    .mensajes-panel {
        padding: 14px 24px 24px;
    }



    /* =====================================================
       TABLA
    ===================================================== */

    .mensajes-table {
        width: 100%;

        border-collapse: separate;

        border-spacing: 0 12px;
    }


    .mensajes-table thead th {
        padding: 10px 14px 14px;

        color: #8f9093;

        font-size: 9px;

        font-weight: 800;

        letter-spacing: 2px;

        text-align: left;

        border-bottom: none;
    }



    /* =====================================================
       FILAS
    ===================================================== */

    .mensajes-table tbody tr {
        background: #242527;

        transition:
            transform .25s ease,
            background .25s ease,
            box-shadow .25s ease;
    }


    .mensajes-table tbody tr:hover {
        background: #292a2d;

        transform: translateY(-2px);

        box-shadow:
            0 10px 30px rgba(0, 0, 0, .20);
    }


    .mensajes-table tbody td {
        padding: 20px 14px;

        vertical-align: middle;

        border-top:
            1px solid rgba(255, 255, 255, .06);

        border-bottom:
            1px solid rgba(255, 255, 255, .06);
    }


    .mensajes-table tbody td:first-child {
        border-left:
            1px solid rgba(255, 255, 255, .06);

        border-radius:
            12px 0 0 12px;
    }


    .mensajes-table tbody td:last-child {
        border-right:
            1px solid rgba(255, 255, 255, .06);

        border-radius:
            0 12px 12px 0;
    }



    /* =====================================================
       NÚMERO
    ===================================================== */

    .mensaje-numero {
        display: flex;

        align-items: center;

        justify-content: center;

        width: 42px;

        height: 42px;

        border-radius: 10px;

        background:
            rgba(255, 135, 54, .08);

        border:
            1px solid rgba(255, 135, 54, .35);

        color: #ff8736;

        font-size: 14px;

        font-weight: 900;
    }



    /* =====================================================
       ESTADO
    ===================================================== */

    .estado-badge {
        display: inline-flex;

        align-items: center;

        justify-content: center;

        min-width: 55px;

        padding: 8px 11px;

        border-radius: 8px;

        font-size: 9px;

        font-weight: 900;

        letter-spacing: 1px;
    }


    .estado-nuevo {
        color: #ff9b59;

        background:
            rgba(255, 135, 54, .08);

        border:
            1px solid rgba(255, 135, 54, .25);
    }


    .estado-leido {
        color: #a8aaa9;

        background:
            rgba(255, 255, 255, .04);

        border:
            1px solid rgba(255, 255, 255, .10);
    }



    /* =====================================================
       PERSONA
    ===================================================== */

    .mensaje-persona {
        display: flex;

        flex-direction: column;

        gap: 6px;

        min-width: 145px;
    }


    .mensaje-persona strong {
        color: #ffffff;

        font-size: 12px;

        line-height: 1.5;
    }


    .mensaje-persona span {
        color: #737579;

        font-size: 8px;

        font-weight: 800;

        letter-spacing: 1.5px;
    }



    /* =====================================================
       CORREO
    ===================================================== */

    .mensaje-correo {
        color: #c5c5c5;

        font-size: 11px;

        white-space: nowrap;
    }



    /* =====================================================
       ASUNTO
    ===================================================== */

    .mensaje-asunto {
        display: block;

        max-width: 160px;

        color: #ffffff;

        font-size: 11px;

        line-height: 1.5;
    }



    /* =====================================================
       MENSAJE
    ===================================================== */

    .mensaje-texto {
        max-width: 220px;

        padding: 9px 11px;

        background: #1c1d1f;

        border:
            1px solid rgba(255, 255, 255, .07);

        border-radius: 8px;

        color: #b8b8b8;

        font-size: 11px;

        line-height: 1.55;
    }



    /* =====================================================
       ACCIONES
    ===================================================== */

    .mensajes-table .actions {
        display: flex;

        align-items: center;

        gap: 8px;

        flex-wrap: nowrap;
    }


    .mensajes-table .actions .btn {
        white-space: nowrap;

        text-align: center;
    }



    /* =====================================================
       FONDO DEL MODAL
    ===================================================== */

    .delete-modal-overlay {
        position: fixed;

        inset: 0;

        z-index: 9999;

        display: flex;

        align-items: center;

        justify-content: center;

        padding: 20px;

        background:
            rgba(5, 6, 7, .78);

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
       TARJETA DEL MODAL
    ===================================================== */

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

        pointer-events: none;
    }



    /* =====================================================
       FELIZ
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



    /* =====================================================
       TRISTE
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



    /* =====================================================
       TEXTOS DEL MODAL
    ===================================================== */

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


    .delete-message-name {
        color: #ffffff;

        font-weight: 800;
    }


    .delete-message-subject {
        position: relative;

        z-index: 2;

        margin:
            10px
            auto
            0;

        max-width: 300px;

        color: #ff9b59;

        font-size: 11px;

        font-weight: 700;

        line-height: 1.5;

        text-align: center;
    }



    /* =====================================================
       ADVERTENCIA
    ===================================================== */

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



    /* =====================================================
       BOTONES DEL MODAL
    ===================================================== */

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



    /* =====================================================
       RESPONSIVE
    ===================================================== */

    @media (max-width: 1100px) {

        .mensajes-panel {
            overflow-x: auto;
        }


        .mensajes-table {
            min-width: 1000px;
        }

    }


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



<!-- =====================================================
     JAVASCRIPT DEL MODAL
====================================================== -->

<script>

    /* =====================================================
       ELEMENTOS
    ===================================================== */

    const deleteMessageModal =
        document.getElementById(
            "deleteMessageModal"
        );


    const deleteMessageName =
        document.getElementById(
            "deleteMessageName"
        );


    const deleteMessageSubject =
        document.getElementById(
            "deleteMessageSubject"
        );


    const confirmMessageDelete =
        document.getElementById(
            "confirmMessageDelete"
        );


    const cancelMessageDelete =
        document.getElementById(
            "cancelMessageDelete"
        );


    const messageFace =
        document.getElementById(
            "messageFace"
        );


    const messageFaceBox =
        document.getElementById(
            "messageFaceBox"
        );


    const messagePupils =
        document.querySelectorAll(
            "#messageFace .pupil"
        );


    const deleteMessageButtons =
        document.querySelectorAll(
            ".delete-message-button"
        );



    /* =====================================================
       ABRIR MODAL
    ===================================================== */

    deleteMessageButtons.forEach(
        function (button) {

            button.addEventListener(
                "click",
                function () {

                    const url =
                        this.getAttribute(
                            "data-url"
                        );


                    const nombre =
                        this.getAttribute(
                            "data-name"
                        );


                    const asunto =
                        this.getAttribute(
                            "data-subject"
                        );


                    deleteMessageName.textContent =
                        '"' + nombre + '"';


                    if (
                        asunto !== null &&
                        asunto.trim() !== ""
                    ) {

                        deleteMessageSubject.textContent =
                            'Asunto: "' +
                            asunto +
                            '"';

                    } else {

                        deleteMessageSubject.textContent =
                            "";

                    }


                    confirmMessageDelete.setAttribute(
                        "href",
                        url
                    );


                    caraMensajeNormal();


                    deleteMessageModal.classList.add(
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

    function cerrarModalMensaje() {

        deleteMessageModal.classList.remove(
            "active"
        );


        document.body.style.overflow =
            "";


        caraMensajeNormal();

    }



    cancelMessageDelete.addEventListener(
        "click",
        cerrarModalMensaje
    );



    /* =====================================================
       CANCELAR = FELIZ
    ===================================================== */

    cancelMessageDelete.addEventListener(
        "mouseenter",
        function () {

            messageFace.classList.remove(
                "sad"
            );


            messageFaceBox.classList.remove(
                "sad-box"
            );


            messageFace.classList.add(
                "happy"
            );


            messageFaceBox.classList.add(
                "happy-box"
            );

        }
    );



    /* =====================================================
       ELIMINAR = TRISTE
    ===================================================== */

    confirmMessageDelete.addEventListener(
        "mouseenter",
        function () {

            messageFace.classList.remove(
                "happy"
            );


            messageFaceBox.classList.remove(
                "happy-box"
            );


            messageFace.classList.add(
                "sad"
            );


            messageFaceBox.classList.add(
                "sad-box"
            );

        }
    );



    /* =====================================================
       CARA NORMAL
    ===================================================== */

    function caraMensajeNormal() {

        messageFace.classList.remove(
            "happy",
            "sad"
        );


        messageFaceBox.classList.remove(
            "happy-box",
            "sad-box"
        );


        messagePupils.forEach(
            function (pupil) {

                pupil.style.transform =
                    "translate(0px, 0px)";

            }
        );

    }



    cancelMessageDelete.addEventListener(
        "mouseleave",
        caraMensajeNormal
    );


    confirmMessageDelete.addEventListener(
        "mouseleave",
        caraMensajeNormal
    );



    /* =====================================================
       OJOS SIGUEN EL MOUSE
    ===================================================== */

    deleteMessageModal.addEventListener(
        "mousemove",
        function (event) {

            if (
                messageFace.classList.contains("happy") ||
                messageFace.classList.contains("sad")
            ) {

                return;

            }


            const faceRect =
                messageFace.getBoundingClientRect();


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


            messagePupils.forEach(
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
       CERRAR AL TOCAR EL FONDO
    ===================================================== */

    deleteMessageModal.addEventListener(
        "click",
        function (event) {

            if (
                event.target ===
                deleteMessageModal
            ) {

                cerrarModalMensaje();

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
                deleteMessageModal.classList.contains(
                    "active"
                )
            ) {

                cerrarModalMensaje();

            }

        }
    );

</script>


</body>

</html>