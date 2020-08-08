CREATE TABLE aseguradora (
  idAseguradora     int(10) NOT NULL AUTO_INCREMENT, 
  nombreAseguradora varchar(45), 
  descripcion       text, 
  PRIMARY KEY (idAseguradora));
CREATE TABLE catalogo_servicios (
  idServicio     int(10) NOT NULL AUTO_INCREMENT, 
  nombreServicio varchar(60), 
  descripcion    text, 
  PRIMARY KEY (idServicio));
CREATE TABLE empleado (
  idEmpleado      int(10) NOT NULL AUTO_INCREMENT, 
  nombre          varchar(40) NOT NULL, 
  usuario         varchar(20) NOT NULL, 
  correo          varchar(65) NOT NULL, 
  password        varchar(60) NOT NULL, 
  telefono        varchar(15), 
  celular         varchar(15), 
  direccion       varchar(254), 
  sexo            char(1), 
  area            varchar(45), 
  puesto          varchar(80) NOT NULL, 
  privilegio      varchar(20) NOT NULL, 
  fechaNacimiento date, 
  fotoURL         varchar(100) DEFAULT 'https://res.cloudinary.com/danojan/image/upload/v1587861554/default_esupw5.png', 
  fotoID          varchar(60), 
  admRol          tinyint(3) DEFAULT 0, 
  jcvRol          tinyint(3) DEFAULT 0, 
  perRol          tinyint(3) DEFAULT 0, 
  resRol          tinyint(3) DEFAULT 0, 
  prohibido       varchar(10) DEFAULT 'Bloquear', 
  adeudo          double, 
  PRIMARY KEY (idEmpleado)) comment='		';
CREATE TABLE empleado_resguardante (
  idResguardante   int(10) NOT NULL, 
  licencia         varchar(45), 
  licenciaAnterior varchar(45), 
  tipoLicencia     varchar(15), 
  nombreJefe       varchar(40), 
  razon            text, 
  PRIMARY KEY (idResguardante));
CREATE TABLE foto (
  idFoto   int(10) NOT NULL AUTO_INCREMENT, 
  fotoURL  varchar(100), 
  fotoID   varchar(60), 
  fotoPath varchar(254), 
  PRIMARY KEY (idFoto));
CREATE TABLE lista_fotos (
  idFoto      int(10) NOT NULL, 
  idSiniestro int(10) NOT NULL);
CREATE TABLE lista_servicios (
  idListaServicios int(10) NOT NULL AUTO_INCREMENT, 
  idProveedor      int(10), 
  numServicios     int(10), 
  servicio7        varchar(100), 
  servicio6        varchar(100), 
  servicio5        varchar(100), 
  servicio4        varchar(100), 
  servicio3        varchar(100), 
  servicio2        varchar(100), 
  servicio1        varchar(100), 
  servicio0        varchar(100), 
  PRIMARY KEY (idListaServicios));
CREATE TABLE notifications (
  idNotification int(10) NOT NULL AUTO_INCREMENT, 
  tittle         varchar(40) NOT NULL, 
  message        varchar(254) NOT NULL, 
  `date`         datetime(19) NOT NULL, 
  idEmpleado     int(10), 
  PRIMARY KEY (idNotification));
CREATE TABLE orden_servicio (
  idOrden          int(10) NOT NULL AUTO_INCREMENT, 
  idSolicitud      int(10) NOT NULL, 
  idListaServicios int(10), 
  fechaOrden       datetime(19) NULL, 
  idProveedor      int(10), 
  PRIMARY KEY (idOrden));
CREATE TABLE poliza (
  idPoliza      int(10) NOT NULL AUTO_INCREMENT, 
  idAseguradora int(10) DEFAULT 1 NOT NULL, 
  idVehiculo    int(10), 
  nombreArchivo varchar(100), 
  pathArchivo   varchar(254), 
  fechaSubida   datetime(19) NULL, 
  estado        varchar(10) DEFAULT 'Vigente', 
  observacion   text, 
  PRIMARY KEY (idPoliza));
CREATE TABLE proveedor (
  idProveedor     int(10) NOT NULL AUTO_INCREMENT, 
  nombreComercial varchar(100) NOT NULL, 
  razonSocial     varchar(254) NOT NULL, 
  domicilioFiscal varchar(254) NOT NULL, 
  RFC             varchar(45), 
  padron          varchar(45), 
  PRIMARY KEY (idProveedor));
