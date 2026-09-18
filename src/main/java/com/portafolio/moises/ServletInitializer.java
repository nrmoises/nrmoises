package com.portafolio.moises;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer
		extends SpringBootServletInitializer {

	// =========================================
	// CONFIGURACIÓN PARA DESPLIEGUE WAR
	// =========================================

	@Override
	protected SpringApplicationBuilder configure(
			SpringApplicationBuilder application
	) {

		return application.sources(
				MoisesApplication.class
		);
	}
}