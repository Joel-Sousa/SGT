
<%@page import="java.io.IOException"%>
<%@page import="dao.FactoryConnection_MySQL"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="sun.misc.BASE64Decoder"%>

<%!
    public ResultSet encheHistoria() {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "CASE WHEN D.CMTR IS NULL THEN ''  ELSE D.CMTR END AS COMENTARIO, "
                    + "a.CD_QUADRO, "
                    + "a.NM_QUADRO, "
                    + "b.ID_HST, "
                    + "b.DESCRICAO, "
                    + "b.RESUMO, "
                    + "b.CHV_FUN_RESPONSAVEL, "
                    + "b.SITUACAO, "
                    + "b.PRIORIDADE, "
                    + "c.NM_RESP "
                    + "FROM hst_quadro a "
                    + "LEFT JOIN hst_tb_historias b on a.CD_QUADRO=b.CD_QUADRO "
                    + "LEFT JOIN hst_responsaveis c ON b.CHV_FUN_RESPONSAVEL=c.CHV_FUN_RESPONSAVEL "
                    + "LEFT JOIN hst_tb_comentario d ON d.ID_HST=B.ID_HST");

            //   System.out.println("encheHistoria" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public ResultSet encheQuadro(String CHV_FUN_RESPONSAVEL) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "CASE WHEN QTD_HST is null THEN '' ELSE QTD_HST END AS QTD_HST, "
                    + "a.CD_QUADRO, "
                    + "NM_QUADRO, "
                    + "SITUACAO_QUADRO, "
                    + "NM_RESP,   "
                    + "CHV_FUN_GRAVACAO,   "
                    + "FUNCAO   "
                    + "QTD_HST "
                    + "FROM hst_quadro a  "
                    + "INNER JOIN hst_responsaveis b on a.CHV_FUN_RESPONSAVEL=b.CHV_FUN_RESPONSAVEL  "
                    + "LEFT JOIN ( "
                    + "SELECT "
                    + "DT_PREVISTA, "
                    + "DT_EFETIVA, "
                    + "CD_QUADRO, "
                    + "count(CD_QUADRO) as QTD_HST "
                    + "FROM hst_tb_historias "
                    + "GROUP BY CD_QUADRO "
                    + ")c on c.CD_QUADRO=a.CD_QUADRO "
                    + " "
                    + "WHERE b.CHV_FUN_RESPONSAVEL=? "
                    + " "
                    + "group by NM_QUADRO "
                    + "ORDER  BY CD_QUADRO DESC"
                    + "");

//            System.out.println("encheQuadro" + state);
            state.setString(1, CHV_FUN_RESPONSAVEL);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public ResultSet encheQuadroFuncionario() {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "CHV_FUN_RESPONSAVEL, "
                    + "COLOR, "
                    + "NM_RESP, "
                    + "FUNCAO "
                    + "from hst_responsaveis ORDER BY  COD_RESP  ");

