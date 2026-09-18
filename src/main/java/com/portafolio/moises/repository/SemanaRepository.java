package com.portafolio.moises.repository;

import com.portafolio.moises.model.Semana;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SemanaRepository
        extends JpaRepository<Semana, Long> {

    // =========================================
    // OBTENER SEMANAS ORDENADAS POR NÚMERO
    // =========================================

    List<Semana> findAllByOrderByNumeroAsc();
}