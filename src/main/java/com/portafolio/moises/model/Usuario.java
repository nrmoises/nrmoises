package com.portafolio.moises.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "usuarios")
public class Usuario {

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;


 @Column(
         nullable = false,
         unique = true
 )
 private String usuario;


 @Column(nullable = false)
 private String password;


 private String nombre;


 private boolean activo = true;


 // ADMIN = puede administrar
 // USER = solo puede visualizar
 @Column(nullable = false)
 private String rol = "USER";


 // =========================================
 // ID
 // =========================================

 public Long getId() {
  return id;
 }

 public void setId(Long id) {
  this.id = id;
 }


 // =========================================
 // USUARIO
 // =========================================

 public String getUsuario() {
  return usuario;
 }

 public void setUsuario(String usuario) {
  this.usuario = usuario;
 }


 // =========================================
 // CONTRASEÑA
 // =========================================

 public String getPassword() {
  return password;
 }

 public void setPassword(String password) {
  this.password = password;
 }


 // =========================================
 // NOMBRE
 // =========================================

 public String getNombre() {
  return nombre;
 }

 public void setNombre(String nombre) {
  this.nombre = nombre;
 }


 // =========================================
 // ESTADO
 // =========================================

 public boolean isActivo() {
  return activo;
 }

 public void setActivo(boolean activo) {
  this.activo = activo;
 }


 // =========================================
 // ROL
 // =========================================

 public String getRol() {
  return rol;
 }

 public void setRol(String rol) {
  this.rol = rol;
 }
}