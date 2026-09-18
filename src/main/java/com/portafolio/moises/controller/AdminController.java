package com.portafolio.moises.controller;

import com.portafolio.moises.repository.MensajeRepository;
import com.portafolio.moises.repository.ProyectoRepository;
import com.portafolio.moises.repository.SemanaRepository;
import com.portafolio.moises.repository.TrabajoRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

 private final SemanaRepository semanaRepository;
 private final TrabajoRepository trabajoRepository;
 private final ProyectoRepository proyectoRepository;
 private final MensajeRepository mensajeRepository;


 public AdminController(
         SemanaRepository semanaRepository,
         TrabajoRepository trabajoRepository,
         ProyectoRepository proyectoRepository,
         MensajeRepository mensajeRepository
 ) {
  this.semanaRepository = semanaRepository;
  this.trabajoRepository = trabajoRepository;
  this.proyectoRepository = proyectoRepository;
  this.mensajeRepository = mensajeRepository;
 }


 // =========================================
 // PANEL PRINCIPAL DEL ADMINISTRADOR
 // =========================================

 @GetMapping
 public String dashboard(
         HttpSession session,
         Model model
 ) {

  // Verificar si el administrador inició sesión
  if (session.getAttribute("usuario") == null) {

   return "redirect:/login";
  }


  // Obtener información para el dashboard
  long totalSemanas =
          semanaRepository.count();

  long totalTrabajos =
          trabajoRepository.count();

  long totalProyectos =
          proyectoRepository.count();

  long mensajesNuevos =
          mensajeRepository.countByLeidoFalse();


  // Enviar información a la vista
  model.addAttribute(
          "totalSemanas",
          totalSemanas
  );

  model.addAttribute(
          "totalTrabajos",
          totalTrabajos
  );

  model.addAttribute(
          "totalProyectos",
          totalProyectos
  );

  model.addAttribute(
          "mensajesNuevos",
          mensajesNuevos
  );


  // Mostrar dashboard
  return "admin/dashboard";
 }
}