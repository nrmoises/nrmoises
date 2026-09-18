package com.portafolio.moises.config;

import com.portafolio.moises.model.Usuario;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminInterceptor implements HandlerInterceptor {

    // =========================================
    // PROTEGER RUTAS DEL ADMINISTRADOR
    // =========================================

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler
    ) throws Exception {

        HttpSession session =
                request.getSession(false);


        // =====================================
        // NO HAY SESIÓN
        // =====================================

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return false;
        }


        Object objetoUsuario =
                session.getAttribute("usuario");


        // =====================================
        // NO HAY USUARIO EN LA SESIÓN
        // =====================================

        if (!(objetoUsuario instanceof Usuario)) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return false;
        }


        Usuario usuario =
                (Usuario) objetoUsuario;


        // =====================================
        // VERIFICAR ROL ADMIN
        // =====================================

        if (!"ADMIN".equals(usuario.getRol())) {

            response.sendRedirect(
                    request.getContextPath() + "/"
            );

            return false;
        }


        // =====================================
        // ES ADMINISTRADOR
        // =====================================

        return true;
    }
}