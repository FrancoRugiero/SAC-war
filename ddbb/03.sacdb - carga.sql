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
--    C A R G A   B B D D   ( s a c d b )
--    A U T O R :    S c a r a f i a
--
-- =============================================================================

-- =============================================================================
-- CURSOS
-- =============================================================================
-- Cargo curso 1
SELECT fn_getidcurso();
SELECT fn_savecurso(1, 'Física', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae dolor eget felis pellentesque sagittis non in odio. Maecenas risus nibh, feugiat quis varius eu, mollis sit amet massa. Vivamus.', '2016-03-01 13:45:10', NULL);
-- Cargo curso 2
SELECT fn_getidcurso();
SELECT fn_savecurso(2, 'Musica', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae dolor eget felis pellentesque sagittis non in odio. Maecenas risus nibh, feugiat quis varius eu, mollis sit amet massa. Vivamus.', '2016-03-01 13:47:18', NULL);
-- Corrijo curso 2
SELECT fn_savecurso(2, 'Música', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae dolor eget felis pellentesque sagittis non in odio. Maecenas risus nibh, feugiat quis varius eu, mollis sit amet massa. Vivamus.', '2016-03-01 13:49:14', NULL);
-- Cargo curso 3
SELECT fn_getidcurso();
SELECT fn_savecurso(3, 'Filosofía', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae dolor eget felis pellentesque sagittis non in odio. Maecenas risus nibh, feugiat quis varius eu, mollis sit amet massa. Vivamus.', '2016-03-01 13:52:22', NULL);

-- =============================================================================
-- ALUMNOS
-- =============================================================================
-- Cargo alumnos
SELECT fn_savealumno(NULL, '10.001', 'Newton', 'Isaac', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.002', 'Einstein', 'Albert', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.003', 'Bohr', 'Niels', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.004', 'Huygens', 'Christiaan', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.005', 'Leibniz', 'Gottfried', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.006', 'Galilei', 'Galileo', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.007', 'Joule', 'James Prescott', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.008', 'Mastropiero', 'Johann Sebastian', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.009', 'Morricone', 'Enio', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.010', 'Vivaldi', 'Antonio', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.011', 'Van Beethoven', 'Ludwig', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.012', 'Bach', 'Johann Sebastian', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.013', 'Strauss', 'Johann', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.014', 'Mozart', 'Wolfgang Amadeus', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.015', 'Sartre', 'Jean Paul', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.016', 'Descartes', 'René', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.017', 'Kant', 'Immanuel', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.018', 'Nietzsche', 'Friedrich', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.019', 'Heidegger', 'Martin', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.020', 'Schopenhauer', 'Arthur', '99.999.999', NULL);
SELECT fn_savealumno(NULL, '10.021', 'Comte', 'Auguste', '99.999.999', NULL);

-- =============================================================================
COMMIT;
-- =============================================================================

