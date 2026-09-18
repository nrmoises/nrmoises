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

    <title>Crear cuenta </title>

       <link
            rel="icon"
            type="image/png"
            href="${pageContext.request.contextPath}/img/favicon.png"
        >

    <style>

        /* =========================================
           CONFIGURACIÓN GENERAL
        ========================================= */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }


        body {
            min-height: 100vh;

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 30px 20px;

            background:
                radial-gradient(
                    circle at 20% 80%,
                    rgba(255, 135, 54, .08),
                    transparent 35%
                ),
                #121315;

            color: #ffffff;

            font-family:
                Arial,
                Helvetica,
                sans-serif;
        }


        /* =========================================
           TARJETA DE REGISTRO
        ========================================= */

        .registro {
            width: 100%;
            max-width: 440px;

            padding: 45px 40px;

            background: #1d1e20;

            border: 1px solid #333436;
            border-radius: 18px;

            box-shadow:
                0 25px 70px rgba(0, 0, 0, .35);
        }


        /* =========================================
           LOGO
        ========================================= */

        .logo {
            width: 48px;
            height: 48px;

            display: grid;
            place-items: center;

            margin-bottom: 25px;

            border-radius: 14px;

            background:
                linear-gradient(
                    135deg,
                    #ff7130,
                    #ffa45f
                );

            color: #ffffff;

            font-size: 22px;
            font-weight: 900;
        }


        /* =========================================
           CABECERA
        ========================================= */

        .kicker {
            margin-bottom: 10px;

            color: #ff8736;

            font-size: 11px;
            font-weight: 800;

            letter-spacing: 2px;
        }


        h1 {
            margin-bottom: 10px;

            font-size: 34px;
            line-height: 1;
        }


        h1 span {
            color: #ff8736;
        }


        .descripcion {
            margin-bottom: 30px;

            color: #999a9d;

            font-size: 14px;
            line-height: 1.6;
        }


        /* =========================================
           CAMPOS
        ========================================= */

        .campo {
            display: block;

            margin-bottom: 18px;
        }


        .campo span {
            display: block;

            margin-bottom: 8px;

            color: #d8d8d8;

            font-size: 12px;
            font-weight: 700;
        }


        input {
            width: 100%;
            height: 54px;

            padding: 0 17px;

            border: 1px solid #3b3c3f;
            border-radius: 12px;

            outline: none;

            background: #202123;

            color: #ffffff;

            font-size: 14px;

            transition: .2s;
        }


        input:focus {
            border-color: #ff8736;

            box-shadow:
                0 0 0 3px rgba(255, 135, 54, .10);
        }


        input::placeholder {
            color: #737477;
        }


        /* =========================================
           ERROR
        ========================================= */

        .error {
            margin-bottom: 20px;

            padding: 13px 15px;

            border:
                1px solid rgba(251, 113, 133, .25);

            border-radius: 10px;

            background:
                rgba(251, 113, 133, .08);

            color: #fb7185;

            font-size: 13px;
        }


        /* =========================================
           BOTÓN
        ========================================= */

        .boton {
            width: 100%;
            height: 55px;

            margin-top: 5px;

            border: 0;
            border-radius: 12px;

            cursor: pointer;

            background:
                linear-gradient(
                    135deg,
                    #ff7130,
                    #ffa45f
                );

            color: #ffffff;

            font-size: 13px;
            font-weight: 800;

            transition: .2s;
        }


        .boton:hover {
            transform: translateY(-2px);

            box-shadow:
                0 15px 35px rgba(255, 135, 54, .18);
        }


        /* =========================================
           VOLVER AL LOGIN
        ========================================= */

        .login {
            margin-top: 25px;

            padding-top: 23px;

            border-top:
                1px solid #333436;

            text-align: center;

            color: #8d8e91;

            font-size: 13px;
        }


        .login a {
            color: #ff8736;

            font-weight: 700;

            text-decoration: none;
        }


        .login a:hover {
            text-decoration: underline;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 520px) {

            body {
                padding: 20px 14px;
            }


            .registro {
                padding: 35px 25px;
            }


            h1 {
                font-size: 29px;
            }


            input {
                height: 52px;
            }


            .boton {
                height: 52px;
            }
        }

    </style>

</head>


<body>


    <main class="registro">


        <!-- =====================================
             LOGO
        ====================================== -->

        <div class="logo">
            M
        </div>


        <!-- =====================================
             CABECERA
        ====================================== -->

        <div class="kicker">
            CREAR CUENTA
        </div>


        <h1>
            Regístrate<span>.</span>
        </h1>


        <p class="descripcion">
            Crea una cuenta para acceder al portafolio
            como usuario.
        </p>


        <!-- =====================================
             MENSAJE DE ERROR
        ====================================== -->

        <c:if test="${not empty error}">

            <div class="error">
                ${error}
            </div>

        </c:if>


        <!-- =====================================
             FORMULARIO
        ====================================== -->

        <form
            method="post"
            action="${pageContext.request.contextPath}/registro"
        >


            <!-- USUARIO -->

            <label class="campo">

                <span>
                    Usuario
                </span>

                <input
                    type="text"
                    name="usuario"
                    placeholder="Cree un nombre de usuario"
                    autocomplete="username"
                    required
                >

            </label>


            <!-- CONTRASEÑA -->

            <label class="campo">

                <span>
                    Contraseña
                </span>

                <input
                    type="password"
                    name="password"
                    placeholder="Cree una contraseña"
                    autocomplete="new-password"
                    required
                >

            </label>


            <!-- CONFIRMAR CONTRASEÑA -->

            <label class="campo">

                <span>
                    Confirmar contraseña
                </span>

                <input
                    type="password"
                    name="confirmarPassword"
                    placeholder="Repita su contraseña"
                    autocomplete="new-password"
                    required
                >

            </label>


            <!-- BOTÓN -->

            <button
                class="boton"
                type="submit"
            >
                CREAR CUENTA →
            </button>

        </form>


        <!-- =====================================
             INICIAR SESIÓN
        ====================================== -->

        <div class="login">

            ¿Ya tienes una cuenta?

            <a href="${pageContext.request.contextPath}/login">
                Iniciar sesión
            </a>

        </div>


    </main>


</body>

</html>