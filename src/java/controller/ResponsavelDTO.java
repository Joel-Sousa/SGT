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
public class ResponsavelDTO {
    private String chv_fun_responsavel;
    private String nm_resp;
    private String funcao;
    private String modo_visualizacao;
    private String color;
    private Integer cod_resp;

    public String getChv_fun_responsavel() {
        return chv_fun_responsavel;
    }

    public String getNm_resp() {
        return nm_resp;
    }

    public String getFuncao() {
        return funcao;
    }

    public String getModo_visualizacao() {
        return modo_visualizacao;
    }

    public String getColor() {
        return color;
    }

    public Integer getCod_resp() {
        return cod_resp;
    }

    public void setChv_fun_responsavel(String chv_fun_responsavel) {
        this.chv_fun_responsavel = chv_fun_responsavel;
    }

    public void setNm_resp(String nm_resp) {
        this.nm_resp = nm_resp;
    }

    public void setFuncao(String funcao) {
        this.funcao = funcao;
    }

    public void setModo_visualizacao(String modo_visualizacao) {
        this.modo_visualizacao = modo_visualizacao;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setCod_resp(Integer cod_resp) {
        this.cod_resp = cod_resp;
    }
    
    
}
