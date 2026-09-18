package com.portafolio.moises.controller;

import com.portafolio.moises.model.Usuario;
import com.portafolio.moises.repository.UsuarioRepository;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegistroController {

    private final UsuarioRepository usuarioRepository;
    private final BCryptPasswordEncoder passwordEncoder;


    public RegistroController(
            UsuarioRepository usuarioRepository
    ) {

        this.usuarioRepository = usuarioRepository;

        this.passwordEncoder =
                new BCryptPasswordEncoder();
    }


    // =========================================
    // MOSTRAR FORMULARIO DE REGISTRO
    // =========================================

    @GetMapping("/registro")
    public String mostrarRegistro() {

        return "registro";
    }


    // =========================================
    // REGISTRAR NUEVO USUARIO
    // =========================================

    @PostMapping("/registro")
    public String registrarUsuario(
            @RequestParam String usuario,
            @RequestParam String password,
            @RequestParam String confirmarPassword,
            Model model
    ) {

        // =====================================
        // VALIDAR CONTRASEÑAS
        // =====================================

        if (!password.equals(confirmarPassword)) {

            model.addAttribute(
                    "error",
                    "Las contraseñas no coinciden."
            );

            return "registro";
        }


        // =====================================
        // VERIFICAR SI EL USUARIO YA EXISTE
        // =====================================

        if (usuarioRepository.existsByUsuario(usuario)) {

            model.addAttribute(
                    "error",
                    "Ese nombre de usuario ya está registrado."
            );

            return "registro";
        }


        // =====================================
        // CREAR NUEVO USUARIO
        // =====================================

        Usuario nuevoUsuario =
                new Usuario();


        // Usamos el mismo valor para nombre y usuario
        nuevoUsuario.setNombre(
                usuario
        );


        nuevoUsuario.setUsuario(
                usuario
        );


        // Guardamos la contraseña encriptada
        nuevoUsuario.setPassword(
                passwordEncoder.encode(password)
        );


        nuevoUsuario.setActivo(
                true
        );


        // Todo registro público será USER
        nuevoUsuario.setRol(
                "USER"
        );


        // =====================================
        // GUARDAR EN MYSQL
        // =====================================

        usuarioRepository.save(
                nuevoUsuario
        );


        // =====================================
        // VOLVER AL LOGIN
        // =====================================

        return "redirect:/login?registro=ok";
    }
}