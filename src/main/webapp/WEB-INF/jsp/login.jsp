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

    <title>Acceso</title>
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
           CONFIGURACIÓN GENERAL
        ===================================================== */

        * {
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;

            width: 100%;
            min-height: 100%;

            font-family:
                Inter,
                Arial,
                Helvetica,
                sans-serif;

            background: #111214;
        }


        body {
            min-height: 100vh;
            overflow-x: hidden;
        }


        /* =====================================================
           PANTALLA COMPLETA
        ===================================================== */

        .login-page {
            position: relative;

            min-height: 100vh;

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 40px 20px;

            overflow: hidden;

            background:
                radial-gradient(
                    circle at 50% 15%,
                    rgba(255, 135, 54, .10),
                    transparent 30%
                ),
                radial-gradient(
                    circle at 15% 80%,
                    rgba(255, 135, 54, .06),
                    transparent 28%
                ),
                linear-gradient(
                    145deg,
                    #111214 0%,
                    #18191b 48%,
                    #111214 100%
                );
        }


        /* =====================================================
           DECORACIONES DE FONDO
        ===================================================== */

        .shape {
            position: absolute;

            pointer-events: none;

            opacity: .55;
        }


        .shape-one {
            width: 280px;
            height: 280px;

            top: -150px;
            right: -70px;

            border:
                1px solid rgba(255, 135, 54, .14);

            border-radius: 50%;

            box-shadow:
                inset 0 0 70px rgba(255, 135, 54, .03);

            animation:
                floatingShape 8s ease-in-out infinite;
        }


        .shape-two {
            width: 210px;
            height: 210px;

            left: -110px;
            bottom: -50px;

            border:
                1px solid rgba(255, 255, 255, .06);

            transform: rotate(45deg);

            animation:
                floatingShapeTwo 10s ease-in-out infinite;
        }


        .shape-three {
            width: 90px;
            height: 90px;

            top: 18%;
            left: 12%;

            border:
                1px solid rgba(255, 135, 54, .10);

            border-radius: 24px;

            transform: rotate(25deg);

            animation:
                floatingShapeThree 7s ease-in-out infinite;
        }


        @keyframes floatingShape {

            0%,
            100% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(20px);
            }
        }


        @keyframes floatingShapeTwo {

            0%,
            100% {
                transform:
                    rotate(45deg)
                    translateY(0);
            }

            50% {
                transform:
                    rotate(50deg)
                    translateY(-15px);
            }
        }


        @keyframes floatingShapeThree {

            0%,
            100% {
                transform:
                    rotate(25deg)
                    translateY(0);
            }

            50% {
                transform:
                    rotate(35deg)
                    translateY(12px);
            }
        }


        /* =====================================================
           TARJETA LOGIN
        ===================================================== */

        .login-card {
            position: relative;

            z-index: 5;

            width: 100%;
            max-width: 440px;

            padding:
                38px
                40px
                36px;

            background:
                linear-gradient(
                    145deg,
                    rgba(35, 36, 38, .97),
                    rgba(23, 24, 26, .98)
                );

            border:
                1px solid rgba(255, 255, 255, .10);

            border-radius: 24px;

            box-shadow:
                0 35px 90px rgba(0, 0, 0, .55),
                0 0 50px rgba(255, 135, 54, .04);

            overflow: hidden;

            animation:
                loginEnter .65s ease both;
        }


        @keyframes loginEnter {

            from {
                opacity: 0;

                transform:
                    translateY(18px)
                    scale(.98);
            }

            to {
                opacity: 1;

                transform:
                    translateY(0)
                    scale(1);
            }
        }


        /* LÍNEA SUPERIOR */

        .login-card::before {
            content: "";

            position: absolute;

            top: 0;
            left: 50%;

            transform:
                translateX(-50%);

            width: 72%;
            height: 2px;

            background:
                linear-gradient(
                    90deg,
                    transparent,
                    #ff8736,
                    #ffa45f,
                    #ff8736,
                    transparent
                );

            box-shadow:
                0 0 20px rgba(255, 135, 54, .55);
        }


        /* BRILLO INTERNO */

        .login-card::after {
            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            top: -100px;
            right: -90px;

            border-radius: 50%;

            background:
                rgba(255, 135, 54, .06);

            filter: blur(20px);

            pointer-events: none;
        }


        /* =====================================================
           LOGO M
        ===================================================== */

        .login-logo {
            position: relative;

            width: 66px;
            height: 66px;

            margin:
                0 auto
                25px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 18px;

            background:
                linear-gradient(
                    145deg,
                    #1b1c1e,
                    #101113
                );

            border:
                1px solid rgba(255, 135, 54, .35);

            box-shadow:
                0 12px 30px rgba(0, 0, 0, .35),
                0 0 25px rgba(255, 135, 54, .07);

            color: #ffffff;

            font-size: 29px;
            font-weight: 950;

            letter-spacing: -2px;
        }


        .login-logo::after {
            content: "";

            position: absolute;

            bottom: 9px;

            width: 17px;
            height: 2px;

            border-radius: 10px;

            background: #ff8736;

            box-shadow:
                0 0 8px rgba(255, 135, 54, .65);
        }


        /* =====================================================
           CABECERA
        ===================================================== */

        .login-header {
            margin-bottom: 30px;

            text-align: center;
        }


        .login-kicker {
            margin-bottom: 10px;

            color: #ff8736;

            font-size: 9px;
            font-weight: 900;

            letter-spacing: 2.5px;
        }


        .login-header h1 {
            margin:
                0 0
                9px;

            color: #ffffff;

            font-size: 31px;
            font-weight: 900;

            letter-spacing: -1.2px;
        }


        .login-header h1 span {
            color: #ff8736;
        }


        .login-header p {
            max-width: 300px;

            margin: 0 auto;

            color: #929396;

            font-size: 13px;
            line-height: 1.65;
        }


        /* =====================================================
           ERROR
        ===================================================== */

        .login-error {
            display: flex;

            align-items: center;

            gap: 10px;

            margin-bottom: 20px;

            padding:
                12px
                14px;

            background:
                rgba(225, 29, 72, .08);

            border:
                1px solid rgba(251, 113, 133, .22);

            border-radius: 10px;

            color: #fda4af;

            font-size: 12px;
            line-height: 1.5;
        }


        .error-symbol {
            width: 23px;
            height: 23px;

            flex-shrink: 0;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background:
                rgba(251, 113, 133, .12);

            color: #fb7185;

            font-size: 12px;
            font-weight: 900;
        }


        /* =====================================================
           REGISTRO EXITOSO
        ===================================================== */

        .login-success {
            display: flex;

            align-items: center;

            gap: 10px;

            margin-bottom: 20px;

            padding:
                12px
                14px;

            background:
                rgba(34, 197, 94, .07);

            border:
                1px solid rgba(34, 197, 94, .20);

            border-radius: 10px;

            color: #86efac;

            font-size: 12px;
            line-height: 1.5;
        }


        .success-symbol {
            width: 23px;
            height: 23px;

            flex-shrink: 0;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background:
                rgba(34, 197, 94, .12);

            font-weight: 900;
        }


        /* =====================================================
           FORMULARIO
        ===================================================== */

        .login-form {
            display: flex;

            flex-direction: column;

            gap: 20px;
        }


        /* =====================================================
           GRUPO
        ===================================================== */

        .field-group {
            display: flex;

            flex-direction: column;

            gap: 8px;
        }


        .field-group label {
            color: #d4d4d4;

            font-size: 11px;
            font-weight: 800;

            letter-spacing: .2px;
        }


        /* =====================================================
           CAMPO
        ===================================================== */

        .field {
            position: relative;

            width: 100%;
        }


        .field input {
            width: 100%;
            height: 54px;

            padding:
                0
                52px
                0
                48px;

            background: #1b1c1e;

            border:
                1px solid rgba(255, 255, 255, .10);

            border-radius: 12px;

            outline: none;

            color: #ffffff;

            font-family: inherit;
            font-size: 13px;

            transition:
                background .25s ease,
                border-color .25s ease,
                box-shadow .25s ease;
        }


        .field input::placeholder {
            color: #707277;
        }


        .field input:hover {
            border-color:
                rgba(255, 255, 255, .18);
        }


        .field input:focus {
            background: #1e1f21;

            border-color: #ff8736;

            box-shadow:
                0 0 0 3px rgba(255, 135, 54, .10),
                0 8px 25px rgba(0, 0, 0, .12);
        }


        /* =====================================================
           ICONO DEL CAMPO
        ===================================================== */

        .field-icon {
            position: absolute;

            z-index: 2;

            top: 50%;
            left: 16px;

            transform:
                translateY(-50%);

            width: 20px;
            height: 20px;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #777a80;

            pointer-events: none;

            transition:
                color .25s ease;
        }


        .field-icon svg {
            width: 18px;
            height: 18px;

            fill: none;

            stroke: currentColor;

            stroke-width: 1.8;

            stroke-linecap: round;
            stroke-linejoin: round;
        }


        .field:focus-within
        .field-icon {
            color: #ff8736;
        }


        /* =====================================================
           MOSTRAR CONTRASEÑA
        ===================================================== */

        .password-toggle {
            position: absolute;

            z-index: 3;

            top: 50%;
            right: 11px;

            transform:
                translateY(-50%);

            width: 36px;
            height: 36px;

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 0;

            background: transparent;

            border: none;
            border-radius: 9px;

            color: #777a80;

            cursor: pointer;

            transition:
                color .25s ease,
                background .25s ease;
        }


        .password-toggle:hover {
            color: #ff8736;

            background:
                rgba(255, 135, 54, .09);

            transform:
                translateY(-50%);
        }


        .password-toggle svg {
            width: 18px;
            height: 18px;

            fill: none;

            stroke: currentColor;

            stroke-width: 1.8;

            stroke-linecap: round;
            stroke-linejoin: round;

            pointer-events: none;
        }


        /* =====================================================
           BOTÓN INICIAR SESIÓN
        ===================================================== */

        .login-button {
            position: relative;

            width: 100%;
            height: 54px;

            margin-top: 4px;

            display: flex;
            align-items: center;
            justify-content: center;

            gap: 12px;

            border: none;
            border-radius: 12px;

            overflow: hidden;

            background:
                linear-gradient(
                    135deg,
                    #e86b20 0%,
                    #ff8736 50%,
                    #ffa45f 100%
                );

            color: #ffffff;

            font-family: inherit;

            font-size: 12px;
            font-weight: 900;

            letter-spacing: .5px;

            cursor: pointer;

            box-shadow:
                0 13px 32px rgba(255, 126, 47, .20);

            transition:
                transform .25s ease,
                box-shadow .25s ease;
        }


        .login-button::before {
            content: "";

            position: absolute;

            top: 0;
            left: -100%;

            width: 60%;
            height: 100%;

            background:
                linear-gradient(
                    90deg,
                    transparent,
                    rgba(255, 255, 255, .18),
                    transparent
                );

            transform: skewX(-20deg);

            transition:
                left .55s ease;
        }


        .login-button:hover {
            transform:
                translateY(-2px);

            box-shadow:
                0 17px 38px rgba(255, 126, 47, .30);
        }


        .login-button:hover::before {
            left: 140%;
        }


        .button-arrow {
            font-size: 17px;

            transition:
                transform .25s ease;
        }


        .login-button:hover
        .button-arrow {
            transform:
                translateX(5px);
        }


        /* =====================================================
           REGISTRARSE
        ===================================================== */

        .register-box {
            margin-top: 22px;

            display: flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            color: #77797d;

            font-size: 11px;
        }


        .register-box span {
            color: #85878b;
        }


        .register-box a {
            position: relative;

            color: #ff8736;

            font-size: 11px;
            font-weight: 900;

            letter-spacing: .4px;

            text-decoration: none;

            transition:
                color .25s ease;
        }


        .register-box a:hover {
            color: #ffa45f;
        }


        .register-box a::after {
            content: "";

            position: absolute;

            left: 0;
            bottom: -3px;

            width: 0;
            height: 1px;

            background: #ff8736;

            transition:
                width .25s ease;
        }


        .register-box a:hover::after {
            width: 100%;
        }


        /* =====================================================
           PIE DE TARJETA
        ===================================================== */

        .login-footer {
            position: relative;

            margin-top: 27px;

            padding-top: 21px;

            border-top:
                1px solid rgba(255, 255, 255, .07);

            text-align: center;
        }


        .login-footer span {
            color: #66686c;

            font-size: 8px;
            font-weight: 800;

            letter-spacing: 2px;
        }


        .login-footer strong {
            color: #ff8736;

            font-weight: 900;
        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 520px) {

            .login-page {
                padding:
                    25px
                    14px;
            }


            .login-card {
                padding:
                    32px
                    24px
                    28px;

                border-radius: 20px;
            }


            .login-logo {
                width: 60px;
                height: 60px;

                font-size: 26px;
            }


            .login-header h1 {
                font-size: 28px;
            }


            .field input {
                height: 52px;
            }


            .login-button {
                height: 52px;
            }


            .register-box {
                flex-wrap: wrap;

                line-height: 1.5;
            }
        }

    </style>

