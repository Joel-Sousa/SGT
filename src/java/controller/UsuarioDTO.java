/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Joe
 */
public class UsuarioDTO {
    private Integer codigo;
    private String id;
    private String usuario;
    private String senha;
    private String perfil;

    public Integer getCodigo() {
        return codigo;
    }
    
    public String getId(){
        return this.id;
    }
    
    public String getUsuario(){
        return this.usuario;
    }
    
    public String getSenha(){
        return this.senha;
    }
            
    public String getPerfil(){
        return this.perfil;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }
    
    public void setId(String id){
        this.id = id;
    }
    
    public void setUsuario(String usuario){
        this.usuario = usuario;
    }
    
    public void setSenha(String senha){
        this.senha = senha;
    }
    
    public void setPerfil(String perfil){
        this.perfil = perfil;
    }
}
