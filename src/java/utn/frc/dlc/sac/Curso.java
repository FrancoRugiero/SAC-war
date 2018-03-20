/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utn.frc.dlc.sac;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author scarafia
 */
public class Curso {
    private int id = 0;
    private String nombre = null;
    private String descripcion = null;
    private Fecha fechaAlta = null;
    private Fecha fechaBaja = null;
    private int inscriptos = 0;
    private List alumnos = null;

    public Curso() {
        super();
    }

    public Curso(int id, String nombre, String descripcion, Fecha fechaAlta, Fecha fechaBaja, int inscriptos) {
        super();
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechaAlta = fechaAlta;
        this.fechaBaja = fechaBaja;
        this.inscriptos = inscriptos;
    }

    public Curso(int id, String nombre, String descripcion, Fecha fechaAlta, Fecha fechaBaja) {
        this(id, nombre, descripcion, fechaAlta, fechaBaja, 0);
    }

    public Curso(int id, String nombre, String descripcion) {
        this(id, nombre, descripcion, null, null);
    }

    public Curso(String nombre, String descripcion) {
        this(0, nombre, descripcion);
    }

    public Curso(String nombre) {
        this(nombre, null);
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the fechaAlta
     */
    public Fecha getFechaAlta() {
        return fechaAlta;
    }

    /**
     * @param fechaAlta the fechaAlta to set
     */
    public void setFechaAlta(Fecha fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    /**
     * @return the fechaBaja
     */
    public Fecha getFechaBaja() {
        return fechaBaja;
    }

    /**
     * @param fechaBaja the fechaBaja to set
     */
    public void setFechaBaja(Fecha fechaBaja) {
        this.fechaBaja = fechaBaja;
    }

    /**
     * @return the inscriptos
     */
    public int getInscriptos() {
        return inscriptos;
    }

    /**
     * @param inscriptos the inscriptos to set
     */
    public void setInscriptos(int inscriptos) {
        this.inscriptos = inscriptos;
    }

    /**
     * @return the alumnos
     */
    public List getAlumnos() {
        return alumnos;
    }

    /**
     * @param alumnos the alumnos to set
     */
    public void setAlumnos(List alumnos) {
        this.alumnos = alumnos;
    }

    public void addAlumno(Alumno alumno) {
        if (this.alumnos==null) {
            this.alumnos = new ArrayList();
        }
        if (alumno != null) {
            this.alumnos.add(alumno);
        }
    }

    public void removeAlumno(int id) {
        if (this.alumnos != null) {
            int index = 0;
            boolean found = false;
            Iterator it = this.alumnos.iterator();
            while (!found && it.hasNext()) {
                Alumno a = (Alumno) it.next();
                if (found = id == a.getId()) {
                    this.alumnos.remove(index);
                }
                index++;
            }
        }
    }

    public void removeAlumno(Alumno alumno) {
        removeAlumno(alumno.getId());
    }

    public boolean hasAlumno(int id) {
        boolean found = false;
        if (this.alumnos != null) {
            Iterator it = this.alumnos.iterator();
            while (!found && it.hasNext()) {
                Alumno a = (Alumno) it.next();
                found = id == a.getId();
            }
        }
        return found;
    }

    public boolean hasAlumno(Alumno alumno) {
        return this.hasAlumno(alumno.getId());
    }

    public String toString() {
        return nombre;
    }

}
