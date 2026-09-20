package com.portafolio.moises.controller;

import com.portafolio.moises.model.Semana;
import com.portafolio.moises.model.Trabajo;
import com.portafolio.moises.repository.SemanaRepository;
import com.portafolio.moises.repository.TrabajoRepository;
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

import java.util.Optional;

@Controller
@RequestMapping("/admin/trabajos")
public class TrabajoController {

 private final TrabajoRepository trabajoRepository;
 private final SemanaRepository semanaRepository;
 private final CloudinaryService cloudinaryService;


 // =========================================
 // CONSTRUCTOR
 // =========================================

 public TrabajoController(
         TrabajoRepository trabajoRepository,
         SemanaRepository semanaRepository,
         CloudinaryService cloudinaryService
 ) {

  this.trabajoRepository = trabajoRepository;
  this.semanaRepository = semanaRepository;
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
 // MOSTRAR TODOS LOS TRABAJOS
 // =========================================

 @GetMapping
 public String listarTrabajos(
         HttpSession session,
         Model model
 ) {

  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  model.addAttribute(
          "trabajos",
          trabajoRepository.findAll()
  );


  model.addAttribute(
          "semanas",
          semanaRepository.findAllByOrderByNumeroAsc()
  );


  return "admin/trabajos";
 }


 // =========================================
 // MOSTRAR TRABAJOS DE UNA SEMANA
 // =========================================

 @GetMapping("/semana/{id}")
 public String mostrarTrabajosSemana(
         @PathVariable Long id,
         HttpSession session,
         Model model
 ) {

  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  Optional<Semana> semanaEncontrada =
          semanaRepository.findById(id);


  if (semanaEncontrada.isEmpty()) {

   return "redirect:/admin/semanas";
  }


  model.addAttribute(
          "semana",
          semanaEncontrada.get()
  );


  model.addAttribute(
          "trabajos",
          trabajoRepository
                  .findBySemanaIdOrderByIdAsc(id)
  );


  return "admin/trabajos-semana";
 }


 // =========================================
 // GUARDAR NUEVO TRABAJO
 // =========================================

 @PostMapping("/guardar")
 public String guardarTrabajo(
         @RequestParam String titulo,
         @RequestParam String descripcion,
         @RequestParam Long semanaId,
         @RequestParam(required = false) MultipartFile archivo,
         @RequestParam(required = false) MultipartFile imagen,
         HttpSession session
 ) throws Exception {

  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // =====================================
  // BUSCAR SEMANA
  // =====================================

  Semana semana = semanaRepository
          .findById(semanaId)
          .orElseThrow();


  // =====================================
  // CREAR TRABAJO
  // =====================================

  Trabajo nuevoTrabajo =
          new Trabajo();


  // =====================================
  // INFORMACIÓN DEL TRABAJO
  // =====================================

  nuevoTrabajo.setTitulo(
          titulo
  );

  nuevoTrabajo.setDescripcion(
          descripcion
  );

  nuevoTrabajo.setSemana(
          semana
  );


  // =====================================
  // SUBIR ARCHIVO A CLOUDINARY
  // =====================================

  if (archivo != null
          && !archivo.isEmpty()) {

   String urlArchivo =
           cloudinaryService.subirArchivo(
                   archivo,
                   "trabajos"
           );


   nuevoTrabajo.setArchivo(
           urlArchivo
   );


   nuevoTrabajo.setTipoArchivo(
           archivo.getContentType()
   );


   // Guardar nombre original
   nuevoTrabajo.setNombreArchivo(
           archivo.getOriginalFilename()
   );
  }


  // =====================================
  // SUBIR IMAGEN A CLOUDINARY
  // =====================================

  if (imagen != null
          && !imagen.isEmpty()) {

   String urlImagen =
           cloudinaryService.subirImagen(
                   imagen,
                   "imagenes"
           );


   nuevoTrabajo.setImagen(
           urlImagen
   );
  }


  // =====================================
  // GUARDAR EN LA BASE DE DATOS
  // =====================================

  trabajoRepository.save(
          nuevoTrabajo
  );


  return "redirect:/admin/trabajos/semana/"
          + semanaId;
 }


 // =========================================
 // MOSTRAR FORMULARIO PARA EDITAR
 // =========================================

 @GetMapping("/editar/{id}")
 public String editarTrabajo(
         @PathVariable Long id,
         HttpSession session,
         Model model
 ) {

  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  Optional<Trabajo> trabajoEncontrado =
          trabajoRepository.findById(id);


  if (trabajoEncontrado.isEmpty()) {

   return "redirect:/admin/trabajos";
  }


  model.addAttribute(
          "trabajo",
          trabajoEncontrado.get()
  );


  model.addAttribute(
          "semanas",
          semanaRepository.findAllByOrderByNumeroAsc()
  );


  return "admin/editar-trabajo";
 }


 // =========================================
 // ACTUALIZAR TRABAJO
 // =========================================

 @PostMapping("/actualizar")
 public String actualizarTrabajo(
         @RequestParam Long id,
         @RequestParam String titulo,
         @RequestParam String descripcion,
         @RequestParam Long semanaId,
         @RequestParam(required = false) MultipartFile archivo,
         @RequestParam(required = false) MultipartFile imagen,
         HttpSession session
 ) throws Exception {

  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  // =====================================
  // BUSCAR TRABAJO
  // =====================================

  Trabajo trabajo = trabajoRepository
          .findById(id)
          .orElseThrow();


  // =====================================
  // BUSCAR SEMANA
  // =====================================

  Semana semana = semanaRepository
          .findById(semanaId)
          .orElseThrow();


  // =====================================
  // ACTUALIZAR INFORMACIÓN
  // =====================================

  trabajo.setTitulo(
          titulo
  );

  trabajo.setDescripcion(
          descripcion
  );

  trabajo.setSemana(
          semana
  );


  // =====================================
  // ACTUALIZAR ARCHIVO EN CLOUDINARY
  // =====================================

  if (archivo != null
          && !archivo.isEmpty()) {

   String urlArchivo =
           cloudinaryService.subirArchivo(
                   archivo,
                   "trabajos"
           );


   trabajo.setArchivo(
           urlArchivo
   );


   trabajo.setTipoArchivo(
           archivo.getContentType()
   );


   // Actualizar nombre original
   trabajo.setNombreArchivo(
           archivo.getOriginalFilename()
   );
  }


  // =====================================
  // ACTUALIZAR IMAGEN EN CLOUDINARY
  // =====================================

  if (imagen != null
          && !imagen.isEmpty()) {

   String urlImagen =
           cloudinaryService.subirImagen(
                   imagen,
                   "imagenes"
           );


   trabajo.setImagen(
           urlImagen
   );
  }


  // =====================================
  // GUARDAR CAMBIOS
  // =====================================

  trabajoRepository.save(
          trabajo
  );


  return "redirect:/admin/trabajos/semana/"
          + semanaId;
 }


 // =========================================
 // ELIMINAR TRABAJO
 // =========================================

 @GetMapping("/eliminar/{id}")
 public String eliminarTrabajo(
         @PathVariable Long id,
         @RequestParam(required = false) Long semanaId,
         HttpSession session
 ) {

  if (noHaIniciadoSesion(session)) {

   return "redirect:/login";
  }


  trabajoRepository.deleteById(
          id
  );


  if (semanaId == null) {

   return "redirect:/admin/trabajos";
  }


  return "redirect:/admin/trabajos/semana/"
          + semanaId;
 }
}