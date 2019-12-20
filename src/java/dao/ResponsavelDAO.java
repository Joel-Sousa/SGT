/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.ResponsavelDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Joe
 */
public class ResponsavelDAO {
    
    private Connection con;
    
    public ResponsavelDAO(Connection con){
        this.con = con;
    }
    public ArrayList<ResponsavelDTO> pesquisarTudo () throws SQLException {
       ArrayList<ResponsavelDTO> listaR = new ArrayList<ResponsavelDTO>();
         try{
         String sql = "SELECT chv_fun_responsavel,nm_resp,funcao,cod_resp FROM hst_responsaveis";
         
        PreparedStatement stmt = con.prepareStatement(sql);
         
        ResultSet rs = stmt.executeQuery();
         
         stmt.execute();
         stmt.close();
         
         ResponsavelDTO rgsts ;
         while (rs.next()){ 
           rgsts = new ResponsavelDTO();
           
           rgsts.setChv_fun_responsavel(rs.getString("chv_fun_responsavel"));
           rgsts.setNm_resp(rs.getString("nm_resp"));
           rgsts.setFuncao(rs.getString("funcao"));
           rgsts.setCod_resp(rs.getInt("cod_resp"));
           
           listaR.add(rgsts); 
         } 
         con.close();
       }catch (SQLException e){
           System.out.println("Erro " + e.getMessage());
     } 
       return listaR;
     }
    
    public ResponsavelDTO pesquisar(int id) throws SQLException {
        try {
            ResponsavelDTO registro = new ResponsavelDTO();
            
            String sql = "SELECT * FROM hst_responsaveis where cod_resp = "+id+" ";
            
            PreparedStatement stmt = con.prepareStatement(sql);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
           registro.setChv_fun_responsavel(rs.getString("chv_fun_responsavel"));
           registro.setNm_resp(rs.getString("nm_resp"));
           registro.setFuncao(rs.getString("funcao"));
//           registro.setModo_visualizacao(rs.getString("modo_visualizacao"));
           registro.setColor(rs.getString("color"));
           registro.setCod_resp(rs.getInt("cod_resp"));
                return registro;
            }
            
        } catch (SQLException e) {
        }
        return null;
	}
    
    public void alterar(ResponsavelDTO registro)throws SQLException{
        try {
            
            String sql = "UPDATE hst_responsaveis SET chv_fun_responsavel = ?,"
                    + "                               nm_resp = ?,"
                    + "                               funcao = ?,"
                    + "                               modo_visualizacao = null,"
                    + "                               color = ? "
                    
                    + "WHERE cod_resp = ?";
            
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, registro.getChv_fun_responsavel());
            stmt.setString(2, registro.getNm_resp());
            stmt.setString(3, registro.getFuncao());
//            stmt.setString(4, registro.getModo_visualizacao());
            stmt.setString(4, registro.getColor());
            stmt.setInt(5, registro.getCod_resp());
            
            stmt.execute();
            stmt.close();
            
        } catch (SQLException e) {
        }
    }
   public void deletar(ResponsavelDTO dto) throws SQLException{
         
         String sql = "DELETE FROM hst_responsaveis WHERE cod_resp = ?";
         
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setInt(1, dto.getCod_resp());
         stmt.execute();
         stmt.close();
     }
}
