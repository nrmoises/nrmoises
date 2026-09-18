package com.portafolio.moises.controller;

import com.portafolio.moises.model.Semana;
import com.portafolio.moises.repository.SemanaRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/admin/semanas")
public class SemanaController {

 private final SemanaRepository semanaRepository;


 public SemanaController(
         SemanaRepository semanaRepository
 ) {
  this.semanaRepository = semanaRepository;
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
 // MOSTRAR LISTA DE SEMANAS
 // =========================================

 @GetMapping
 public String listarSemanas(
         HttpSession session,
         Model model
 ) {

  // Verificar sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Obtener semanas ordenadas por número
  model.addAttribute(
          "semanas",
          semanaRepository.findAllByOrderByNumeroAsc()
  );


  // Mostrar página de semanas
  return "admin/semanas";
 }


 // =========================================
 // MOSTRAR FORMULARIO PARA EDITAR SEMANA
 // =========================================

 @GetMapping("/editar/{id}")
 public String editarSemana(
         @PathVariable Long id,
         HttpSession session,
         Model model
 ) {

  // Verificar sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Buscar semana por ID
  Optional<Semana> semanaEncontrada =
          semanaRepository.findById(id);


  // Si la semana no existe
  if (semanaEncontrada.isEmpty()) {

   return "redirect:/admin/semanas";
  }


  // Enviar semana a la vista
  model.addAttribute(
          "semana",
          semanaEncontrada.get()
  );


  // Mostrar formulario de edición
  return "admin/editar-semana";
 }


 // =========================================
 // ACTUALIZAR SEMANA
 // =========================================

 @PostMapping("/actualizar")
 public String actualizarSemana(
         @RequestParam Long id,
         @RequestParam String titulo,
         @RequestParam String descripcion,
         HttpSession session
 ) {

  // Verificar sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Buscar semana y actualizar sus datos
  semanaRepository
          .findById(id)
          .ifPresent(semana -> {

           semana.setTitulo(
                   titulo
           );

           semana.setDescripcion(
                   descripcion
           );

           semanaRepository.save(
                   semana
           );
          });


  // Regresar a la lista de semanas
  return "redirect:/admin/semanas";
 }
}