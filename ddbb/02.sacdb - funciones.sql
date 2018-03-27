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
--    F U N C I O N E S / P R O C E D I M I E N T O S   B B D D   ( s a c d b )
--    A U T O R :    S c a r a f i a
--
-- =============================================================================

-- =============================================================================
-- CURSOS
-- =============================================================================
-- La siguiente función obtiene el próximo id de curso para ser insertado.
CREATE OR REPLACE FUNCTION fn_getidcurso (
) RETURNS INTEGER AS $$

    DECLARE
        var_idcurso                  INTEGER         := NULL;

    BEGIN
        var_idcurso:= NEXTVAL('sq_curso');
        RETURN var_idcurso;
    END;
$$ LANGUAGE plpgsql;

-- La siguiente función "guarda" un curso en la BBDD.
-- Toma como parámetros de entrada los datos del mismo.
-- Entre ellos, el id.
-- Si existe lo actualiza.
-- Si no existe lo crea.
CREATE OR REPLACE FUNCTION fn_savecurso (
    pin_idcurso                      INTEGER,
    pin_nombre                       VARCHAR,
    pin_descripcion                  TEXT,
    pin_fechaalta                    VARCHAR,
    pin_fechabaja                    VARCHAR
  
) RETURNS INTEGER AS $$

    DECLARE
        var_idcurso                  INTEGER         := pin_idcurso;
        var_nombre                   VARCHAR         := TRIM(pin_nombre);
        var_descripcion              VARCHAR         := TRIM(pin_descripcion);
        var_fechaalta                TIMESTAMP       := NULL;
        var_fechabaja                TIMESTAMP       := NULL;

        var_step                     INTEGER         := 0;

        var_count                    INTEGER         := 0;

    BEGIN
        var_step:= 1; -- convierto fechas
        var_fechaalta := TO_TIMESTAMP(pin_fechaalta, 'YYYY-MM-DD HH24:MI:SS');
        IF (pin_fechabaja IS NOT NULL AND pin_fechabaja <> '') THEN
            var_fechabaja := TO_TIMESTAMP(pin_fechabaja, 'YYYY-MM-DD HH24:MI:SS');
        END IF;

        var_step:= 2; -- cuento cursos
        SELECT COUNT(*)
            INTO var_count
            FROM curso c
            WHERE c.idcurso = var_idcurso;

        var_step:= 3; -- veo si existe
        IF (var_count > 0) THEN
            var_step:= 4; -- sí existe ==> update
            UPDATE curso c SET
                nombre = var_nombre,
                descripcion = var_descripcion,
                fechaalta = var_fechaalta,
                fechabaja = var_fechabaja
            WHERE c.idcurso = var_idcurso;
        ELSE
            var_step:= 5; -- no existe ==> insert
            IF (var_idcurso IS NULL) THEN
                var_idcurso := fn_getidcurso();
            END IF;
            INSERT INTO curso(idcurso, nombre, descripcion, fechaalta, fechabaja)
                VALUES (var_idcurso, var_nombre, var_descripcion, var_fechaalta, var_fechabaja);
        END IF;

        RETURN var_idcurso;
    END;
$$ LANGUAGE plpgsql;

-- La siguiente función elimina un curso de la BBDD.
-- Como se ve, NO devuelve ningún valor (devuelve VOID),
-- por lo que se asemeja más a un stored procedure.
CREATE OR REPLACE FUNCTION pr_deletecurso (
    pin_idcurso                      INTEGER
) RETURNS VOID AS $$

    DECLARE
        var_step                     INTEGER         := 0;

    BEGIN
        var_step:= 1; -- elimino el curso
        DELETE FROM curso c
            WHERE c.idcurso = pin_idcurso;

        RETURN;
    END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- ALUMNOS
-- =============================================================================
CREATE OR REPLACE FUNCTION fn_getidalumno (
) RETURNS INTEGER AS $$

    DECLARE
        var_idalumno                 INTEGER         := NULL;

    BEGIN
        var_idalumno:= NEXTVAL('sq_alumno');
        RETURN var_idalumno;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_savealumno (
    pin_idalumno                     INTEGER,
    pin_legajo                       VARCHAR,
    pin_apellido                     VARCHAR,
    pin_nombre                       VARCHAR,
    pin_dni                          VARCHAR,
    pin_observaciones                VARCHAR

) RETURNS INTEGER AS $$

    DECLARE
        var_idalumno                 INTEGER         := pin_idalumno;
        var_legajo                   VARCHAR         := TRIM(pin_legajo);
        var_apellido                 VARCHAR         := TRIM(pin_apellido);
        var_nombre                   VARCHAR         := TRIM(pin_nombre);
        var_dni                      VARCHAR         := TRIM(pin_dni);
        var_observaciones            VARCHAR         := TRIM(pin_observaciones);

        var_step                     INTEGER         := 0;

        var_count                    INTEGER         := 0;

    BEGIN
        var_step:= 1; -- cuento alumnos
        SELECT COUNT(*)
            INTO var_count
            FROM alumno a
            WHERE a.idalumno = var_idalumno;

        var_step:= 2; -- veo si existe
        IF (var_count > 0) THEN
            var_step:= 3; -- sí existe ==> update
            UPDATE alumno a SET
                legajo = var_legajo,
                apellido = var_apellido,
                nombre = var_nombre,
                dni = var_dni,
                observaciones = var_observaciones
            WHERE a.idalumno = var_idalumno;
        ELSE
            var_step:= 4; -- no existe ==> insert
            IF (var_idalumno IS NULL) THEN
                var_idalumno := fn_getidalumno();
            END IF;
            INSERT INTO alumno(idalumno, legajo, apellido, nombre, dni, observaciones)
                VALUES (var_idalumno, var_legajo, var_apellido, var_nombre, var_dni, var_observaciones);
        END IF;

        RETURN var_idalumno;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION pr_deletealumno (
    pin_idalumno                     INTEGER
) RETURNS VOID AS $$

    DECLARE
        var_step                     INTEGER         := 0;

    BEGIN
        var_step:= 1; -- elimino el alumno
        DELETE FROM alumno a
            WHERE a.idalumno = pin_idalumno;

        RETURN;
    END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- INSCRIPCIONES
