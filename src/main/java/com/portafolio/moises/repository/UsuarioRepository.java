package com.portafolio.moises.repository;

import com.portafolio.moises.model.Usuario;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UsuarioRepository
        extends JpaRepository<Usuario, Long> {

    // Buscar usuario activo para iniciar sesión
    Optional<Usuario> findByUsuarioAndActivoTrue(
            String usuario
    );

    // Comprobar si un nombre de usuario ya existe
    boolean existsByUsuario(
            String usuario
    );
}