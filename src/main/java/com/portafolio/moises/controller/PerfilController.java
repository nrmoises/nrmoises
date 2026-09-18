package com.portafolio.moises.controller;

import com.portafolio.moises.model.Perfil;
import com.portafolio.moises.repository.PerfilRepository;
import com.portafolio.moises.service.CloudinaryService;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/perfil")
public class PerfilController {

 private final PerfilRepository perfilRepository;
 private final CloudinaryService cloudinaryService;


 // =========================================
 // CONSTRUCTOR
 // =========================================

 public PerfilController(
         PerfilRepository perfilRepository,
         CloudinaryService cloudinaryService
 ) {

  this.perfilRepository = perfilRepository;
  this.cloudinaryService = cloudinaryService;
 }


 // =========================================
 // MOSTRAR PERFIL
 // =========================================

 @GetMapping
 public String verPerfil(
         HttpSession session,
         Model model
 ) {

  // Verificar si el administrador inició sesión
  if (session.getAttribute("usuario") == null) {

   return "redirect:/login";
  }


  // Buscar el perfil existente
  Perfil perfil = perfilRepository
          .findAll()
          .stream()
          .findFirst()
          .orElse(new Perfil());


  // Enviar perfil a la vista
  model.addAttribute(
          "perfil",
          perfil
  );


  // Mostrar página de perfil
  return "admin/perfil";
 }


 // =========================================
 // GUARDAR CAMBIOS DEL PERFIL
 // =========================================

 @PostMapping("/guardar")
 public String guardarPerfil(
         @ModelAttribute Perfil perfilFormulario,
         @RequestParam(required = false)
         MultipartFile fotoArchivo,
         HttpSession session
 ) throws Exception {

  // Verificar si el administrador inició sesión
  if (session.getAttribute("usuario") == null) {

   return "redirect:/login";
  }


  // Buscar perfil actual
  Perfil perfilActual = perfilRepository
          .findAll()
          .stream()
          .findFirst()
          .orElse(new Perfil());


  // =====================================
  // ACTUALIZAR INFORMACIÓN PERSONAL
  // =====================================

  perfilActual.setNombre(
          perfilFormulario.getNombre()
  );

  perfilActual.setCarrera(
          perfilFormulario.getCarrera()
  );

  perfilActual.setInstitucion(
          perfilFormulario.getInstitucion()
  );

  perfilActual.setCiudad(
          perfilFormulario.getCiudad()
  );


  // =====================================
  // ACTUALIZAR PRESENTACIÓN
  // =====================================

  perfilActual.setDescripcion(
          perfilFormulario.getDescripcion()
  );

  perfilActual.setHabilidades(
          perfilFormulario.getHabilidades()
  );


  // =====================================
  // ACTUALIZAR CONTACTO
  // =====================================

  perfilActual.setCorreo(
          perfilFormulario.getCorreo()
  );


  // =====================================
  // ACTUALIZAR REDES PROFESIONALES
  // =====================================

  perfilActual.setGithub(
          perfilFormulario.getGithub()
  );

  perfilActual.setLinkedin(
          perfilFormulario.getLinkedin()
  );


  // =====================================
  // SUBIR FOTO A CLOUDINARY
  // =====================================

  if (fotoArchivo != null
          && !fotoArchivo.isEmpty()) {

   String urlFoto =
           cloudinaryService.subirImagen(
                   fotoArchivo,
                   "perfil"
           );

   perfilActual.setFoto(
           urlFoto
   );
  }


  // =====================================
  // GUARDAR URL EN LA BASE DE DATOS
  // =====================================

  perfilRepository.save(
          perfilActual
  );


  // Regresar al perfil mostrando confirmación
  return "redirect:/admin/perfil?ok";
 }
}