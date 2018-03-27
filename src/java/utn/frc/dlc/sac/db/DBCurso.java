/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utn.frc.dlc.sac.db;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import utn.frc.dlc.sac.Alumno;
import utn.frc.dlc.sac.Curso;
import utn.frc.dlc.sac.Fecha;

/**
 *
 * @author scarafia
 */
public abstract class DBCurso {
    private static final String ID = "idcurso";
    private static final String NOMBRE = "nombre";
    private static final String DESCRIPCION = "descripcion";
    private static final String FECHAALTA = "fechaalta";
    private static final String FECHABAJA = "fechabaja";

    /**
     * Obtiene el siguiente identificador de curso.
     *
     * @param db
     * @return
     * @throws Exception
     */
    public static int getNextId(DBManager db) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        ResultSet rs = db.executeQuery("SELECT fn_getidcurso() AS id");
        if (!rs.first()) throw new Exception("DBCurso Error: No se pudo obtener identificador");
        int id = rs.getInt("id");
        return id;
    }

    /**
     * Construye un Curso a partir de un ResultSet previamente ejecutado.
     *
     * @param rs
     * @return
     * @throws Exception
     */
    private static Curso buildCurso(ResultSet rs) throws Exception {
        Curso curso = null;
        if (rs.next()) {
            int id = rs.getInt(ID);
            String nombre = rs.getString(NOMBRE);
            String descripcion = rs.getString(DESCRIPCION);
            Date altaAux = rs.getDate(FECHAALTA);
            Fecha fechaAlta = new Fecha(altaAux);
            Date bajaAux = rs.getDate(FECHABAJA);
            Fecha fechaBaja = null;
            if (bajaAux != null) {
                fechaBaja = new Fecha(bajaAux);
            }
            int inscriptos = 0;
            try {
                inscriptos = rs.getInt("inscriptos");
            } catch (Exception e) {
                inscriptos = 0;
            }
            curso = new Curso(id, nombre, descripcion, fechaAlta, fechaBaja, inscriptos);
        }
        return curso;
    }

    /**
     * Carga un curso de la ddbb a partir de su identificador.
     *
     * @param db
     * @param idCurso
     * @return
     * @throws Exception
     */
    public static Curso loadDB(DBManager db, Integer idCurso) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        if (idCurso==null) throw new Exception("DBCurso Error: Identificador NO especificado");
        String query = "SELECT c.*, fn_get_curso_cant_inscriptos(c.idcurso) AS inscriptos " +
                              "FROM curso c " +
                              "WHERE c.idcurso = " + idCurso;
        ResultSet rs = db.executeQuery(query);
        Curso curso = buildCurso(rs);
        rs.close();
        return curso;
    }

    /**
     * Guarda un curso en la ddbb.
     *
     * @param db
     * @param curso
     * @return
     * @throws Exception
     */
    public static Integer saveDB(DBManager db, Curso curso) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        if (curso==null) throw new Exception("DBCurso Error: Curso NO especificado");
        String query = "SELECT fn_savecurso(idcurso, nombre, descripcion, fechaalta, fechabaja)";
        query = "SELECT fn_savecurso(?, ?, ?, ?, ?)";
        db.prepare(query);
        db.setInt(1, curso.getId());
        db.setString(2, curso.getNombre());
        db.setString(3, curso.getDescripcion());
        Fecha fechaAlta = curso.getFechaAlta();
        String altaAux = (fechaAlta==null) ? null : fechaAlta.format("yyyy-MM-dd H:m:s");
        db.setString(4, altaAux);
        Fecha fechaBaja = curso.getFechaBaja();
        String bajaAux = (fechaBaja==null) ? null : fechaBaja.format("yyyy-MM-dd H:m:s");
        db.setString(5, bajaAux);
        ResultSet rs = db.executeQuery();
        Integer idCurso = null;
        if (rs.first()) idCurso = rs.getInt(1);
        rs.close();
        return idCurso;
    }

    /**
     * Elimina un curso de la ddbb.
     *
     * @param db
     * @param idCurso
     * @throws Exception
     */
    public static void deleteDB(DBManager db, Integer idCurso) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        if (idCurso==null) throw new Exception("DBCurso Error: Identificador NO especificado");
        String query = "SELECT pr_deletecurso(?)";
        db.prepare(query);
        db.setInt(1, idCurso);
        db.execute();
    }

    /**
     * Genera una lista de cursos.
     *
     * @param db
     * @param limit
     * @param offset
     * @return
     * @throws Exception
     */
    public static List loadList(DBManager db, int limit, int offset) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        if (limit<0) throw new Exception("DBCurso Error: limit incorrecto");
        if (offset<0) throw new Exception("DBCurso Error: offset incorrecto");
        List cursos = new ArrayList();
        String query = "SELECT c.*, fn_get_curso_cant_inscriptos(c.idcurso) AS inscriptos " +
                "FROM curso c " +
              //  "WHERE " +
                "ORDER BY c.nombre ";
        if (limit>0) query += "LIMIT " + limit + "OFFSET " + offset;
        ResultSet rs = db.executeQuery(query);

        Curso curso = null;
        while ((curso = buildCurso(rs)) != null) {
            cursos.add(curso);
        }
        rs.close();

        return cursos;
    }

    /**
     * Genera una lista de cursos.
     *
     * @param db
     * @return
     * @throws Exception
     */
    public static List loadList(DBManager db) throws Exception {
        return loadList(db, 0, 0);
    }

    /**
     * Carga los alumnos inscriptos en un curso.
     *
     * @param db
     * @param curso
     * @param limit
     * @param offset
     * @return
     * @throws Exception
     */
    public static List loadAlumnos(DBManager db, Curso curso, int limit, int offset) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        if (curso==null) throw new Exception("DBCurso Error: Curso NO especificado");
        List alumnos = new ArrayList();

        String query = "SELECT * " +
                "FROM v_curso c " +
                "WHERE c.idcurso = " + curso.getId() + " " +
                "ORDER BY c.legajo ";
        if (limit>0) query += "LIMIT " + limit + "OFFSET " + offset;
        ResultSet rs = db.executeQuery(query);

        Alumno alumno = null;
        while ((alumno = DBAlumno.buildAlumno(rs)) != null) {
            alumnos.add(alumno);
        }
        rs.close();

        curso.setAlumnos(alumnos);
        curso.setInscriptos(alumnos.size());

        return alumnos;
    }

    /**
     * Carga los alumnos inscriptos en un curso.
     *
     * @param db
     * @param curso
     * @return
     * @throws Exception
     */
    public static List loadAlumnos(DBManager db, Curso curso) throws Exception {
        return loadAlumnos(db, curso, 0, 0);
    }

    public static void saveAlumnos(DBManager db, Curso curso) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        if (curso==null) throw new Exception("DBCurso Error: Curso NO especificado");
        List<Alumno> alumnos = curso.getAlumnos();
        int size = alumnos!=null ? alumnos.size() : 0;
        if (size > 0) {
            String query = "SELECT pr_saveinscripcion(idcurso, idalumno)";
            query = "SELECT pr_saveinscripcion(?, ?)";
            db.prepare(query);
            for (int i=0; i<size; i++) {
                db.setInt(1, curso.getId());
                int idAlumno = alumnos.get(i).getId();
                db.setInt(2, idAlumno);
                db.execute();
            }
        }
    }

    /**
     * Carga los alumnos NO inscriptos en un curso.
     *
     * @param db
     * @param curso
     * @param limit
     * @param offset
     * @return
     * @throws Exception
     */
    public static List loadCandidatos(DBManager db, Curso curso, int limit, int offset) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        if (curso==null) throw new Exception("DBCurso Error: Curso NO especificado");
        List alumnos = new ArrayList();

        String query = "SELECT * " +
                "FROM alumno a " +
                "WHERE a.idalumno NOT IN (" +
                    "SELECT ca.idalumno " +
                    "FROM curso_alumnos ca " +
                    "WHERE ca.idcurso = " + curso.getId() +
                ")" +
                "ORDER BY a.legajo ";
        if (limit>0) query += "LIMIT " + limit + "OFFSET " + offset;
        ResultSet rs = db.executeQuery(query);

        Alumno alumno = null;
        while ((alumno = DBAlumno.buildAlumno(rs)) != null) {
            alumnos.add(alumno);
            alumno = null;
        }
        rs.close();

        return alumnos;
    }

    /**
     * Carga los alumnos NO inscriptos en un curso.
     *
     * @param db
     * @param curso
     * @param limit
     * @param offset
     * @return
     * @throws Exception
     */
    public static List loadCandidatos(DBManager db, Curso curso) throws Exception {
        return loadCandidatos(db, curso, 0, 0);
    }

    /**
     * Desinscribe un alumno del curso especificado.
     *
     * @param db
     * @param curso
     * @param alumno
     * @throws Exception
     */
    public static void deleteInscripcion(DBManager db, Curso curso, Alumno alumno) throws Exception {
        if (db==null) throw new Exception("DBCurso Error: DBManager NO especificado");
        if (curso==null) throw new Exception("DBCurso Error: Curso NO especificado");
        String query = "SELECT pr_deleteinscripcion(" +
                            curso.getId() + ", " +
                            alumno.getId() + ")";
        db.executeQuery(query);
    }

}
