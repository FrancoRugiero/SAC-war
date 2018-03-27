-- =============================================================================
--
--    U N I V E R S I D A D   T E C N O L Ó G I C A   N A C I O N A L
--    F A C U L T A D   R E G I O N A L   C Ó R D O B A
--
--    D I S E Ñ O   D E   L E N G U A J E S   D E   C O N S U L T A   ( D L C )
--    P R Á C T I C O   T U T O R:
--        S I S T E M A   D E
--        A D M I N I S T R A C I Ó N   D E   C U R S O S   ( S A C )
--
--    E S T R U C T U R A   B B D D   ( s a c d b )
--    A U T O R :    S c a r a f i a
--
-- =============================================================================
-- =============================================================================
--    T A B L A S ,   Í N D I C E S   Y   S E Q U E N C I A S
-- =============================================================================
-- =============================================================================
-- CURSOS
-- =============================================================================
DROP SEQUENCE IF EXISTS sq_curso CASCADE;
CREATE SEQUENCE sq_curso;
DROP TABLE IF EXISTS curso CASCADE;
CREATE TABLE curso (
  idcurso               INTEGER                         NOT NULL,
  nombre                VARCHAR(32)                     NOT NULL,
  descripcion           TEXT                            NOT NULL,
  fechaalta             TIMESTAMP                       NOT NULL,
  fechabaja             TIMESTAMP,
  PRIMARY KEY (idcurso),
  UNIQUE (nombre),
  CHECK ((fechabaja IS NULL) OR (fechaalta < fechabaja))
);

-- =============================================================================
-- ALUMNOS
-- =============================================================================
DROP SEQUENCE IF EXISTS sq_alumno CASCADE;
CREATE SEQUENCE sq_alumno;
DROP TABLE IF EXISTS alumno CASCADE;
CREATE TABLE alumno (
  idalumno              INTEGER                         NOT NULL,
  legajo                VARCHAR(16)                     NOT NULL,
  apellido              VARCHAR(64)                     NOT NULL,
  nombre                VARCHAR(64)                     NOT NULL,
  dni                   VARCHAR(64)                     NOT NULL,
  observaciones         VARCHAR(255),
  PRIMARY KEY (idalumno),
  UNIQUE (legajo)
);

CREATE INDEX idx_alumno_apenom ON alumno(apellido, nombre);

-- =============================================================================
-- INSCRIPCIONES
-- =============================================================================
DROP TABLE IF EXISTS curso_alumnos CASCADE;
CREATE TABLE curso_alumnos (
  idcurso               INTEGER                         NOT NULL,
  idalumno              INTEGER                         NOT NULL,
  PRIMARY KEY (idcurso, idalumno),
  FOREIGN KEY (idcurso)
    REFERENCES curso(idcurso),
  FOREIGN KEY (idalumno)
    REFERENCES alumno(idalumno)
);

-- =============================================================================
-- CALIFICACIONES
-- =============================================================================
DROP SEQUENCE IF EXISTS sq_calificacion CASCADE;
CREATE SEQUENCE sq_calificacion;
DROP TABLE IF EXISTS calificacion CASCADE;
CREATE TABLE calificacion (
  idcalificacion        INTEGER                         NOT NULL,
  idcurso               INTEGER                         NOT NULL,
  idalumno              INTEGER                         NOT NULL,
  fecha                 TIMESTAMP                       NOT NULL,
  nota                  INTEGER                         NOT NULL,
  PRIMARY KEY (idcalificacion),
  FOREIGN KEY (idcurso, idalumno)
    REFERENCES curso_alumnos(idcurso, idalumno),
  CHECK (nota BETWEEN 0 AND 10)
);

CREATE INDEX idx_calificacion_fecha ON calificacion(fecha);

-- =============================================================================
--    V I S T A S
-- =============================================================================
-- =============================================================================
-- CURSOS
-- =============================================================================
CREATE OR REPLACE VIEW v_curso AS
  SELECT c.idcurso, c.nombre AS curso, c.descripcion, c.fechaalta, c.fechabaja,
         a.*
  FROM curso c
  JOIN curso_alumnos ca ON c.idcurso = ca.idcurso
  JOIN alumno a ON ca.idalumno = a.idalumno
;

CREATE OR REPLACE VIEW v_calificacion AS
  SELECT cu.idcurso, cu.nombre AS curso,
         al.idalumno, al.apellido, al.nombre, al.legajo,
         ca.idcalificacion, ca.fecha, ca.nota
  FROM calificacion ca
  JOIN curso cu ON ca.idcurso = cu.idcurso
  JOIN alumno al ON ca.idalumno = al.idalumno
;

-- =============================================================================
--COMMIT;
-- =============================================================================