//            System.out.println("encheQuadroFuncionario" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public ResultSet detalhaHistoria(String cd_sis) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "ID_HST, "
                    + "RESUMO, "
                    + "RESUMO, "
                    + "NM_SIS, "
                    + "b.CD_SIS, "
                    + " SITUACAO, "
                    + "DESCRICAO, "
                    + "DT_REQUISICAO, "
                    + "PRIORIDADE "
                    + "FROM "
                    + "hst_tb_historias a, pt_sis b "
                    + "WHERE b.CD_SIS =? ");

            state.setString(1, cd_sis);

            //System.out.println("listaAgenda:" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public boolean excluirHistoria(String id_hst) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("delete from hst_tb_historias where ID_HST= ? ");

            state.setString(1, id_hst);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;
    }

    public ResultSet detalhaHistoriaId(String id_hst) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "ID_HST, "
                    + "RESUMO,"
                    + "SITUACAO, "
                    + "CD_SIS, "
                    + "DESCRICAO, "
                    + "DT_REQUISICAO,"
                    + "PRIORIDADE "
                    + "FROM "
                    + "hst_tb_historias "
                    + "WHERE ID_HST =? ");

            state.setString(1, id_hst);

            //System.out.println("listaAgenda:" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public boolean alteraHistoria(String Resumo, String Descricao, String situacao, String prioridade, String id_hst) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("sistema_rotina").prepareStatement(" update hst_tb_historias "
                    + " set RESUMO= ? ,  DESCRICAO= ? , SITUACAO = ? , PRIORIDADE= ? "
                    + " where ID_HST = ? ");

            state.setString(1, Resumo);
            state.setString(2, Descricao);
            state.setString(3, situacao);
            state.setString(4, prioridade);
            state.setString(5, id_hst);

            //   System.out.println("GravarRespostaAutomatica state:" + state);	        
            ok = !state.execute();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ok;
    }

    public ResultSet encheSistema() {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "CD_SIS, "
                    + "NM_SIS "
                    + "FROM "
                    + "pt_sis ");
            //System.out.println("listaAgenda:" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public boolean gravaQuadro(String NM_QUADRO, String chv_fun_gravacao, String CHV_FUN_RESPONSAVEL) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("INSERT INTO hst_quadro (NM_QUADRO,CHV_FUN_GRAVACAO, DT_GRAVACAO,  CHV_FUN_RESPONSAVEL, SITUACAO_QUADRO)  "
                    + " VALUES (?,?,CURDATE(),?,0) ");

            state.setString(1, NM_QUADRO);
            state.setString(2, chv_fun_gravacao);
            //     state.setString(3,dt_entrega );
            state.setString(3, CHV_FUN_RESPONSAVEL);

            //System.out.println("gravaQuadro" + state);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;

    }

    public boolean gravaHistoria(String DESCRICAO, String CHV_FUN_REQUISICAO, String CD_QUADRO) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("INSERT INTO hst_tb_historias ( DESCRICAO, SITUACAO, DT_REQUISICAO, CHV_FUN_REQUISICAO, CD_QUADRO) "
                    + "VALUES (?,'0',CURDATE(),?,?) ");

            //state.setString(1,RESUMO );	
            state.setString(1, DESCRICAO);
            //state.setString(3,SITUACAO );
            //state.setString(4,DT_REQUISICAO );
            state.setString(2, CHV_FUN_REQUISICAO);
            state.setString(3, CD_QUADRO);

            // System.out.println("gravaHistoria"+state);
            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;

    }

    public ResultSet detalhaQuadro(String CD_QUADRO) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "a.ID_HST, "
                    + "a.ID_HST, "
                    + " RESUMO, "
                    + " a.CD_QUADRO, "
                    + "SITUACAO_QUADRO, "
                    + " NM_QUADRO, "
                    + " case when DESCRICAO is null then '' else DESCRICAO end as DESCRICAO, "
                    + " case when DT_PREVISTA is null then '' else DATE_FORMAT (DT_PREVISTA,'%d/%m/%Y')  end as DT_PREVISTA, "
                    + " case when DT_REQUISICAO is null then '' else DATE_FORMAT (DT_REQUISICAO,'%d/%m/%Y')  end as DT_REQUISICAO, "
                    + "case when DT_EFETIVA is null then '' else DATE_FORMAT (DT_EFETIVA,'%d/%m/%Y')  end as DT_EFETIVA, "
                    + " SITUACAO, "
                    + " PRIORIDADE "
                    + " FROM "
                    + " hst_tb_historias a "
                    + " LEFT JOIN hst_tb_comentario d ON d.ID_HST=a.ID_HST "
                    + " LEFT JOIN hst_quadro e ON e.CD_QUADRO=a.CD_QUADRO "
                    + " WHERE a.CD_QUADRO= " + CD_QUADRO + " "
                     // + "GROUP BY  a.ID_HST "
                    + "ORDER BY a.ID_HST DESC");

