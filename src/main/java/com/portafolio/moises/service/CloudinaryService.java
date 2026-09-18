package com.portafolio.moises.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;
import java.util.UUID;

@Service
public class CloudinaryService {

    private final Cloudinary cloudinary;

    public CloudinaryService(Cloudinary cloudinary) {
        this.cloudinary = cloudinary;
    }


    // =========================================
    // SUBIR CUALQUIER ARCHIVO
    // PDF, WORD, IMÁGENES, ETC.
    // =========================================

    public String subirArchivo(
            MultipartFile archivo,
            String carpeta
    ) throws Exception {

        if (archivo == null || archivo.isEmpty()) {
            return null;
        }

        String nombreUnico =
                UUID.randomUUID().toString();

        Map<?, ?> resultado =
                cloudinary
                        .uploader()
                        .upload(
                                archivo.getBytes(),
                                ObjectUtils.asMap(
                                        "folder", "nrmoises/" + carpeta,
                                        "public_id", nombreUnico,
                                        "resource_type", "auto",
                                        "use_filename", false,
                                        "unique_filename", true
                                )
                        );

        Object secureUrl =
                resultado.get("secure_url");

        if (secureUrl == null) {

            throw new RuntimeException(
                    "Cloudinary no devolvió la URL del archivo."
            );
        }

        return secureUrl.toString();
    }


    // =========================================
    // SUBIR IMÁGENES
    // =========================================

    public String subirImagen(
            MultipartFile imagen,
            String carpeta
    ) throws Exception {

        if (imagen == null || imagen.isEmpty()) {
            return null;
        }

        String nombreUnico =
                UUID.randomUUID().toString();

        Map<?, ?> resultado =
                cloudinary
                        .uploader()
                        .upload(
                                imagen.getBytes(),
                                ObjectUtils.asMap(
                                        "folder", "nrmoises/" + carpeta,
                                        "public_id", nombreUnico,
                                        "resource_type", "image",
                                        "use_filename", false,
                                        "unique_filename", true
                                )
                        );

        Object secureUrl =
                resultado.get("secure_url");

        if (secureUrl == null) {

            throw new RuntimeException(
                    "Cloudinary no devolvió la URL de la imagen."
            );
        }

        return secureUrl.toString();
    }
}