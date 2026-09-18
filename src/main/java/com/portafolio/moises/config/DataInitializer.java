package com.portafolio.moises.config;

import com.portafolio.moises.model.Perfil;
import com.portafolio.moises.model.Semana;
import com.portafolio.moises.model.Usuario;

import com.portafolio.moises.repository.PerfilRepository;
import com.portafolio.moises.repository.SemanaRepository;
import com.portafolio.moises.repository.UsuarioRepository;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class DataInitializer implements CommandLineRunner {

 private final SemanaRepository semanaRepository;
 private final PerfilRepository perfilRepository;
 private final UsuarioRepository usuarioRepository;


 public DataInitializer(
         SemanaRepository semanaRepository,
         PerfilRepository perfilRepository,
         UsuarioRepository usuarioRepository
 ) {
  this.semanaRepository = semanaRepository;
  this.perfilRepository = perfilRepository;
  this.usuarioRepository = usuarioRepository;
 }


 @Override
 public void run(String... args) {

  crearSemanas();

  crearPerfil();

  crearUsuarioAdministrador();
 }


 // =========================================
 // CREAR LAS 16 SEMANAS
 // =========================================

 private void crearSemanas() {

  if (semanaRepository.count() == 0) {

   for (int i = 1; i <= 16; i++) {

    Semana semana = new Semana();

    semana.setNumero(i);

    semana.setTitulo(
            "Semana " + i
    );

    semana.setDescripcion(
            "Actividades, prácticas y evidencias académicas " +
                    "desarrolladas durante la semana " + i + "."
    );

    semanaRepository.save(semana);
   }
  }
 }


 // =========================================
 // CREAR PERFIL
 // =========================================

 private void crearPerfil() {

  if (perfilRepository.count() == 0) {

   Perfil perfil = new Perfil();

   perfil.setNombre(
           "Molina Crispín Moisés"
   );

   perfil.setCarrera(
           "Diseño y Programación Web"
   );

   perfil.setInstitucion(
           "I.E.S.T.P. Andrés Avelino Cáceres Dorregaray"
   );

   perfil.setCiudad(
           "Huancayo - Junín"
   );

   perfil.setDescripcion(
           "Estudiante de Diseño y Programación Web " +
                   "enfocado en crear experiencias digitales " +
                   "modernas, funcionales y atractivas."
   );

   perfil.setHabilidades(
           "Java · Spring Boot · MySQL · JSP · HTML · CSS · " +
                   "JavaScript · PHP · FlutterFlow · WordPress"
   );

   perfilRepository.save(perfil);
  }
 }


 // =========================================
 // CREAR O ACTUALIZAR ADMINISTRADOR
 // =========================================

 private void crearUsuarioAdministrador() {

  Optional<Usuario> usuarioExistente =
          usuarioRepository.findByUsuarioAndActivoTrue("admin");


  // =====================================
  // SI ADMIN YA EXISTE
  // =====================================

  if (usuarioExistente.isPresent()) {

   Usuario administrador =
           usuarioExistente.get();

   administrador.setRol(
           "ADMIN"
   );

   administrador.setActivo(
           true
   );

   usuarioRepository.save(
           administrador
   );

   return;
  }


  // =====================================
  // SI ADMIN NO EXISTE
  // =====================================

  Usuario administrador =
          new Usuario();

  administrador.setUsuario(
          "admin"
  );

  administrador.setPassword(
          new BCryptPasswordEncoder()
                  .encode("moises123")
  );

  administrador.setNombre(
          "Moisés Molina"
  );

  administrador.setActivo(
          true
  );

  administrador.setRol(
          "ADMIN"
  );

  usuarioRepository.save(
          administrador
  );
 }
}