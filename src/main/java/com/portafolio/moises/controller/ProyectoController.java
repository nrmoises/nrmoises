package com.portafolio.moises.controller;

import com.portafolio.moises.model.Proyecto;
import com.portafolio.moises.repository.ProyectoRepository;
import com.portafolio.moises.service.CloudinaryService;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/proyectos")
public class ProyectoController {

 private final ProyectoRepository proyectoRepository;
 private final CloudinaryService cloudinaryService;


 // =========================================
 // CONSTRUCTOR
 // =========================================

 public ProyectoController(
         ProyectoRepository proyectoRepository,
         CloudinaryService cloudinaryService
 ) {

  this.proyectoRepository = proyectoRepository;
  this.cloudinaryService = cloudinaryService;
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
 // MOSTRAR LISTA DE PROYECTOS
 // =========================================

 @GetMapping
 public String listarProyectos(
         HttpSession session,
         Model model
 ) {

  // Verificar sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Obtener todos los proyectos
  model.addAttribute(
          "proyectos",
          proyectoRepository.findAll()
  );


  // Mostrar página de proyectos
  return "admin/proyectos";
 }


 // =========================================
 // GUARDAR NUEVO PROYECTO
 // =========================================

 @PostMapping("/guardar")
 public String guardarProyecto(
         @RequestParam String titulo,
         @RequestParam String descripcion,
         @RequestParam(required = false) String tecnologias,
         @RequestParam(required = false) String url,
         @RequestParam(required = false) MultipartFile imagen,
         HttpSession session
 ) throws Exception {

  // Verificar sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Crear nuevo proyecto
  Proyecto nuevoProyecto = new Proyecto();


  // =====================================
  // ASIGNAR INFORMACIÓN DEL PROYECTO
  // =====================================

  nuevoProyecto.setTitulo(
          titulo
  );

  nuevoProyecto.setDescripcion(
          descripcion
  );

  nuevoProyecto.setTecnologias(
          tecnologias
  );

  nuevoProyecto.setUrl(
          url
  );


  // =====================================
  // SUBIR IMAGEN A CLOUDINARY
  // =====================================

  if (imagen != null
          && !imagen.isEmpty()) {

   String urlImagen =
           cloudinaryService.subirImagen(
                   imagen,
                   "proyectos"
           );

   nuevoProyecto.setImagen(
           urlImagen
   );
  }


  // =====================================
  // GUARDAR PROYECTO EN LA BASE DE DATOS
  // =====================================

  proyectoRepository.save(
          nuevoProyecto
  );


  // Regresar a la lista de proyectos
  return "redirect:/admin/proyectos";
 }


 // =========================================
 // ELIMINAR PROYECTO
 // =========================================

 @GetMapping("/eliminar/{id}")
 public String eliminarProyecto(
         @PathVariable Long id,
         HttpSession session
 ) {

  // Verificar sesión
  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // Eliminar proyecto de la base de datos
  proyectoRepository.deleteById(
          id
  );


  // Regresar a la lista de proyectos
  return "redirect:/admin/proyectos";
 }
}