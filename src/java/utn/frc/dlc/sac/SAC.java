/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utn.frc.dlc.sac;

//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.Hashtable;
//import java.util.Iterator;
//import java.util.List;
import utn.frc.dlc.sac.db.DBManager;

/**
 *
 * @author scarafia
 */
public abstract class SAC {

    // DATABASE
    private static String DBUrl = "jdbc:postgresql://localhost:5432/sacdb";
    private static String DBUserName = "dlcusr";
    private static String DBPassword = "dlcpwd";

    private static String DBResourceName = "jdbc/sacdb";

    public static DBManager getSingleDB() throws Exception {
        DBManager db = new DBManager();
        db.setConnectionMode(DBManager.SINGLECONNECTIONMODE);
        db.setDriverName(DBManager.POSTGRESDRIVERNAME);
        db.setUrl(DBUrl);
        db.setUserName(DBUserName);
        db.setPassword(DBPassword);
        db.connect();
        return db;
    }

    public static DBManager getPoolDB() throws Exception {
        DBManager db = new DBManager();
        db.setConnectionMode(DBManager.POOLCONNECTIONMODE);
        db.setResourceName(DBResourceName);
        db.connect();
        return db;
    }

    // HELPER FUNCTIONS
//    private static int sequence = 0;
//    private static Hashtable alumnos = null;
//    private static Hashtable cursos = null;
//
//    public static int nextID() {
//        return ++sequence;
//    }
//
//    public static Hashtable getAlumnos() {
//        if (alumnos == null) alumnos = new Hashtable();
//        return alumnos;
//    }
//
//    public static List getAlumnosList() {
//        Collection aux = getAlumnos().values();
//        return new ArrayList(aux);
//    }
//
//    public static Alumno getAlumno(int id) {
//        Alumno alumno = null;
//        if (alumnos != null) {
//            alumno = (Alumno) alumnos.get(id);
//        }
//        return alumno;
//    }
//
//    public static int updateAlumno(Alumno alumno) throws Exception {
//        if (alumno == null) {
//            throw new Exception("ALUMNO ERROR: alumno vacío.");
//        }
//        if (alumno.getApellido() == null || alumno.getApellido().equals("")
//                || alumno.getNombre() == null || alumno.getNombre().equals("")
//                || alumno.getDni() == null || alumno.getDni().equals("")
//                || alumno.getLegajo() == null || alumno.getLegajo().equals("")) {
//            throw new Exception("ALUMNO ERROR: datos incorrectos.");
//        }
//        if (alumnos == null) {
//            alumnos = new Hashtable();
//        }
//
//        int id = alumno.getId();
//        if (id < 1) {
//            id = nextID();
//            alumno.setId(id);
//        }
//
//        alumnos.put(id, alumno);
//
//        return id;
//    }
//
//    public static void deleteAlumno(int id) {
//        if (alumnos != null) alumnos.remove(id);
//    }
//
//    public static Hashtable getCursos() {
//        if (cursos == null) cursos = new Hashtable();
//        return cursos;
//    }
//
//    public static List getCursosList() {
//        Collection aux = getCursos().values();
//        return new ArrayList(aux);
//    }
//
//    public static Curso getCurso(int id) {
//        Curso curso = null;
//        if (cursos != null) curso = (Curso) cursos.get(id);
//        return curso;
//    }
//
//    public static int updateCurso(Curso curso) throws Exception {
//        if (curso == null) {
//            throw new Exception("CURSO ERROR: curso vacío.");
//        }
//        if (curso.getNombre() == null || curso.getNombre().equals("")) {
//            throw new Exception("CURSO ERROR: curso incorrecto.");
//        }
//        if (cursos == null) {
//            cursos = new Hashtable();
//        }
//
//        int id = curso.getId();
//        if (id < 1) {
//            id = nextID();
//            curso.setId(id);
//        }
//
//        cursos.put(id, curso);
//
//        return id;
//    }
//
//    public static void deleteCurso(int id) {
//        if (cursos != null) cursos.remove(id);
//    }
//
//    public static List getCanditatos(Curso curso) {
//        List candidatos = new ArrayList();
//        if (alumnos!=null) {
//            Iterator it = alumnos.values().iterator();
//            while (it.hasNext()) {
//                Alumno a = (Alumno) it.next();
//                if (!curso.hasAlumno(a)) {
//                    candidatos.add(a);
//                }
//            }
//        }
//        return candidatos;
//    }
//
//    public static void populateAlumnos() throws Exception {
//        if (alumnos == null) alumnos = new Hashtable();
//        if (alumnos.isEmpty()) {
//            updateAlumno(new Alumno("Newton", "Isaac", "99.999.999", "10.001"));
//            updateAlumno(new Alumno("Einstein", "Albert", "99.999.999", "10.002"));
//            updateAlumno(new Alumno("Bohr", "Niels", "99.999.999", "10.003"));
//            updateAlumno(new Alumno("Huygens", "Christiaan ", "99.999.999", "10.004"));
//            updateAlumno(new Alumno("Leibniz", "Gottfreid", "99.999.999", "10.005"));
//            updateAlumno(new Alumno("Galilei", "Galileo", "99.999.999", "10.006"));
//            updateAlumno(new Alumno("Joule", "James Prescott", "99.999.999", "10.007"));
//            updateAlumno(new Alumno("Mastropiero", "Johann Sebastian", "99.999.999", "10.008"));
//            updateAlumno(new Alumno("Morricone", "Enio", "99.999.999", "10.009"));
//            updateAlumno(new Alumno("Vivaldi", "Antonio", "99.999.999", "10.010"));
//            updateAlumno(new Alumno("Van Beethoven", "Ludwig", "99.999.999", "10.011"));
//            updateAlumno(new Alumno("Bach", "Johann Sebastian", "99.999.999", "10.012"));
//            updateAlumno(new Alumno("Strauss", "Johann", "99.999.999", "10.013"));
//            updateAlumno(new Alumno("Mozart", "Wolfgang Amadeus", "99.999.999", "10.014"));
//            updateAlumno(new Alumno("Sartre", "Jean Paul", "99.999.999", "10.015"));
//            updateAlumno(new Alumno("Descartes", "René", "99.999.999", "10.016"));
//            updateAlumno(new Alumno("Kant", "Immanuel", "99.999.999", "10.017"));
//            updateAlumno(new Alumno("Nietzsche", "Friedrich", "99.999.999", "10.018"));
//            updateAlumno(new Alumno("Heidegger", "Martin", "99.999.999", "10.019"));
//            updateAlumno(new Alumno("Schopenhauer", "Arthur", "99.999.999", "10.020"));
//            updateAlumno(new Alumno("Comte", "Auguste", "99.999.999", "10.021"));
//        }
//    }
//
//    public static void populateCursos() throws Exception {
//        if (cursos == null) cursos = new Hashtable();
//        if (cursos.isEmpty()) {
//            updateCurso(new Curso("Física", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae dolor eget felis pellentesque sagittis non in odio. Maecenas risus nibh, feugiat quis varius eu, mollis sit amet massa. Vivamus."));
//            updateCurso(new Curso("Música", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae dolor eget felis pellentesque sagittis non in odio. Maecenas risus nibh, feugiat quis varius eu, mollis sit amet massa. Vivamus."));
//            updateCurso(new Curso("Filosofía", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae dolor eget felis pellentesque sagittis non in odio. Maecenas risus nibh, feugiat quis varius eu, mollis sit amet massa. Vivamus."));
//        }
//    }

}
