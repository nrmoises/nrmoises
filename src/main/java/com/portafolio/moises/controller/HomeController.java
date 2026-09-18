package com.portafolio.moises.controller;

import com.portafolio.moises.model.Perfil;
import com.portafolio.moises.model.Semana;
import com.portafolio.moises.model.Trabajo;

import com.portafolio.moises.repository.PerfilRepository;
import com.portafolio.moises.repository.ProyectoRepository;
import com.portafolio.moises.repository.SemanaRepository;
import com.portafolio.moises.repository.TrabajoRepository;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import java.nio.charset.StandardCharsets;

import java.util.Optional;

@Controller
public class HomeController {

 private final SemanaRepository semanaRepository;
 private final TrabajoRepository trabajoRepository;
 private final ProyectoRepository proyectoRepository;
 private final PerfilRepository perfilRepository;


 // =========================================
 // CONSTRUCTOR
 // =========================================

 public HomeController(
         SemanaRepository semanaRepository,
         TrabajoRepository trabajoRepository,
         ProyectoRepository proyectoRepository,
         PerfilRepository perfilRepository
 ) {

  this.semanaRepository =
          semanaRepository;

  this.trabajoRepository =
          trabajoRepository;

  this.proyectoRepository =
          proyectoRepository;

  this.perfilRepository =
          perfilRepository;
 }


 // =========================================
 // PÁGINA PRINCIPAL DEL PORTAFOLIO
 // =========================================

 @GetMapping("/")
 public String home(
         Model model
 ) {

  // Obtener información del perfil
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


  // Obtener semanas ordenadas
  model.addAttribute(
          "semanas",
          semanaRepository.findAllByOrderByNumeroAsc()
  );


  // Obtener proyectos
  model.addAttribute(
          "proyectos",
          proyectoRepository.findAll()
  );


  // Obtener cantidad total de trabajos
  model.addAttribute(
          "totalTrabajos",
          trabajoRepository.count()
  );


  // Mostrar página principal
  return "index";
 }


 // =========================================
 // MOSTRAR UNA SEMANA
 // =========================================

 @GetMapping("/semana/{id}")
 public String mostrarSemana(
         @PathVariable Long id,
         Model model
 ) {

  // Buscar semana por ID
  Optional<Semana> semanaEncontrada =
          semanaRepository.findById(id);


  // Si la semana no existe
  if (semanaEncontrada.isEmpty()) {

   return "redirect:/#semanas";
  }


  // Enviar información de la semana
  model.addAttribute(
          "semana",
          semanaEncontrada.get()
  );


  // Obtener trabajos pertenecientes
  // a la semana
  model.addAttribute(
          "trabajos",
          trabajoRepository
                  .findBySemanaIdOrderByIdDesc(id)
  );


  // Mostrar detalle de la semana
  return "semana";
 }


 // =========================================
 // DESCARGAR ARCHIVO DE UN TRABAJO
 // CONSERVANDO SU NOMBRE ORIGINAL
 // =========================================

 @GetMapping("/descargar/trabajo/{id}")
 public ResponseEntity<Resource> descargarTrabajo(
         @PathVariable Long id
 ) throws Exception {

  // =====================================
  // BUSCAR TRABAJO
  // =====================================

  Optional<Trabajo> trabajoEncontrado =
          trabajoRepository.findById(id);


  if (trabajoEncontrado.isEmpty()) {

   return ResponseEntity
           .notFound()
           .build();
  }


  Trabajo trabajo =
          trabajoEncontrado.get();


  // =====================================
  // COMPROBAR QUE TENGA ARCHIVO
  // =====================================

  if (trabajo.getArchivo() == null
          || trabajo.getArchivo().isBlank()) {

   return ResponseEntity
           .notFound()
           .build();
  }


  // =====================================
  // OBTENER ARCHIVO DESDE CLOUDINARY
  // =====================================

  HttpClient cliente =
          HttpClient.newHttpClient();


  HttpRequest solicitud =
          HttpRequest
                  .newBuilder()
                  .uri(
                          URI.create(
                                  trabajo.getArchivo()
                          )
                  )
                  .GET()
                  .build();


  HttpResponse<byte[]> respuesta =
          cliente.send(
                  solicitud,
                  HttpResponse.BodyHandlers.ofByteArray()
          );


  // =====================================
  // VERIFICAR RESPUESTA DE CLOUDINARY
  // =====================================

  if (respuesta.statusCode() < 200
          || respuesta.statusCode() >= 300) {

   return ResponseEntity
           .status(respuesta.statusCode())
           .build();
  }


  // =====================================
  // NOMBRE DE DESCARGA
  // =====================================

  String nombreArchivo =
          trabajo.getNombreArchivo();


  // Para trabajos antiguos que todavía
  // no tienen nombre guardado
  if (nombreArchivo == null
          || nombreArchivo.isBlank()) {

   nombreArchivo =
           "trabajo-" + trabajo.getId();
  }


  // =====================================
  // TIPO DE ARCHIVO
  // =====================================

  MediaType tipoContenido =
          MediaType.APPLICATION_OCTET_STREAM;


  if (trabajo.getTipoArchivo() != null
          && !trabajo.getTipoArchivo().isBlank()) {

   try {

    tipoContenido =
            MediaType.parseMediaType(
                    trabajo.getTipoArchivo()
            );

   } catch (Exception ignored) {

    tipoContenido =
            MediaType.APPLICATION_OCTET_STREAM;
   }
  }


  // =====================================
  // PREPARAR ARCHIVO PARA DESCARGA
  // =====================================

  ByteArrayResource recurso =
          new ByteArrayResource(
                  respuesta.body()
          );


  ContentDisposition disposicion =
          ContentDisposition
                  .attachment()
                  .filename(
                          nombreArchivo,
                          StandardCharsets.UTF_8
                  )
                  .build();


  // =====================================
  // DESCARGAR
  // =====================================

  return ResponseEntity
          .ok()
          .header(
                  HttpHeaders.CONTENT_DISPOSITION,
                  disposicion.toString()
          )
          .contentType(
                  tipoContenido
          )
          .contentLength(
                  respuesta.body().length
          )
          .body(
                  recurso
          );
 }
}