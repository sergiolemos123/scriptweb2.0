CREATE DATABASE IF NOT EXISTS `scriptwebDB`;
USE `scriptwebDB`;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`id_users` 	INT(12) unsigned NOT NULL AUTO_INCREMENT,
	`cod_tipo_users` INT(5) unsigned NOT NULL,
	`cod_area_formacion` INT(5) unsigned NULL,
	`cod_area_conocimiento` INT(5) unsigned NULL,
	`nombre_users` VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`genero_users` VARCHAR(1) COLLATE utf8_spanish_ci NOT NULL,
	`anio_nac_users` INT(4) unsigned NOT NULL,
	`mes_nac_users` INT(2) unsigned NOT NULL,
	`dia_nac_users` INT(2) unsigned NOT NULL,
	`documento_users` VARCHAR(12) COLLATE utf8_spanish_ci NOT NULL,	
	`cod_tipo_documento` INT(5) unsigned NOT NULL,
	`correo_users` VARCHAR(60) COLLATE utf8_spanish_ci NOT NULL,
	`pass_users` VARCHAR(128) COLLATE utf8_spanish_ci NOT NULL,
	`salt_users` VARCHAR(128) COLLATE utf8_spanish_ci NOT NULL,
	`confirmar_users` VARCHAR(128) COLLATE utf8_spanish_ci NOT NULL,
	`celular_users` VARCHAR(16) COLLATE utf8_spanish_ci NOT NULL,
	`telefono_users` VARCHAR(10) COLLATE utf8_spanish_ci NULL,
	`cod_pais` INT(5) unsigned NOT NULL,
	`cod_departamento` INT(5) unsigned NULL,
	`cod_ciudad` INT(5) unsigned NULL,
	`cod_comuna` INT(5) unsigned NULL,
	`cod_barrio` INT(5) unsigned NULL,
	`cod_corregimiento` INT(5) unsigned NULL,
	`cod_vereda` INT(5) unsigned NULL,
	`direccion_users` VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`id_users`),
	KEY `fkcodtipousersus_tipousuario_idx` (`cod_tipo_users`),
	KEY `fkcodtipodocumentous_tipodocumento_idx` (`cod_tipo_documento`),
	KEY `fkcodpaisus_pais_idx` (`cod_pais`),
	KEY `fkcodareaformacionus_areaformacion_idx` (`cod_area_formacion`),
	KEY `fkcodareaconocimientous_areaconocimiento_idx` (`cod_area_conocimiento`),
	CONSTRAINT `fkcodtipousersus_tipousuario` FOREIGN KEY(`cod_tipo_users`) REFERENCES `tipo_usuario` (`cod_tipo_users`) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT `fkcodtipodocumentous_tipodocumento` FOREIGN KEY(`cod_tipo_documento`) REFERENCES `tipo_documento` (`cod_tipo_documento`) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT `fkcodpaisus_pais` FOREIGN KEY(`cod_pais`) REFERENCES `pais` (`cod_pais`) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT `fkcodareaformacionus_areaformacion` FOREIGN KEY(`cod_area_formacion`) REFERENCES `area_formacion` (`cod_area_formacion`) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT `fkcodareaconocimientous_areaconocimiento` FOREIGN KEY(`cod_area_conocimiento`) REFERENCES `area_conocimiento` (`cod_area_conocimiento`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario`(
	`cod_tipo_users` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_tipo_users` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_tipo_users`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento`(
	`cod_tipo_documento` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_tipo_documento` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais`(
	`cod_pais` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_pais` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`postal_pais` VARCHAR(5) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento`(
	`cod_departamento` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_pais` INT(5) NOT NULL,
	`nombre_departamento` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_departamento`)	
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad`(
	`cod_ciudad` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_departamento` INT(5) NOT NULL,
	`nombre_ciudad` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `comuna`;
CREATE TABLE `comuna`(
	`cod_comuna` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_ciudad` INT(5) NOT NULL,
	`nombre_comuna` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_comuna`)	
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `corregimiento`;
CREATE TABLE `corregimiento`(
	`cod_corregimiento` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_ciudad` INT(5) NOT NULL,
	`nombre_corregimiento` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_corregimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `vereda`;
CREATE TABLE `vereda`(
	`cod_vereda` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_corregimiento` INT(5) NOT NULL,
	`nombre_vereda` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_vereda`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `barrio`;
CREATE TABLE `barrio`(
	`cod_barrio` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_corregimiento` INT(5) NOT NULL,
	`cod_comuna` INT(5) NOT NULL,
	`nombre_barrio` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `ciudad_comuna`;
CREATE TABLE `ciudad_comuna`(
	`cod_ciudad_comuna` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_ciudad` INT(5) unsigned NULL,
	`cod_comuna` INT(5) unsigned NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_ciudad_comuna`),
	KEY `fkcodciudadcc_ciudad_idx` (`cod_ciudad`),
	KEY `fkcodcomunacc_comuna_idx` (`cod_comuna`),
	CONSTRAINT `fkcodciudadcc_ciudad` FOREIGN KEY(`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT `fkcodcomunacc_comuna` FOREIGN KEY(`cod_comuna`) REFERENCES `comuna` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE `proyecto`(
	`cod_proyecto` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_proyecto` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`cod_categorias_proyecto` VARCHAR(5) COLLATE utf8_spanish_ci NOT NULL,
	`cod_estado_proyecto` VARCHAR(5) COLLATE utf8_spanish_ci NOT NULL,
	`cod_descripcion_proyecto` INT(5) unsigned NOT NULL,
	`progreso_proyecto` VARCHAR(5) COLLATE utf8_spanish_ci NOT NULL,
	`cod_fases_proyecto` INT(2) unsigned NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_proyecto`),
	KEY `fkcodfasesproyectopro_fases_idx` (`cod_fases_proyecto`),
	KEY `fkcodestadoproyectopro_estado_idx` (`cod_estado_proyecto`),
	KEY `fkcodcategoriasproyectopro_categoriasproyecto_idx` (`cod_categorias_proyecto`),
	KEY `fkcoddescripcionproyectopro_descripcionproyecto_idx` (`cod_descripcion_proyecto`),
	CONSTRAINT `fkcodfasesproyectopro_fases` FOREIGN KEY(`cod_fases_proyecto`) REFERENCES `fases` (`cod_fases_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT `fkcodestadoproyectopro_estado` FOREIGN KEY(`cod_estado_proyecto`) REFERENCES `estado` (`cod_estado_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT `fkcodcategoriasproyectopro_categoriasproyecto` FOREIGN KEY(`cod_categorias_proyecto`) REFERENCES `categorias_proyecto` (`cod_categorias_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT `fkcoddescripcionproyectopro_descripcionproyecto` FOREIGN KEY(`cod_descripcion_proyecto`) REFERENCES `descripcion_proyecto` (`cod_descripcion_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `fases`;
CREATE TABLE `fases`(
	`cod_fases_proyecto` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_fases` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`tiempo_fase` VARCHAR(5) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_fases_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado`(
	`cod_estado_proyecto` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_estado` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_estado_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes`(
	`cod_imagen` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_imagen` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`id_users` INT(12) NOT NULL,
	`cod_proyecto` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_imagen`)
	KEY `fkidusersim_users_idx` (`id_users`),
	CONSTRAINT `fkidusersim_users` FOREIGN KEY(`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE NO ACTION,
	KEY `fkcodproyectoim_proyecto_idx` (`cod_proyecto`),
	CONSTRAINT `fkcodproyectoim_proyecto` FOREIGN KEY(`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `categorias_proyecto`;
CREATE TABLE `categorias_proyecto`(
	`cod_categorias_proyecto` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_categorias_proyecto` VARCHAR(60) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_categorias_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `generar_ideas`;
CREATE TABLE `generar_ideas`(
	`cod_generar_ideas` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_generar_ideas` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`cod_categorias_proyecto` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_generar_ideas`),
	KEY `fkcodcategoriasproyectoge_categoriasproyecto_idx` (`cod_categorias_proyecto`),
	CONSTRAINT `fkcodcategoriasproyectoge_categoriasproyecto` FOREIGN KEY(`cod_categorias_proyecto`) REFERENCES `categorias_proyecto` (`cod_categorias_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `clases`;
CREATE TABLE `clases`(
	`cod_clases` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_categorias_clases` INT(5) NOT NULL,
	`nombre_clase` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_clases`),
	KEY `fkcodcategoriasclasescla_categoriasclases_idx` (`cod_categorias_clases`),
	CONSTRAINT `fkcodcategoriasclasescla_categoriasclases` FOREIGN KEY(`cod_categorias_clases`) REFERENCES `cod_categorias_clases` (`cod_categorias_clases`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `foro`;
CREATE TABLE `foro`(
	`cod_foro` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_foro` VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
	`cod_categorias_proyecto` INT(5) NOT NULL,
	`cod_proyecto` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_foro`)
	KEY `fkcodcategoriasproyectofo_categoriasproyecto_idx` (`cod_categorias_proyecto`),
	CONSTRAINT `fkcodcategoriasproyectofo_categoriasproyecto` FOREIGN KEY(`cod_categorias_proyecto`) REFERENCES `categorias_proyecto` (`cod_categorias_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
	KEY `fkcodproyectofo_proyecto_idx` (`cod_proyecto`),
	CONSTRAINT `fkcodproyectofo_proyecto` FOREIGN KEY(`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `subdominios`;
CREATE TABLE `subdominios`(
	`cod_subdominio` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`url_subdominio` LONG(500) NOT NULL,
	`cod_proyecto` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_subdominio`)
	KEY `fkcodproyectosub_proyecto_idx` (`cod_proyecto`),
	CONSTRAINT `fkcodproyectosub_proyecto` FOREIGN KEY(`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes`(
	`cod_proyecto_users` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`id_users` INT(12) NOT NULL,
	`cod_proyecto` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_proyecto_users`)
	KEY `fkidusers_users_idx` (`id_users`),
	CONSTRAINT `fkidusers_users` FOREIGN KEY(`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE NO ACTION,
	KEY `fkcodproyecto_proyecto_idx` (`cod_proyecto`),
	CONSTRAINT `fkcodproyecto_proyecto` FOREIGN KEY(`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `categorias_definiciones`;
CREATE TABLE `categorias_definiciones`(
	`cod_categorias_definiciones` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_categorias_definiciones` VARCHAR(60) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_categorias_definiciones`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `definiciones`;
CREATE TABLE `definiciones`(
	`cod_definiciones` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_definiciones` VARCHAR(60) COLLATE utf8_spanish_ci NOT NULL,
	`cod_categorias_definiciones` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_definiciones`)
	KEY `fkcodcategoriasdefinicionesde_categoriasdefiniciones_idx` (`cod_categorias_definiciones`),
	CONSTRAINT `fkcodcategoriasdefinicionesde_categoriasdefiniciones` FOREIGN KEY(`cod_categorias_definiciones`) REFERENCES `categorias_definiciones` (`cod_categorias_definiciones`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `terminos`;
CREATE TABLE `terminos`(
	`cod_terminos` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_terminos` VARCHAR(60) COLLATE utf8_spanish_ci NOT NULL,
	`cod_definiciones` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_terminos`)
	KEY `fkcoddefinicioneste_definiciones_idx` (`cod_definiciones`),
	CONSTRAINT `fkcoddefinicioneste_definiciones` FOREIGN KEY(`cod_definiciones`) REFERENCES `definiciones` (`cod_definiciones`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `descripcion_proyecto`;
CREATE TABLE `descripcion_proyecto`(
	`cod_descripcion_proyecto` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_descripcion_proyecto` VARCHAR(200) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_descripcion_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `categorias_clases`;
CREATE TABLE `categorias_clases`(
	`cod_categorias_clases` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_categorias_clases` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_categorias_clases`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `area_formacion`;
CREATE TABLE `area_formacion`(
	`cod_area_formacion` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_area_formacion` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_area_formacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `area_conocimiento`;
CREATE TABLE `area_conocimiento`(
	`cod_area_conocimiento` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_area_conocimiento` VARCHAR(30) COLLATE utf8_spanish_ci NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_area_conocimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `proyecto_clases`;
CREATE TABLE `proyecto_clases`(
	`cod_proyecto_clases` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`cod_proyecto` INT(5) NOT NULL,
	`cod_clases` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_proyecto_clases`),
	KEY `fkcodproyectoprocla_proyecto_idx` (`cod_proyecto`),
	CONSTRAINT `fkcodproyectoprocla_proyecto` FOREIGN KEY(`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
	KEY `fkcodclasesprocla_clases_idx` (`cod_clases`),
	CONSTRAINT `fkcodclasesprocla_clases` FOREIGN KEY(`cod_clases`) REFERENCES `clases` (`cod_clases`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `preguntas_foro`;
CREATE TABLE `preguntas_foro`(
	`cod_preguntas_foro` INT(5) unsigned NOT NULL AUTO_INCREMENT,
	`detalle_preguntas_foro` LONG(500) NOT NULL,
	`cod_foro` INT(5) NOT NULL,
	`id_users` INT(12) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY(`cod_preguntas_foro`),
	KEY `fkcodforoprefo_foro_idx` (`cod_foro`),
	CONSTRAINT `fkcodforoprefo_foro` FOREIGN KEY(`cod_foro`) REFERENCES `foro` (`cod_foro`) ON DELETE CASCADE ON UPDATE NO ACTION,
	KEY `fkidusersprefo_users_idx` (`id_users`),
	CONSTRAINT `fkidusersprefo_users` FOREIGN KEY(`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;