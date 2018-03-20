/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utn.frc.dlc.sac;

/**
 *
 * @author scarafia
 */
public class Alumno {
    private int id = 0;
    private String legajo = null;
    private String apellido = null;
    private String nombre = null;
    private String dni = null;
    private String observaciones = null;

    public Alumno() {
        super();
    }

    public Alumno(int id, String apellido, String nombre, String dni, String legajo) {
        super();
        this.id = id;
        this.apellido = apellido;
        this.nombre = nombre;
        this.dni = dni;
        this.legajo = legajo;
    }

    public Alumno(String apellido, String nombre, String dni, String legajo) {
        this(0, apellido, nombre, dni, legajo);
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
     * @return the legajo
     */
    public String getLegajo() {
        return legajo;
    }

    /**
     * @param legajo the legajo to set
     */
    public void setLegajo(String legajo) {
        this.legajo = legajo;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
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
     * @return the dni
     */
    public String getDni() {
        return dni;
    }

    /**
     * @param dni the dni to set
     */
    public void setDni(String dni) {
        this.dni = dni;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String toString() {
        return nombre + " " + apellido;
    }

}
