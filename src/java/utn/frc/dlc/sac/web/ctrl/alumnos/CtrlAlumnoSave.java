/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utn.frc.dlc.sac.web.ctrl.alumnos;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utn.frc.dlc.sac.Alumno;
import utn.frc.dlc.sac.SAC;
import utn.frc.dlc.sac.db.DBAlumno;
import utn.frc.dlc.sac.db.DBManager;
import utn.frc.dlc.sac.web.ErrorMsg;

/**
 *
 * @author scarafia
 */
public class CtrlAlumnoSave extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        out.close();

        ErrorMsg errorMsg = null;
        String errorTitle = "No se pudo guardar el alumno";
        String dest = "/error.jsp";
        DBManager db = null;

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String apellido = request.getParameter("apellido");
            String nombre = request.getParameter("nombre");
            String dni = request.getParameter("dni");
            String legajo = request.getParameter("legajo");
            Alumno alumno = new Alumno(id, apellido, nombre, dni, legajo);
            try {
                //----------------------------------------
                //SAC.updateAlumno(alumno);
                //----------------------------------------
                db = SAC.getSingleDB();
                if (id == 0) {
                    id = DBAlumno.getNextId(db);
                    alumno.setId(id);
                }
                DBAlumno.saveDBError(db, alumno);
                //----------------------------------------
                //db = SAC.getPoolDB();
                //if (id == 0) {
                //    id = DBAlumno.getNextId(db);
                //    alumno.setId(id);
                //}
                //DBAlumno.saveDBError(db, alumno);
                //----------------------------------------

                dest = "/alumno.jsp";

            } catch (Exception e) {
                request.setAttribute("formMsg", e.getMessage());
                dest = "/alumno.form.jsp";
            } finally {
                if (db!=null) db.close();
            }
            request.setAttribute("alumno", alumno);

        } catch (Exception e) {
            errorMsg = new ErrorMsg(errorTitle, e.getMessage());
            request.setAttribute("errorMsg", errorMsg);
        }

        ServletContext app = this.getServletContext();
        RequestDispatcher disp = app.getRequestDispatcher(dest);
        disp.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
