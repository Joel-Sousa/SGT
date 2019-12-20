/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.UsuarioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Joe
 */
public class UsuarioDAO {
    
    private Connection con;
    
    public UsuarioDAO(Connection con){
        this.con = con;
    }
        
    public void cadastrarUsuario(UsuarioDTO usr) throws SQLException{
        
        try {
            String sql = "INSERT INTO hst_usuario(codigo,id,usuario,senha,perfil) VALUES(null,?,?,?,?) ";
            
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, usr.getId());
            stmt.setString(2, usr.getUsuario());
            stmt.setString(3, usr.getSenha());
            stmt.setString(4, usr.getPerfil());
            
            stmt.execute();
            stmt.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            con.close();
        }
    } 
    
    public ArrayList<UsuarioDTO> pesquisarTudo () throws Exception {
       ArrayList<UsuarioDTO> listaNomes = new ArrayList<UsuarioDTO>();
         try{
         String sql = "SELECT codigo,id,usuario,perfil FROM hst_usuario";
         
        PreparedStatement stmt = con.prepareStatement(sql);
         
        ResultSet rs = stmt.executeQuery();
         
         stmt.execute();
         stmt.close();
         
         UsuarioDTO rgsts ;
         
         while (rs.next()){ 
           rgsts = new UsuarioDTO();
           rgsts.setCodigo(rs.getInt("codigo"));
           rgsts.setId(rs.getString("id"));
           rgsts.setUsuario(rs.getString("usuario"));
           rgsts.setPerfil(rs.getString("perfil"));
           
           listaNomes.add(rgsts); 
         } 
         con.close();
       }catch (Exception e){
           System.out.println("Erro " + e.getMessage());
     } 
       return listaNomes;
     }
    
    public UsuarioDTO pesquisar(int codigo) throws Exception {
        try {
            UsuarioDTO registro = new UsuarioDTO();
            
            String sql = "SELECT * FROM hst_usuario where codigo = "+codigo+" ";
            
            PreparedStatement stmt = con.prepareStatement(sql);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                registro.setCodigo(rs.getInt("codigo"));
                registro.setId(rs.getString("id"));
                registro.setUsuario(rs.getString("usuario"));
                registro.setSenha(rs.getString("senha"));
                 registro.setPerfil(rs.getString("perfil"));
                return registro;
            }
            
        } catch (Exception e) {
        }
        return null;
	}
    public void alterar(UsuarioDTO registro)throws Exception{
        try {
            
            String sql = "UPDATE hst_usuario SET id=?, usuario=?, senha=?, perfil=? WHERE codigo=?";
            
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, registro.getId());
            stmt.setString(2, registro.getUsuario());
            stmt.setString(3, registro.getSenha());
            stmt.setString(4, registro.getPerfil());
            stmt.setInt(5, registro.getCodigo());
            
            
            stmt.execute();
            stmt.close();
            
        } catch (Exception e) {
        }
    }
   public void deletar(UsuarioDTO nt) throws Exception{
         
         String sql = "DELETE FROM hst_usuario WHERE codigo = ?";
         
         PreparedStatement stmt = con.prepareStatement(sql);
         
         stmt.setInt(1, nt.getCodigo());
         stmt.execute();
         stmt.close();
     }
   
  
    
}