CREATE TABLE resguardo (
  idResguardo          int(10) NOT NULL AUTO_INCREMENT, 
  idVehiculo           int(10), 
  idResguardante       int(10), 
  unidadResponsable    varchar(100), 
  unidadEjecutora      varchar(100), 
  areaResguardo        varchar(100), 
  fechaResguardo       datetime(19) NULL, 
  estadoResguardo      varchar(45) DEFAULT 'Activo', 
  observacionResguardo text, 
  PRIMARY KEY (idResguardo));
CREATE TABLE resolucion_siniestro (
  idResolucion int(10) NOT NULL AUTO_INCREMENT, 
  idSiniestro  int(10), 
  descripcion  text, 
  estado       varchar(85), 
  documentoURL varchar(254), 
  PRIMARY KEY (idResolucion));
CREATE TABLE resolucion_solicitud (
  idResolucionSolicitud int(10) NOT NULL AUTO_INCREMENT, 
  idOrden               int(10), 
  idResguardante        int(10), 
  nombreArchivo         varchar(100), 
  fechaSubida           datetime(19) NULL, 
  observacion           text, 
  fileURL               varchar(100), 
  fileID                varchar(60), 
  PRIMARY KEY (idResolucionSolicitud));
CREATE TABLE sessions (
  session_id varchar(128) NOT NULL, 
  expires    int unsigned NOT NULL, 
  data       mediumtext NOT NULL, 
  PRIMARY KEY (session_id));
CREATE TABLE siniestro (
  idSiniestro    int(10) NOT NULL AUTO_INCREMENT, 
  idResguardante int(10), 
  fechaSiniestro datetime(19) NULL, 
  PRIMARY KEY (idSiniestro));
CREATE TABLE solicitud (
  idSolicitud        int(10) NOT NULL AUTO_INCREMENT, 
  idResguardante     int(10) NOT NULL, 
  idListaServicios   int(10) NOT NULL, 
  placas             varchar(20), 
  marca              varchar(45), 
  tipo               varchar(45), 
  modelo             varchar(45), 
  color              varchar(20), 
  km                 int(10), 
  fechaSolicitud     datetime(19) NULL, 
  nombreResguardante varchar(45), 
  area               varchar(45), 
  cargo              varchar(45), 
  estado             varchar(45), 
  motivo             text, 
  informacion        text, 
  PRIMARY KEY (idSolicitud));
CREATE TABLE sucursal (
  idSucursal        int(10) NOT NULL AUTO_INCREMENT, 
  zona              varchar(45), 
  nombreContacto    varchar(45), 
  direccionSucursal varchar(254), 
  telefonoSucursal  varchar(15), 
  correoSucursal    varchar(45), 
  idProveedor       int(10), 
  PRIMARY KEY (idSucursal));
CREATE TABLE vehiculo (
  idVehiculo    int(10) NOT NULL AUTO_INCREMENT, 
  clase         varchar(45), 
  marca         varchar(45), 
  tipo          varchar(45), 
  color         varchar(45), 
  modelo        varchar(45), 
  motor         varchar(45), 
  serie         varchar(45), 
  cilindros     int(10), 
  transmision   varchar(45), 
  capTanque     int(10), 
  combustible   int(10), 
  placaActual   varchar(45), 
  placaAnterior varchar(45), 
  rendimiento   varchar(45), 
  adscripcion   varchar(100), 
  numeroEco     varchar(45), 
  verificacion  varchar(45), 
  kmRegistro    double, 
  estado        varchar(45) DEFAULT 'Activo', 
  observacion   text, 
  PRIMARY KEY (idVehiculo));
CREATE TABLE catalogo_servicios_lista_servicios (
  idServicio_catalogo_servicios    int(10) NOT NULL, 
  idListaServicios_lista_servicios int(10) NOT NULL, 
  PRIMARY KEY (idServicio_catalogo_servicios, 
  idListaServicios_lista_servicios));
CREATE UNIQUE INDEX usuario_UNIQUE 
  ON empleado (usuario);
CREATE UNIQUE INDEX idEmpleado_UNIQUE 
  ON empleado (idEmpleado);
CREATE INDEX fk_idLF_idSiniestro_idx 
  ON lista_fotos (idSiniestro);
CREATE INDEX fk_idLF_idFoto_idx 
  ON lista_fotos (idFoto);
CREATE INDEX fk_idListaServicios_idProveedor_idx 
  ON lista_servicios (idProveedor);
CREATE INDEX fk_idNoti_idEmpleado_idx 
  ON notifications (idEmpleado);
CREATE INDEX fk_idListaSer_idListaSer_idx 
  ON orden_servicio (idListaServicios);
CREATE INDEX fk_idOrden_idSolicitud_idx 
  ON orden_servicio (idSolicitud);
