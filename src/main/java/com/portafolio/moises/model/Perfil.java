package com.portafolio.moises.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "perfil")
public class Perfil {

 // =========================================
 // ATRIBUTOS
 // =========================================

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;


 private String nombre;

 private String carrera;

 private String institucion;

 private String ciudad;

 private String foto;

 private String correo;

 private String github;

 private String linkedin;


 @Column(length = 2500)
 private String descripcion;


 @Column(length = 1200)
 private String habilidades;


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
 // CARRERA
 // =========================================

 public String getCarrera() {

  return carrera;
 }


 public void setCarrera(
         String carrera
 ) {

  this.carrera = carrera;
 }


 // =========================================
 // INSTITUCIÓN
 // =========================================

 public String getInstitucion() {

  return institucion;
 }


 public void setInstitucion(
         String institucion
 ) {

  this.institucion = institucion;
 }


 // =========================================
 // CIUDAD
 // =========================================

 public String getCiudad() {

  return ciudad;
 }


 public void setCiudad(
         String ciudad
 ) {

  this.ciudad = ciudad;
 }


 // =========================================
 // FOTO
 // =========================================

 public String getFoto() {

  return foto;
 }


 public void setFoto(
         String foto
 ) {

  this.foto = foto;
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
 // GITHUB
 // =========================================

 public String getGithub() {

  return github;
 }


 public void setGithub(
         String github
 ) {

  this.github = github;
 }


 // =========================================
 // LINKEDIN
 // =========================================

 public String getLinkedin() {

  return linkedin;
 }


 public void setLinkedin(
         String linkedin
 ) {

  this.linkedin = linkedin;
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
 // HABILIDADES
 // =========================================

 public String getHabilidades() {

  return habilidades;
 }


 public void setHabilidades(
         String habilidades
 ) {

  this.habilidades = habilidades;
 }
}