package com.portafolio.moises.repository;

import com.portafolio.moises.model.Trabajo;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TrabajoRepository
        extends JpaRepository<Trabajo, Long> {

    // =========================================
    // OBTENER TRABAJOS DE UNA SEMANA
    // DEL MÁS ANTIGUO AL MÁS NUEVO
    // =========================================

    List<Trabajo> findBySemanaIdOrderByIdAsc(
            Long semanaId
    );


    // =========================================
    // CONTAR TRABAJOS DE UNA SEMANA
    // =========================================

    long countBySemanaId(
            Long semanaId
    );
}