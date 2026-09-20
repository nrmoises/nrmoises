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


  long inicio =
          System.currentTimeMillis();


  System.out.println(
          "========================================="
  );

  System.out.println(
          "===== INICIO HOME ====="
  );

  System.out.println(
          "========================================="
  );


  // =====================================
  // PERFIL
  // =====================================

  long tiempoPerfil =
          System.currentTimeMillis();


  Perfil perfil =
          perfilRepository
                  .findAll()
                  .stream()
                  .findFirst()
                  .orElse(
                          new Perfil()
                  );


  long resultadoPerfil =
          System.currentTimeMillis()
                  - tiempoPerfil;


  System.out.println(
          "PERFIL: "
                  + resultadoPerfil
                  + " ms"
  );


  model.addAttribute(
          "perfil",
          perfil
  );


  // =====================================
  // SEMANAS
  // =====================================

  long tiempoSemanas =
          System.currentTimeMillis();


  model.addAttribute(
          "semanas",
          semanaRepository
                  .findAllByOrderByNumeroAsc()
  );


  long resultadoSemanas =
          System.currentTimeMillis()
                  - tiempoSemanas;


  System.out.println(
          "SEMANAS: "
                  + resultadoSemanas
                  + " ms"
  );


  // =====================================
  // PROYECTOS
  // =====================================

  long tiempoProyectos =
          System.currentTimeMillis();


  model.addAttribute(
          "proyectos",
          proyectoRepository
                  .findAll()
  );


  long resultadoProyectos =
          System.currentTimeMillis()
                  - tiempoProyectos;


  System.out.println(
          "PROYECTOS: "
                  + resultadoProyectos
                  + " ms"
  );


  // =====================================
  // TOTAL DE TRABAJOS
  // =====================================

  long tiempoTrabajos =
          System.currentTimeMillis();


  model.addAttribute(
          "totalTrabajos",
          trabajoRepository
                  .count()
  );


  long resultadoTrabajos =
          System.currentTimeMillis()
                  - tiempoTrabajos;


  System.out.println(
          "TOTAL TRABAJOS: "
                  + resultadoTrabajos
                  + " ms"
  );


  // =====================================
  // TIEMPO TOTAL DE HOME
  // =====================================

  long tiempoTotal =
          System.currentTimeMillis()
                  - inicio;


  System.out.println(
          "-----------------------------------------"
  );

  System.out.println(
          "HOME COMPLETO: "
                  + tiempoTotal
                  + " ms"
  );

  System.out.println(
          "========================================="
  );

  System.out.println(
          "===== FIN HOME ====="
  );

  System.out.println(
          "========================================="
  );


  // =====================================
  // MOSTRAR PÁGINA PRINCIPAL
  // =====================================

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


  // =====================================
  // BUSCAR SEMANA POR ID
  // =====================================

  Optional<Semana> semanaEncontrada =
          semanaRepository
                  .findById(id);


  // =====================================
  // SI LA SEMANA NO EXISTE
  // =====================================

  if (semanaEncontrada.isEmpty()) {

   return "redirect:/#semanas";

  }


  // =====================================
  // ENVIAR SEMANA A LA VISTA
  // =====================================

  model.addAttribute(
          "semana",
          semanaEncontrada.get()
  );


  // =====================================
  // OBTENER TRABAJOS DE LA SEMANA
  // =====================================

  model.addAttribute(
          "trabajos",
          trabajoRepository
                  .findBySemanaIdOrderByIdAsc(id)
  );


  // =====================================
  // MOSTRAR DETALLE
  // =====================================

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
          trabajoRepository
                  .findById(id);


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

  if (
          trabajo.getArchivo() == null
                  ||
                  trabajo.getArchivo().isBlank()
  ) {

   return ResponseEntity
           .notFound()
           .build();

  }


  // =====================================
  // OBTENER ARCHIVO DESDE CLOUDINARY
  // =====================================

  HttpClient cliente =
          HttpClient
                  .newHttpClient();


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
                  HttpResponse
                          .BodyHandlers
                          .ofByteArray()
          );


  // =====================================
  // VERIFICAR RESPUESTA DE CLOUDINARY
  // =====================================

  if (
          respuesta.statusCode() < 200
                  ||
                  respuesta.statusCode() >= 300
  ) {

   return ResponseEntity
           .status(
                   respuesta.statusCode()
           )
           .build();

  }


  // =====================================
  // NOMBRE DEL ARCHIVO
  // =====================================

  String nombreArchivo =
          trabajo
                  .getNombreArchivo();


  if (
          nombreArchivo == null
                  ||
                  nombreArchivo.isBlank()
  ) {

   nombreArchivo =
           "trabajo-"
                   + trabajo.getId();

  }


  // =====================================
  // TIPO DEL ARCHIVO
  // =====================================

  MediaType tipoContenido =
          MediaType
                  .APPLICATION_OCTET_STREAM;


  if (
          trabajo.getTipoArchivo() != null
                  &&
                  !trabajo.getTipoArchivo().isBlank()
  ) {

   try {


    tipoContenido =
            MediaType
                    .parseMediaType(
                            trabajo
                                    .getTipoArchivo()
                    );


   } catch (Exception ignored) {


    tipoContenido =
            MediaType
                    .APPLICATION_OCTET_STREAM;


   }

  }


  // =====================================
  // PREPARAR ARCHIVO
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