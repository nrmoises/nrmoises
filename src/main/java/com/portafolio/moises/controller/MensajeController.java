package com.portafolio.moises.controller;

import com.portafolio.moises.model.Mensaje;
import com.portafolio.moises.repository.MensajeRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/mensajes")
public class MensajeController {

 private final MensajeRepository mensajeRepository;


 public MensajeController(
         MensajeRepository mensajeRepository
 ) {
  this.mensajeRepository = mensajeRepository;
 }


 // =========================================
 // VERIFICAR SESIÓN DEL ADMINISTRADOR
 // =========================================

 private boolean noHaIniciadoSesion(
         HttpSession session
 ) {

  return session.getAttribute("usuario") == null;
 }


 // =========================================
 // MOSTRAR TODOS LOS MENSAJES
 // =========================================

 @GetMapping
 public String listarMensajes(
         HttpSession session,
         Model model
 ) {

  // Verificar si el administrador inició sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Obtener mensajes ordenados por fecha
  model.addAttribute(
          "mensajes",
          mensajeRepository.findAllByOrderByFechaDesc()
  );


  // Mostrar página de mensajes
  return "admin/mensajes";
 }


 // =========================================
 // MARCAR MENSAJE COMO LEÍDO
 // =========================================

 @GetMapping("/leer/{id}")
 public String marcarComoLeido(
         @PathVariable Long id,
         HttpSession session
 ) {

  // Verificar sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Buscar mensaje
  mensajeRepository
          .findById(id)
          .ifPresent(mensaje -> {

           mensaje.setLeido(true);

           mensajeRepository.save(mensaje);
          });


  // Regresar a la lista de mensajes
  return "redirect:/admin/mensajes";
 }


 // =========================================
 // ELIMINAR MENSAJE
 // =========================================

 @GetMapping("/eliminar/{id}")
 public String eliminarMensaje(
         @PathVariable Long id,
         HttpSession session
 ) {

  // Verificar sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Eliminar mensaje de la base de datos
  mensajeRepository.deleteById(id);


  // Regresar a la lista de mensajes
  return "redirect:/admin/mensajes";
 }
}