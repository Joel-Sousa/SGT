/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import controller.ResponsavelDTO;
import dao.DAO;
import dao.ResponsavelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joe
 */
public class AlterarResponsavelServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String chv_fun_reponsavel = request.getParameter("chv_fun_responsavel");
            String nm_resp = request.getParameter("nm_resp");
            String funcao = request.getParameter("funcao");
            String color = request.getParameter("color");
            Integer cod_resp = Integer.parseInt(request.getParameter("cod_resp"));

            Connection con;

            ResponsavelDTO rDTO = new ResponsavelDTO();

            try {
                con = DAO.Conexao();
                
                rDTO.setChv_fun_responsavel(chv_fun_reponsavel);
                rDTO.setNm_resp(nm_resp);
                rDTO.setFuncao(funcao);
                rDTO.setColor(color);
                rDTO.setCod_resp(cod_resp);

                ResponsavelDAO rDAO = new ResponsavelDAO(con);
                rDAO.alterar(rDTO);
                request.setAttribute("Noticia", "Dados atualizados");
                RequestDispatcher rd
                        = request.getRequestDispatcher("alteradoResponsavel.jsp");
                rd.forward(request, response);
            } catch (Exception e) {
                //out.println(e);
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