-- =============================================================================
CREATE OR REPLACE FUNCTION pr_saveinscripcion (
    pin_idcurso                      INTEGER,
    pin_idalumno                     INTEGER

) RETURNS VOID AS $$

    DECLARE
        var_idcurso                  INTEGER         := pin_idcurso;
        var_idalumno                 INTEGER         := pin_idalumno;

        var_step                     INTEGER         := 0;

        var_count                    INTEGER         := 0;

    BEGIN
        var_step:= 1; -- cuento inscripciones
        SELECT COUNT(*)
            INTO var_count
            FROM curso_alumnos ca
            WHERE ca.idcurso = var_idcurso
            AND ca.idalumno = var_idalumno;

        var_step:= 2; -- veo si existe
        IF (var_count = 0) THEN
            var_step:= 3; -- no existe ==> insert
            INSERT INTO curso_alumnos(idcurso, idalumno)
                VALUES (var_idcurso, var_idalumno);
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION pr_deleteinscripcion (
    pin_idcurso                      INTEGER,
    pin_idalumno                     INTEGER
) RETURNS VOID AS $$

    DECLARE
        var_step                     INTEGER         := 0;

    BEGIN
        var_step:= 1; -- elimino la inscripción
        DELETE FROM curso_alumnos ca
            WHERE ca.idcurso = pin_idcurso
            AND ca.idalumno = pin_idalumno;

        RETURN;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_get_curso_cant_inscriptos (
    pin_idcurso                      INTEGER

) RETURNS INTEGER AS $$

    DECLARE
        var_step                     INTEGER         := 0;

        var_count                    INTEGER         := 0;

    BEGIN
        var_step:= 1; -- cuento inscripciones
        SELECT COUNT(*)
            INTO var_count
            FROM curso_alumnos ca
            WHERE ca.idcurso = pin_idcurso;

        RETURN var_count;
    END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- CALIFICACIONES
-- =============================================================================
CREATE OR REPLACE FUNCTION fn_getidcalificacion (
) RETURNS INTEGER AS $$

    DECLARE
        var_idcalificacion           INTEGER         := NULL;

    BEGIN
        var_idcalificacion:= NEXTVAL('sq_calificacion');
        RETURN var_idcalificacion;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_savecalificacion (
    pin_idcalificacion               INTEGER,
    pin_idcurso                      INTEGER,
    pin_idalumno                     INTEGER,
    pin_fecha                        VARCHAR,
    pin_nota                         INTEGER

) RETURNS INTEGER AS $$

    DECLARE
        var_idcalificacion           INTEGER         := pin_idcalificacion;
        var_idcurso                  INTEGER         := pin_idcurso;
        var_idalumno                 INTEGER         := pin_idalumno;
        var_fecha                    TIMESTAMP       := NULL;
        var_nota                     INTEGER         := pin_nota;

        var_step                     INTEGER         := 0;

        var_count                    INTEGER         := 0;

    BEGIN
        var_step:= 1; -- convierto fechas
        var_fecha := TO_TIMESTAMP(pin_fecha, 'YYYY-MM-DD HH24:MI:SS');

        var_step:= 2; -- cuento calificaciones
        SELECT COUNT(*)
            INTO var_count
            FROM calificacion c
            WHERE c.idcalificacion = var_idcalificacion;

        var_step:= 3; -- veo si existe
        IF (var_count > 0) THEN
            var_step:= 4; -- sí existe ==> update
            UPDATE calificacion c SET
                idcurso = var_idcurso,
                idalumno = var_idalumno,
                fecha = var_fecha,
                nota = var_nota
            WHERE c.idcalificacion = var_idcalificacion;
        ELSE
            var_step:= 5; -- no existe ==> insert
            IF (var_idcalificacion IS NULL) THEN
                var_idcalificacion := fn_getidcalificacion();
            END IF;
            INSERT INTO calificacion(idcalificacion, idcurso, idalumno, fecha, nota)
                VALUES (var_idcalificacion, var_idcurso, var_idalumno, var_fecha, var_nota);
        END IF;

        RETURN var_idcalificacion;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION pr_deletecalificacion (
    pin_idcalificacion               INTEGER
) RETURNS VOID AS $$

    DECLARE
        var_step                     INTEGER         := 0;

    BEGIN
        var_step:= 1; -- elimino la calificación
        DELETE FROM calificacion c
            WHERE ca.idcalificacion = pin_idcalificacion;

        RETURN;
    END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- COMMIT;
-- =============================================================================
