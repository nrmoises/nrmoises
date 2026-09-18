package com.portafolio.moises.controller;

import com.portafolio.moises.model.Mensaje;
import com.portafolio.moises.repository.MensajeRepository;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContactoController {

 private final MensajeRepository mensajeRepository;


 public ContactoController(
         MensajeRepository mensajeRepository
 ) {
  this.mensajeRepository = mensajeRepository;
 }


 // =========================================
 // GUARDAR MENSAJE DE CONTACTO
 // =========================================

 @PostMapping("/contacto/enviar")
 public String enviarMensaje(
         @RequestParam String nombre,
         @RequestParam String correo,
         @RequestParam String asunto,
         @RequestParam String mensaje
 ) {

  // Crear nuevo mensaje
  Mensaje nuevoMensaje = new Mensaje();


  // Asignar los datos recibidos del formulario
  nuevoMensaje.setNombre(nombre);

  nuevoMensaje.setCorreo(correo);

  nuevoMensaje.setAsunto(asunto);

  nuevoMensaje.setMensaje(mensaje);


  // Guardar mensaje en la base de datos
  mensajeRepository.save(
          nuevoMensaje
  );


  // Regresar a la sección de contacto
  return "redirect:/?mensaje=ok#contacto";
 }
}