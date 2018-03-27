/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utn.frc.dlc.sac.web.ctrl.alumnos;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utn.frc.dlc.sac.SAC;
import utn.frc.dlc.sac.db.DBAlumno;
import utn.frc.dlc.sac.db.DBManager;
import utn.frc.dlc.sac.web.ErrorMsg;

/**
 *
 * @author scarafia
 */
@WebServlet(name="CtrlAlumnos", urlPatterns={"/alumnos"})
public class CtrlAlumnos extends HttpServlet {
   
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
        String errorTitle = "No se pudo cargar los alumnos";
        String dest = "/error.jsp";
        DBManager db = null;

        try {
            //----------------------------------------
            //if (request.getParameter("populate") != null) SAC.populateAlumnos();
            //List alumnos = SAC.getAlumnosList();
            //----------------------------------------
            //db = SAC.getSingleDB();
            //List alumnos = DBAlumno.loadList(db);
            //----------------------------------------
            db = SAC.getPoolDB();
            List alumnos = DBAlumno.loadList(db);
            //----------------------------------------

            request.setAttribute("alumnos", alumnos);
            dest = "/alumnos.jsp";

        } catch (Exception e) {
            errorMsg = new ErrorMsg(errorTitle, e.getMessage());
            request.setAttribute("errorMsg", errorMsg);
        } finally {
            if (db != null) db.close();
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
