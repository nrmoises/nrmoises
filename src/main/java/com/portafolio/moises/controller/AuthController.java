package com.portafolio.moises.controller;

import com.portafolio.moises.model.Usuario;
import com.portafolio.moises.repository.UsuarioRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class AuthController {

 private final UsuarioRepository usuarioRepository;
 private final BCryptPasswordEncoder passwordEncoder;


 public AuthController(
         UsuarioRepository usuarioRepository
 ) {
  this.usuarioRepository = usuarioRepository;
  this.passwordEncoder = new BCryptPasswordEncoder();
 }


 // =========================================
 // MOSTRAR LOGIN
 // =========================================

 @GetMapping("/login")
 public String mostrarLogin(
         HttpSession session
 ) {

  Usuario usuarioSesion =
          (Usuario) session.getAttribute("usuario");


  if (usuarioSesion != null) {

   // ADMINISTRADOR
   if ("ADMIN".equals(usuarioSesion.getRol())) {

    return "redirect:/admin";
   }


   // USUARIO NORMAL
   return "redirect:/";
  }


  return "login";
 }


 // =========================================
 // INICIAR SESIÓN
 // =========================================

 @PostMapping("/login")
 public String iniciarSesion(
         @RequestParam String usuario,
         @RequestParam String password,
         HttpSession session,
         Model model
 ) {

  Optional<Usuario> usuarioEncontrado =
          usuarioRepository
                  .findByUsuarioAndActivoTrue(usuario);


  // Verificar usuario
  if (usuarioEncontrado.isEmpty()) {

   model.addAttribute(
           "error",
           "Usuario o contraseña incorrectos."
   );

   return "login";
  }


  Usuario usuarioBaseDatos =
          usuarioEncontrado.get();


  // Verificar contraseña
  if (!passwordEncoder.matches(
          password,
          usuarioBaseDatos.getPassword()
  )) {

   model.addAttribute(
           "error",
           "Usuario o contraseña incorrectos."
   );

   return "login";
  }


  // Guardar usuario completo en sesión
  session.setAttribute(
          "usuario",
          usuarioBaseDatos
  );


  // =====================================
  // ADMINISTRADOR
  // =====================================

  if ("ADMIN".equals(usuarioBaseDatos.getRol())) {

   return "redirect:/admin";
  }


  // =====================================
  // USUARIO NORMAL
  // =====================================

  return "redirect:/";
 }


 // =========================================
 // CERRAR SESIÓN
 // =========================================

 @GetMapping("/logout")
 public String cerrarSesion(
         HttpSession session
 ) {

  session.invalidate();

  return "redirect:/login";
 }
}