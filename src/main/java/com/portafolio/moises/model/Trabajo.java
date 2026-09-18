package com.portafolio.moises.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "trabajos")
public class Trabajo {

 // =========================================
 // ATRIBUTOS
 // =========================================

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;


 @Column(
         nullable = false,
         length = 180
 )
 private String titulo;


 @Column(length = 2500)
 private String descripcion;


 private String archivo;


 private String imagen;


 @Column(name = "tipo_archivo")
 private String tipoArchivo;


 @Column(
         name = "nombre_archivo",
         length = 255
 )
 private String nombreArchivo;


 // =========================================
 // RELACIÓN CON SEMANA
 // =========================================

 @ManyToOne(fetch = FetchType.LAZY)
 @JoinColumn(
         name = "semana_id",
         nullable = false
 )
 private Semana semana;


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
 // ARCHIVO
 // =========================================

 public String getArchivo() {

  return archivo;
 }


 public void setArchivo(
         String archivo
 ) {

  this.archivo = archivo;
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
 // TIPO DE ARCHIVO
 // =========================================

 public String getTipoArchivo() {

  return tipoArchivo;
 }


 public void setTipoArchivo(
         String tipoArchivo
 ) {

  this.tipoArchivo = tipoArchivo;
 }


 // =========================================
 // NOMBRE ORIGINAL DEL ARCHIVO
 // =========================================

 public String getNombreArchivo() {

  return nombreArchivo;
 }


 public void setNombreArchivo(
         String nombreArchivo
 ) {

  this.nombreArchivo = nombreArchivo;
 }


 // =========================================
 // SEMANA
 // =========================================

 public Semana getSemana() {

  return semana;
 }


 public void setSemana(
         Semana semana
 ) {

  this.semana = semana;
 }
}