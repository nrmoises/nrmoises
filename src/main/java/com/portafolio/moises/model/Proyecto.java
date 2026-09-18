package com.portafolio.moises.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "proyectos")
public class Proyecto {

 // =========================================
 // ATRIBUTOS
 // =========================================

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;


 @Column(nullable = false)
 private String titulo;


 @Column(length = 1800)
 private String descripcion;


 private String url;

 private String imagen;


 @Column(length = 500)
 private String tecnologias;


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
 // TÍTULO
 // =========================================

 public String getTitulo() {

  return titulo;
 }


 public void setTitulo(
         String titulo
 ) {

  this.titulo = titulo;
 }


 // =========================================
 // DESCRIPCIÓN
 // =========================================

 public String getDescripcion() {

  return descripcion;
 }


 public void setDescripcion(
         String descripcion
 ) {

  this.descripcion = descripcion;
 }


 // =========================================
 // URL
 // =========================================

 public String getUrl() {

  return url;
 }


 public void setUrl(
         String url
 ) {

  this.url = url;
 }


 // =========================================
 // IMAGEN
 // =========================================

 public String getImagen() {

  return imagen;
 }


 public void setImagen(
         String imagen
 ) {

  this.imagen = imagen;
 }


 // =========================================
 // TECNOLOGÍAS
 // =========================================

 public String getTecnologias() {

  return tecnologias;
 }


 public void setTecnologias(
         String tecnologias
 ) {

  this.tecnologias = tecnologias;
 }
}