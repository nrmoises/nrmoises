package com.portafolio.moises.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

 private final AdminInterceptor adminInterceptor;


 // =========================================
 // CONSTRUCTOR
 // =========================================

 public WebConfig(
         AdminInterceptor adminInterceptor
 ) {

  this.adminInterceptor =
          adminInterceptor;
 }


 // =========================================
 // PROTEGER PANEL ADMINISTRATIVO
 // =========================================

 @Override
 public void addInterceptors(
         InterceptorRegistry registry
 ) {

  registry
          .addInterceptor(adminInterceptor)
          .addPathPatterns("/admin/**");
 }
}