</head>


<body>


<main class="login-page">


    <!-- DECORACIÓN -->

    <div class="shape shape-one"></div>

    <div class="shape shape-two"></div>

    <div class="shape shape-three"></div>



    <!-- =====================================================
         LOGIN
    ====================================================== -->

    <section class="login-card">


        <!-- LOGO -->

        <div class="login-logo">
            M
        </div>



        <!-- CABECERA -->

        <div class="login-header">

            <div class="login-kicker">
                PANEL ADMINISTRATIVO
            </div>

            <h1>
                Bienvenido<span>.</span>
            </h1>

            <p>
                Ingresa tus credenciales para administrar
                el contenido de tu portafolio.
            </p>

        </div>



        <!-- =================================================
             MENSAJE DE REGISTRO EXITOSO
        ================================================== -->

        <c:if test="${param.registro == 'ok'}">

            <div class="login-success">

                <div class="success-symbol">
                    ✓
                </div>

                <span>
                    Cuenta creada correctamente.
                    Ya puedes iniciar sesión.
                </span>

            </div>

        </c:if>



        <!-- =================================================
             MENSAJE DE ERROR
        ================================================== -->

        <c:if test="${not empty error}">

            <div class="login-error">

                <div class="error-symbol">
                    !
                </div>

                <span>
                    ${error}
                </span>

            </div>

        </c:if>



        <!-- =================================================
             FORMULARIO
        ================================================== -->

        <form
            class="login-form"
            method="post"
            action="${pageContext.request.contextPath}/login"
        >


            <!-- =============================================
                 USUARIO
            ============================================== -->

            <div class="field-group">

                <label for="usuario">
                    Usuario
                </label>


                <div class="field">


                    <!-- ICONO USUARIO -->

                    <span class="field-icon">

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


                    <input
                        type="text"
                        id="usuario"
                        name="usuario"
                        placeholder="Ingrese su usuario"
                        autocomplete="username"
                        required
                    >

                </div>

            </div>



            <!-- =============================================
                 CONTRASEÑA
            ============================================== -->

            <div class="field-group">

                <label for="password">
                    Contraseña
                </label>


                <div class="field">


                    <!-- ICONO CANDADO -->

                    <span class="field-icon">

                        <svg viewBox="0 0 24 24">

                            <rect
                                x="4"
                                y="10"
                                width="16"
                                height="11"
                                rx="2">
                            </rect>

                            <path
                                d="M8 10V7a4 4 0 0 1 8 0v3">
                            </path>

                        </svg>

                    </span>


                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Ingrese su contraseña"
                        autocomplete="current-password"
                        required
                    >



                    <!-- MOSTRAR / OCULTAR -->

                    <button
                        type="button"
                        class="password-toggle"
                        id="passwordToggle"
                        aria-label="Mostrar contraseña"
                    >

                        <svg
                            id="eyeIcon"
                            viewBox="0 0 24 24"
                        >

                            <path
                                d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12z">
                            </path>

                            <circle
                                cx="12"
                                cy="12"
                                r="3">
                            </circle>

                        </svg>

                    </button>

                </div>

            </div>



            <!-- =============================================
                 BOTÓN
            ============================================== -->

            <button
                type="submit"
                class="login-button"
            >

                <span>
                    INICIAR SESIÓN
                </span>

                <span class="button-arrow">
                    →
                </span>

            </button>

        </form>



        <!-- =================================================
             REGISTRARSE
        ================================================== -->

        <div class="register-box">

            <span>
                ¿No tienes una cuenta?
            </span>

            <a href="${pageContext.request.contextPath}/registro">
                REGÍSTRATE
            </a>

        </div>



        <!-- =================================================
             PIE
        ================================================== -->

        <div class="login-footer">

            <span>
                MOISÉS <strong>·</strong> ADMIN
            </span>

        </div>


    </section>