//            state.setString(1, CD_QUADRO);
  //              System.out.println("detalhaQuadro" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    /*  teste ambiente interativo*/
    public ResultSet carregaRespostas_old(String ID_HST) {
        PreparedStatement state = null;
        ResultSet rsloc = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("SELECT SQL_CACHE "
                    + " CASE WHEN  b.NM_RESP IS NULL THEN '' ELSE  b.NM_RESP END as nome,  "
                    + " CASE WHEN CMTR IS NULL THEN '' ELSE CMTR END as CMTR,  "
                    + " CASE WHEN CMTR IS NULL THEN '' ELSE CMTR END as CMTR,  "
                    + " ID_HST,   "
                    + " ID_CMTR,   "
                    + " CHV_FUN_CMTR,   "
                    + " DATE_FORMAT(DT_CMTR,'%d/%m/%Y %H:%i') as DT_CMTR    "
                    + "FROM hst_tb_comentario a    "
                    + " LEFT JOIN hst_responsaveis b on a.CHV_FUN_CMTR=b.CHV_FUN_RESPONSAVEL  "
                    + " WHERE  ID_HST=? "
                    //+ "dt_sugestao>date_sub(CURDATE(), interval 8 day)  " 
                    //+ "and publicar=1  "
                    + "order by ID_CMTR  ");

            state.setString(1, ID_HST);

            System.out.println("carregaRespostas state : "+state);
            rsloc = state.executeQuery();
        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("FiltroSituacaoLimite - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rsloc;
    }

 public ResultSet carregaRespostas(String ID_HST) {
        PreparedStatement state = null;
        ResultSet rsloc = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("SELECT SQL_CACHE "
            + "CASE WHEN  b.usuario IS NULL THEN '' ELSE  b.usuario END as usuario,  "
            + " CASE WHEN CMTR IS NULL THEN '' ELSE CMTR END as CMTR, "
            + "CASE WHEN CMTR IS NULL THEN '' ELSE CMTR END as CMTR, " 
            + " ID_HST,    ID_CMTR,    CHV_FUN_CMTR,    DATE_FORMAT(DT_CMTR,'%d/%m/%Y %H:%i') as DT_CMTR "
            + " FROM hst_tb_comentario a   "
            + " LEFT JOIN hst_usuario b on a.CHV_FUN_CMTR=b.id "
            + "WHERE  ID_HST=?  "
            + "order by ID_CMTR  ");

            state.setString(1, ID_HST);

            System.out.println("carregaRespostas state : "+state);
            rsloc = state.executeQuery();
        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("FiltroSituacaoLimite - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rsloc;
    }

    public boolean classificaHistoria(String DT_EFETIVA, String DT_PREVISTA, String SITUACAO, String ID_HST) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("UPDATE hst_tb_historias "
                    + "SET DT_EFETIVA=? , DT_PREVISTA=? , SITUACAO=? "
                    + "WHERE ID_HST= ?");

            state.setString(1, DT_EFETIVA);
            state.setString(2, DT_PREVISTA);
            state.setString(3, SITUACAO);
            state.setString(4, ID_HST);

            System.out.println("classificaHistoria" + state);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;

    }

    public boolean classificaHistoria1(String DT_PREVISTA, String SITUACAO, String ID_HST) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("UPDATE hst_tb_historias "
                    + "SET DT_PREVISTA=? , SITUACAO=? "
                    + "WHERE ID_HST= ? ");

//        state.setString(1,DT_EFETIVA );	
            state.setString(1, DT_PREVISTA);
            state.setString(2, SITUACAO);
            state.setString(3, ID_HST);

            System.out.println("classificaHistoria1" + state);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;

    }

    public boolean confirmarComentario(String CMTR, String CHV_CMTR, String ID_HST) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("INSERT INTO hst_tb_comentario () VALUES ( NULL, ?, NOW() ,?,? )");

            state.setString(1, CMTR);
            state.setString(2, CHV_CMTR);
            state.setString(3, ID_HST);

            System.out.println("confirmarComentario" + state);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;

    }

    public ResultSet encheComentario(String ID_HST) {
        PreparedStatement state = null;
        ResultSet rsloc = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("SELECT SQL_CACHE "
                    + "a.ID_HST, "
                    + "nome, "
                    + "CASE WHEN CMTR IS NULL THEN ''  ELSE CMTR END AS CMTR, "
                    + "CASE WHEN CHV_FUN_CMTR IS NULL THEN ''  ELSE CHV_FUN_CMTR END AS CHV_FUN_CMTR "
                    + "FROM hst_tb_comentario a INNER JOIN arhfot01 b  ON b.matricula=a.CHV_FUN_CMTR "
                    + "WHERE a.ID_HST=  ?");

            state.setString(1, ID_HST);
            System.out.println("encheComentario state : " + state);

            rsloc = state.executeQuery();
        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("FiltroSituacaoLimite - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rsloc;
    }

    public boolean cancelarQuadro(String CD_QUADRO) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("delete from hst_quadro where CD_QUADRO= ? ");

            state.setString(1, CD_QUADRO);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;
    }

    public ResultSet filtrarQuadro(String CHV_FUN_RESPONSAVEL, String SITUACAO_QUADRO) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "CASE WHEN QTD_HST is null THEN '' ELSE QTD_HST END AS QTD_HST, "
                    + "a.CD_QUADRO, "
                    + "SITUACAO_QUADRO, "
                    + "NM_QUADRO, "
                    + "NM_RESP,   "
                    + "CHV_FUN_GRAVACAO,   "
                    + "FUNCAO   "
                    //   + "QTD_HST "
                    + "FROM hst_quadro a  "
                    + "INNER JOIN hst_responsaveis b on a.CHV_FUN_RESPONSAVEL=b.CHV_FUN_RESPONSAVEL  "
                    + "LEFT JOIN ( "
                    + "SELECT "
                    + "DT_PREVISTA, "
                    + "DT_EFETIVA, "
                    + "CD_QUADRO, "
                    + "count(CD_QUADRO) as QTD_HST "
                    + "FROM hst_tb_historias "
                    + "GROUP BY CD_QUADRO "
                    + ")c on c.CD_QUADRO=a.CD_QUADRO "
                    + " "
                    + " WHERE b.CHV_FUN_RESPONSAVEL=? and a.SITUACAO_QUADRO=?"
                    + " "
                    + "group by NM_QUADRO "
                    + "ORDER  BY CD_QUADRO DESC"
                    + "");

            System.out.println("filtrarQuadro" + state);
            state.setString(1, CHV_FUN_RESPONSAVEL);
            state.setString(2, SITUACAO_QUADRO);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public ResultSet detalhaQuadroMax() {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "NM_RESP, "
                    + "ID_HST, "
                    + "MAX(a.CD_QUADRO) as CD_QUADRO, "
                    + "NM_QUADRO,  "
                    + "SITUACAO_QUADRO,  "
                    + "c.DESCRICAO, "
                    + "CHV_FUN_GRAVACAO , "
                    + "a.CHV_FUN_RESPONSAVEL, "
                    + "c.DT_PREVISTA,  "
                    + "c.DT_EFETIVA, "
                    + "QTD_HST  "
                    + " FROM hst_quadro a INNER JOIN hst_responsaveis b ON a.CHV_FUN_RESPONSAVEL=b.CHV_FUN_RESPONSAVEL LEFT JOIN ( "
                    + "SELECT "
                    + "CD_QUADRO, "
                    + "DESCRICAO, "
                    + "ID_HST,  "
                    + "DT_PREVISTA,  "
                    + "DT_EFETIVA, "
                    + "count(CD_QUADRO) as QTD_HST  "
                    + "FROM "
                    + "hst_tb_historias "
                    + ") c ON  a.CD_QUADRO=c.CD_QUADRO ");

            //System.out.println("detalhaQuadroMax" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public ResultSet encheQuadroMax() {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "CD_QUADRO, "
                    + "b.NM_RESP, "
                    + "a.NM_QUADRO, "
                    + "CHV_FUN_GRAVACAO, "
                    + "SITUACAO_QUADRO, "
                    + "max(CD_QUADRO), "
                    + "a.CHV_FUN_RESPONSAVEL "
                    + "FROM hst_quadro a LEFT JOIN hst_responsaveis b on a.CHV_FUN_RESPONSAVEL=b.CHV_FUN_RESPONSAVEL "
                    + "WHERE a.CD_QUADRO =(SELECT MAX(CD_QUADRO)FROM hst_quadro) "
                    + "");

            //System.out.println("encheQuadroMax" + state);
            //          state.setString(1,CHV_FUN_RESPONSAVEL);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public ResultSet detalhaQuadroN(String CD_QUADRO) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "CD_QUADRO, "
                    + "b.NM_RESP, "
                    + "a.NM_QUADRO, "
                    + "CHV_FUN_GRAVACAO, "
                    + "SITUACAO_QUADRO, "
                    + "max(CD_QUADRO), "
                    + "a.CHV_FUN_RESPONSAVEL "
                    + "FROM hst_quadro a LEFT JOIN hst_responsaveis b on a.CHV_FUN_RESPONSAVEL=b.CHV_FUN_RESPONSAVEL "
                    + "WHERE a.CD_QUADRO = '" + CD_QUADRO + "' "
                    + "");

