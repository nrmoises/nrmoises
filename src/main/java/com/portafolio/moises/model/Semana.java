package com.portafolio.moises.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "semanas")
public class Semana {

 // =========================================
 // ATRIBUTOS
 // =========================================

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;


 @Column(
         nullable = false,
         unique = true
 )
 private Integer numero;


 @Column(
         nullable = false,
         length = 150
 )
 private String titulo;


 @Column(length = 1200)
 private String descripcion;


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
 // NÚMERO DE SEMANA
 // =========================================

 public Integer getNumero() {

  return numero;
 }


 public void setNumero(
         Integer numero
 ) {

  this.numero = numero;
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
}