CREATE INDEX fk_idProveedor_idOrden_idx 
  ON orden_servicio (idProveedor);
CREATE INDEX fk_idPoloza_idVehiculo_idx 
  ON poliza (idVehiculo);
CREATE INDEX fk_idPoliza_idAseguradora_idx 
  ON poliza (idAseguradora);
CREATE INDEX fk_idResguardo_idResguardante_idx 
  ON resguardo (idResguardante);
CREATE INDEX fk_idRsguardo_idVehiculo_idx 
  ON resguardo (idVehiculo);
CREATE INDEX fk_idSiniestro_idResolucion_Siniestro_idx 
  ON resolucion_siniestro (idSiniestro);
CREATE INDEX fk_idOrden_idResolucion_idx 
  ON resolucion_solicitud (idOrden);
CREATE INDEX fk_idSinistro_idResguardante_idx 
  ON siniestro (idResguardante);
CREATE INDEX fk_idProveedor_idSucursal_idx 
  ON sucursal (idProveedor);
CREATE UNIQUE INDEX placaActual_UNIQUE 
  ON vehiculo (placaActual);
ALTER TABLE empleado_resguardante ADD CONSTRAINT fk_idResguardante_idEmpleado FOREIGN KEY (idResguardante) REFERENCES empleado (idEmpleado) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE lista_fotos ADD CONSTRAINT fk_idLF_idFoto FOREIGN KEY (idFoto) REFERENCES foto (idFoto) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE lista_fotos ADD CONSTRAINT fk_idLF_idSiniestro FOREIGN KEY (idSiniestro) REFERENCES siniestro (idSiniestro) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE lista_servicios ADD CONSTRAINT fk_idListaServicios_idProveedor FOREIGN KEY (idProveedor) REFERENCES proveedor (idProveedor) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE notifications ADD CONSTRAINT fk_idNoti_idEmpleado FOREIGN KEY (idEmpleado) REFERENCES empleado (idEmpleado) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE orden_servicio ADD CONSTRAINT fk_idOrden_idSolicitud FOREIGN KEY (idSolicitud) REFERENCES solicitud (idSolicitud) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE orden_servicio ADD CONSTRAINT fk_idListaSer_idListaSer FOREIGN KEY (idListaServicios) REFERENCES lista_servicios (idListaServicios) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE orden_servicio ADD CONSTRAINT fk_idProveedor_idOrden FOREIGN KEY (idProveedor) REFERENCES proveedor (idProveedor) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE poliza ADD CONSTRAINT fk_idPoliza_idAseguradora FOREIGN KEY (idAseguradora) REFERENCES aseguradora (idAseguradora) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE poliza ADD CONSTRAINT fk_idPoloza_idVehiculo FOREIGN KEY (idVehiculo) REFERENCES vehiculo (idVehiculo) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE resguardo ADD CONSTRAINT fk_idRsguardo_idVehiculo FOREIGN KEY (idVehiculo) REFERENCES vehiculo (idVehiculo) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE resguardo ADD CONSTRAINT fk_idResguardo_idResguardante FOREIGN KEY (idResguardante) REFERENCES empleado_resguardante (idResguardante) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE resolucion_siniestro ADD CONSTRAINT fk_idSiniestro_idResolucion_Siniestro FOREIGN KEY (idSiniestro) REFERENCES siniestro (idSiniestro) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE resolucion_solicitud ADD CONSTRAINT fk_idOrden_idResolucion FOREIGN KEY (idOrden) REFERENCES orden_servicio (idOrden) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE siniestro ADD CONSTRAINT fk_idSinistro_idResguardante FOREIGN KEY (idResguardante) REFERENCES empleado_resguardante (idResguardante) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE sucursal ADD CONSTRAINT fk_idProveedor_idSucursal FOREIGN KEY (idProveedor) REFERENCES proveedor (idProveedor) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE catalogo_servicios_lista_servicios ADD CONSTRAINT FKcatalogo_s576945 FOREIGN KEY (idServicio_catalogo_servicios) REFERENCES catalogo_servicios (idServicio);
ALTER TABLE catalogo_servicios_lista_servicios ADD CONSTRAINT FKcatalogo_s590135 FOREIGN KEY (idListaServicios_lista_servicios) REFERENCES lista_servicios (idListaServicios);
ALTER TABLE solicitud ADD CONSTRAINT FKsolicitud454005 FOREIGN KEY (idResguardante) REFERENCES empleado_resguardante (idResguardante);
ALTER TABLE solicitud ADD CONSTRAINT FKsolicitud246539 FOREIGN KEY (idListaServicios) REFERENCES lista_servicios (idListaServicios);
