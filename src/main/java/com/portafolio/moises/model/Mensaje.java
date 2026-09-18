package com.portafolio.moises.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "mensajes")
public class Mensaje {

 // =========================================
 // ATRIBUTOS
 // =========================================

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;


 @Column(nullable = false)
 private String nombre;


 @Column(nullable = false)
 private String correo;


 @Column(nullable = false)
 private String asunto;


 @Column(
         nullable = false,
         length = 3500
 )
 private String mensaje;


 private boolean leido = false;


 private LocalDateTime fecha =
         LocalDateTime.now();


 // =========================================
 // ID
 // =========================================

 public Long getId() {

  return id;
 }


 public void setId(
         Long id
 ) {

  this.id = id;
 }


 // =========================================
 // NOMBRE
 // =========================================

 public String getNombre() {

  return nombre;
 }


 public void setNombre(
         String nombre
 ) {

  this.nombre = nombre;
 }


 // =========================================
 // CORREO
 // =========================================

 public String getCorreo() {

  return correo;
 }


 public void setCorreo(
         String correo
 ) {

  this.correo = correo;
 }


 // =========================================
 // ASUNTO
 // =========================================

 public String getAsunto() {

  return asunto;
 }


 public void setAsunto(
         String asunto
 ) {

  this.asunto = asunto;
 }


 // =========================================
 // MENSAJE
 // =========================================

 public String getMensaje() {

  return mensaje;
 }


 public void setMensaje(
         String mensaje
 ) {

  this.mensaje = mensaje;
 }


 // =========================================
 // ESTADO DE LECTURA
 // =========================================

 public boolean isLeido() {

  return leido;
 }


 public void setLeido(
         boolean leido
 ) {

  this.leido = leido;
 }


 // =========================================
 // FECHA
 // =========================================

 public LocalDateTime getFecha() {

  return fecha;
 }


 public void setFecha(
         LocalDateTime fecha
 ) {

  this.fecha = fecha;
 }
}