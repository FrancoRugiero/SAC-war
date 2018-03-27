/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utn.frc.dlc.sac.db;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utn.frc.dlc.sac.Alumno;

/**
 *
 * @author scarafia
 */
public abstract class DBAlumno {
    private static final String ID = "idalumno";
    private static final String LEGAJO = "legajo";
    private static final String APELLIDO = "apellido";
    private static final String NOMBRE = "nombre";
    private static final String DNI = "dni";
    private static final String OBSERVACIONES = "observaciones";

    /**
     * Obtiene el siguiente identificador de alumno.
     *
     * @param db
     * @return
     * @throws Exception
     */
    public static int getNextId(DBManager db) throws Exception {
        if (db==null) throw new Exception("DBAlumno Error: DBManager NO especificado");
        ResultSet rs = db.executeQuery("SELECT fn_getidalumno() AS id");
        if (!rs.first()) throw new Exception("DBAlumno Error: No se pudo obtener identificador");
        int id = rs.getInt("id");
        return id;
    }

    /**
     * Construye un Alumno a partir de un ResultSet previamente ejecutado.
     *
     * @param rs
     * @return
     * @throws Exception
     */
    protected static Alumno buildAlumno(ResultSet rs) throws Exception {
        Alumno alumno = null;
        if (rs.next()) {
            alumno = new Alumno();
            alumno.setId(rs.getInt(ID));
            alumno.setLegajo(rs.getString(LEGAJO));
            alumno.setApellido(rs.getString(APELLIDO));
            alumno.setNombre(rs.getString(NOMBRE));
            alumno.setDni(rs.getString(DNI));
            alumno.setObservaciones(rs.getString(OBSERVACIONES));
        }
        return alumno;
    }

    /**
     * Carga un alumno de la ddbb a partir de su identificador.
     *
     * @param db
     * @param idAlumno
     * @return
     * @throws Exception
     */
    public static Alumno loadDB(DBManager db, Integer idAlumno) throws Exception {
        if (db==null) throw new Exception("DBAlumno Error: DBManager NO especificado");
        if (idAlumno==null) throw new Exception("DBAlumno Error: Identificador NO especificado");
        String query = "SELECT * " +
                              "FROM alumno a " +
                              "WHERE a.idalumno = " + idAlumno;
        ResultSet rs = db.executeQuery(query);
        Alumno alumno = buildAlumno(rs);
        rs.close();
        return alumno;
    }

    /**
     * Carga un alumno de la ddbb a partir de su legajo.
     *
     * @param db
     * @param legajo
     * @return
     * @throws Exception
     */
    public static Alumno loadDB(DBManager db, String legajo) throws Exception {
        if (db==null) throw new Exception("DBAlumno Error: DBManager NO especificado");
        if (legajo==null) throw new Exception("DBAlumno Error: Legajo NO especificado");
        String query = "SELECT * " +
                              "FROM alumno a " +
                              "WHERE a.legajo = '" + legajo + "' ";
        ResultSet rs = db.executeQuery(query);
        Alumno alumno = buildAlumno(rs);
        rs.close();
        return alumno;
    }

    /**
     * Guarda un alumno en la ddbb.
     * Obsérvese que la función invoca un SP (stored procedure / funtcion) sin
     * precompilarlo y sin ser debidamente parseado, lo cual trae 2 incovenientes:
     * 1. Posible sql-injection
     * 2. Posible error por caracteres especiales
     *
     * @param db
     * @param alumno
     * @throws Exception
     */
    public static void saveDBError(DBManager db, Alumno alumno) throws Exception {
        if (db==null) throw new Exception("DBAlumno ERROR: DBManager NO especificado");
        if (alumno == null) throw new Exception("DBAlumno ERROR: Alumno NO especificado");
        String query = "SELECT fn_savealumno(" +
                              alumno.getId() + ", " +
                              "'" + alumno.getLegajo() + "', " +
                              "'" + alumno.getApellido() + "', " +
                              "'" + alumno.getNombre() + "', " +
                              "'" + alumno.getDni() + "', " +
                              "'" + alumno.getObservaciones() + "')";
//        System.out.println(statement);
        ResultSet rs = db.executeQuery(query);
        rs.close();
        rs = null;
    }

    /**
     * Guarda un alumno en la ddbb.
     *
     * @param db
     * @param alumno
     * @return
     * @throws Exception
     */
    public static Integer saveDB(DBManager db, Alumno alumno) throws Exception {
        if (db==null) throw new Exception("DBAlumno Error: DBManager NO especificado");
        if (alumno==null) throw new Exception("DBAlumno Error: Alumno NO especificado");
        String query = "SELECT fn_savealumno(idalumno, legajo, apellido, nombre, dni, observaciones)";
        query = "SELECT fn_savealumno(?, ?, ?, ?, ?, ?)";
        db.prepare(query);
        db.setInt(1, alumno.getId());
        db.setString(2, alumno.getLegajo());
        db.setString(3, alumno.getApellido());
        db.setString(4, alumno.getNombre());
        db.setString(5, alumno.getDni());
        db.setString(6, alumno.getObservaciones());
        ResultSet rs = db.executeQuery();
        Integer idAlumno = null;
        if (rs.first()) idAlumno = rs.getInt(1);
        rs.close();
        return idAlumno;
    }

    /**
     * Elimina un alumno de la ddbb.
     *
     * @param db
     * @param idAlumno
     * @throws Exception
     */
    public static void deleteDB(DBManager db, Integer idAlumno) throws Exception {
        if (db==null) throw new Exception("DBAlumno Error: DBManager NO especificado");
        if (idAlumno==null) throw new Exception("DBAlumno Error: Identificador NO especificado");
        String query = "SELECT pr_deletealumno(?)";
        db.prepare(query);
        db.setInt(1, idAlumno);
        db.execute();
    }

    /**
     * Genera una lista de alumnos.
     *
     * @param db
     * @param limit
     * @param offset
     * @return
     * @throws Exception
     */
    public static List loadList(DBManager db, int limit, int offset) throws Exception {
        if (db==null) throw new Exception("DBAlumno Error: DBManager NO especificado");
        if (limit<0) throw new Exception("DBAlumno Error: limit incorrecto");
        if (offset<0) throw new Exception("DBAlumno Error: offset incorrecto");
        List alumnos = new ArrayList();
        String query = "SELECT * " +
                "FROM alumno a " +
              //  "WHERE " +
                "ORDER BY a.legajo ";
        if (limit>0) query += "LIMIT " + limit + "OFFSET " + offset;
        ResultSet rs = db.executeQuery(query);

        Alumno alumno = null;
        while ((alumno = buildAlumno(rs)) != null) {
            alumnos.add(alumno);
        }
        rs.close();

        return alumnos;
    }

    /**
     * Genera una lista de alumnos.
     *
     * @param db
     * @return
     * @throws Exception
     */
    public static List loadList(DBManager db) throws Exception {
        return loadList(db, 0, 0);
    }

}
