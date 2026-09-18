package com.portafolio.moises.repository;

import com.portafolio.moises.model.Mensaje;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MensajeRepository
        extends JpaRepository<Mensaje, Long> {

    // =========================================
    // OBTENER MENSAJES ORDENADOS POR FECHA
    // =========================================

    List<Mensaje> findAllByOrderByFechaDesc();


    // =========================================
    // CONTAR MENSAJES NO LEÍDOS
    // =========================================

    long countByLeidoFalse();
}