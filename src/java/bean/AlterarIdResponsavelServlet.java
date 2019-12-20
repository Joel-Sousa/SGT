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
public class AlterarIdResponsavelServlet extends HttpServlet {

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
            
            int id = Integer.parseInt(request.getParameter("id"));
            
             ResponsavelDTO rDTO = new ResponsavelDTO();

             Connection con;
             
            try {
                 con = DAO.Conexao();
                   ResponsavelDAO uDAO = new ResponsavelDAO(con);
                   rDTO = uDAO.pesquisar(id);
                   RequestDispatcher rd = 
                    request.getRequestDispatcher("alterarResponsavel.jsp");
                    rd.forward(request, response);}
               catch(Exception e){

                       }
        	String msg = "";
                
		if (rDTO == null) {

			msg = "Não foram encontrados registros.";

			request.setAttribute("msgResposta", msg);

			RequestDispatcher enviar = request
					.getRequestDispatcher("lista.jsp");
			enviar.forward(request, response);

		} else {
                        request.setAttribute("chv_fun_responsavel", rDTO.getChv_fun_responsavel());
                        request.setAttribute("nm_resp", rDTO.getNm_resp());
                        request.setAttribute("funcao", rDTO.getFuncao());
//                        request.setAttribute("modo_visualizacao", rDTO.getModo_visualizacao());
                        request.setAttribute("color", rDTO.getColor());
                        request.setAttribute("cod_resp", rDTO.getCod_resp());
			
                        RequestDispatcher lista = request
					.getRequestDispatcher("alterarResponsavel.jsp");
			lista.forward(request, response);
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
