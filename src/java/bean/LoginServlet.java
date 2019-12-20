/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;


import dao.FactoryConnection_MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author joe
 */
public class LoginServlet extends HttpServlet {

    //private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigoB = "";
        String idB = "";
        String usuarioB = "";
        String senhaB = "";
        String perfilB = "";
        
        Connection con;
        
        //String id = request.getParameter("id");
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        
        String sql = "SELECT * FROM hst_usuario WHERE usuario = ? AND senha = ?";
        
        try {
            con = FactoryConnection_MySQL.getConnection(sql);
            
            PreparedStatement stmt = con.prepareStatement(sql);
//            stmt.setString(1, idB);
            stmt.setString(1, usuario);
            stmt.setString(2, senha);

            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                codigoB = rs.getString("codigo");
                idB = rs.getString("id");
                usuarioB = rs.getString("usuario");
                senhaB = rs.getString("senha");
                perfilB = rs.getString("perfil");
            }
            rs.close();
            stmt.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
        if (usuarioB.equals(usuario) && senhaB.equals(senha)) {
            
            HttpSession session = request.getSession();
            session.setAttribute("id", idB);
            session.setAttribute("usuario", usuario);
            session.setAttribute("perfil", perfilB);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } else {
            String resp = "5";
            request.setAttribute("resp",resp);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        }

    }

}