</main>



<!-- =====================================================
     JAVASCRIPT
====================================================== -->

<script>

    const passwordInput =
        document.getElementById("password");


    const passwordToggle =
        document.getElementById("passwordToggle");


    const eyeIcon =
        document.getElementById("eyeIcon");



    passwordToggle.addEventListener(
        "click",
        function () {


            if (passwordInput.type === "password") {


                passwordInput.type = "text";


                passwordToggle.setAttribute(
                    "aria-label",
                    "Ocultar contraseña"
                );


                eyeIcon.innerHTML = `

                    <path d="M3 3l18 18"></path>

                    <path d="
                        M10.6 10.6
                        a2 2 0 0 0
                        2.8 2.8">
                    </path>

                    <path d="
                        M9.9 4.2
                        A10.8 10.8 0 0 1 12 4
                        c6.5 0 10 8 10 8
                        a18.6 18.6 0 0 1-2.1 3.2">
                    </path>

                    <path d="
                        M6.6 6.6
                        C3.7 8.5 2 12 2 12
                        s3.5 8 10 8
                        a9.8 9.8 0 0 0 4.1-.9">
                    </path>

                `;


            } else {


                passwordInput.type = "password";


                passwordToggle.setAttribute(
                    "aria-label",
                    "Mostrar contraseña"
                );


                eyeIcon.innerHTML = `

                    <path
                        d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12z">
                    </path>

                    <circle
                        cx="12"
                        cy="12"
                        r="3">
                    </circle>

                `;

            }

        }
    );

</script>


</body>

</html>