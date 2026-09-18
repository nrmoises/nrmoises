package com.portafolio.moises.repository;

import com.portafolio.moises.model.Proyecto;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProyectoRepository
        extends JpaRepository<Proyecto, Long> {

}