//            System.out.println("detalhaQuadroN" + state);
//            state.setString(1, CD_QUADRO);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public boolean alteraQuadro(String NM_QUADRO, String CD_QUADRO) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement(" UPDATE hst_quadro SET NM_QUADRO = ? "
                    + " where CD_QUADRO = ? ");

            state.setString(1, NM_QUADRO);
            state.setString(2, CD_QUADRO);

            //   System.out.println("GravarRespostaAutomatica state:" + state);	        
            ok = !state.execute();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ok;
    }

    public boolean adicionarStatus(String SITUACAO_QUADRO, String CD_QUADRO) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement(" UPDATE hst_quadro SET SITUACAO_QUADRO = ? "
                    + " where CD_QUADRO = ? ");

            state.setString(1, SITUACAO_QUADRO);
            state.setString(2, CD_QUADRO);

            System.out.println("adicionarStatus state:" + state);
            ok = !state.execute();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ok;
    }

    public ResultSet verificaHistoria(String CD_QUADRO) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "CD_QUADRO, "
                    + "DESCRICAO, "
                    + "RESUMO "
                    + "FROM "
                    + "hst_tb_historias "
                    + "WHERE CD_QUADRO =? AND SITUACAO=0 "
                    + "");
            state.setString(1, CD_QUADRO);

            System.out.println("verificaHistoria" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public boolean gravaResponsavel(String CHV_FUN_RESPONSAVEL, String NM_RESP, String FUNCAO, String COLOR) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("INSERT INTO hst_responsaveis (CHV_FUN_RESPONSAVEL, NM_RESP, FUNCAO,COLOR )  "
                    + " VALUES (?,?,?, ?) ");

            state.setString(1, CHV_FUN_RESPONSAVEL);
            state.setString(2, NM_RESP);
            state.setString(3, FUNCAO);
            state.setString(4, COLOR);

            System.out.println("gravaResponsavel" + state);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;

    }

    public boolean confirmaArquivo(String NM_ARQUIVO, String CAMINHO, String ID_HST) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("INSERT INTO hst_arquivo (NM_ARQUIVO, CAMINHO, ID_HST)  "
                    + " VALUES (?,?,?) ");

            state.setString(1, NM_ARQUIVO);
            state.setString(2, CAMINHO);
            state.setString(3, ID_HST);

            System.out.println("confirmaArquivo" + state);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;

    }

    /*  public ResultSet encheArquivo(String ID_HST) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "NM_ARQUIVO, "
                    + "CAMINHO, "
                    + "ID_HST "
                    + "FROM "
                    + "hst_arquivo "
                    + "WHERE ID_HST = ?");
            state.setString(1, ID_HST);

            System.out.println("encheArquivo" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

     */
    public ResultSet encheArquivo(String ID_HST) {
        PreparedStatement state = null;
        ResultSet rs = null;

        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("select sql_cache "
                    + "ID_HST, "
                    + "idAnexo, "
                    + "nomeArquivo, "
                    + "novoNomeArquivo, "
                    + "dtGravacao "
                    + "FROM "
                    + "hst_ptl_arquivo "
                    + "WHERE ID_HST = ?");
            state.setString(1, ID_HST);

            System.out.println("encheArquivo" + state);
            rs = state.executeQuery();

        } catch (SQLException erro) {
            //System.out.println(erro);	
        } finally {
            try {
                //System.out.println("X DataAtualizacao - Encerrando Conexão.");
                FactoryConnection_MySQL.getConnection("intranet").close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
            }
        }
        return rs;
    }

    public boolean alteraNomeTarefa(String DESCRICAO, String ID_HST) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement(" UPDATE hst_tb_historias set DESCRICAO=? WHERE ID_HST=? ");

            state.setString(1, DESCRICAO);
            state.setString(2, ID_HST);

            System.out.println("alteraNomeTarefa state:" + state);
            ok = !state.execute();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ok;
    }

    public boolean GravaArquivo(String ID_HST, String nomeArquivo, String novoNomeArquivo) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("insert into hst_ptl_arquivo (ID_HST, nomeArquivo, novoNomeArquivo, dtGravacao) VALUES (?,?,?, now())");
            //state.setInt(1,idProtocolo);
            System.out.println("state: "+state);
            state.setString(1, ID_HST);
            state.setString(2, nomeArquivo);
            state.setString(3, novoNomeArquivo);
            System.out.println("state :" + state);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;
    }

    public boolean excluiAnexo(int idAnexo) {
        PreparedStatement state = null;
        boolean ok = false;
        try {
            state = FactoryConnection_MySQL.getConnection("intranet").prepareStatement("DELETE FROM hst_ptl_arquivo WHERE idAnexo=? ");

            System.out.println("excluiAnexo state:" + state);

            state.setInt(1, idAnexo);

            ok = !state.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return ok;
    }


%>
