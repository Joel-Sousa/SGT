<%@page import="org.apache.tomcat.util.http.fileupload.FileUpload"%>
<%@page language="java" import="org.apache.commons.fileupload.*, java.util.*, java.io.*" %>
<%
    String nome = "";
    String site = "seu_login";

    /* caminho para utilizar no servidor */
    String pasta = "/Documents/NetBeansProjects/rotina/web/upload";
    String caminhoTemp = "/Documents/NetBeansProjects/rotina/web/upload";

    System.out.println("caminhoTemp " + caminhoTemp);
    System.out.println("pasta" + pasta);

    if (FileUpload.isMultipartContent(request)) {
        DiskFileUpload upload = new DiskFileUpload();
        upload.setRepositoryPath(caminhoTemp);

        try {

            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    if (item.isFormField()) {
                        nome = item.getString();
                        //System.out.println("formItems nome : ["+nome+"]");
                    }
                }
                for (FileItem item : formItems) {
                    if (!item.isFormField()) {

                        String nomeReal = item.getName().toString();/*Para tratar a Extensão do Arquivo*/
                        String nomeArquivo = nome.substring(nome.lastIndexOf("\\") + 1);
                        //System.out.println("nomeArquivo : "+nomeArquivo);

                        int tam = nomeReal.length();
                        String ext = nomeReal.substring(tam - 4, tam);
                        //System.out.println("UploadArq ext : ["+ext+"]");

                        int contemPonto = ext.indexOf(".");
                        //System.out.println("contemPonto : ["+contemPonto+"]");
                        if (contemPonto < 0) {
                            ext = "." + ext + "";
                            //System.out.println("Corrigindo Extensão");
                        }
                        nomeArquivo = "" + nomeArquivo + "" + ext + "";
                        //System.out.println("nomeArquivo ext : "+nomeArquivo);

                        //out.write("<span style='font-family: arial;'>Nome do arquivo no sistema: " + nomeArquivo + "<br></span>");
                        // out.write("<span style='font-family: arial;'>Arquivo<b> " + item.getName() + "</b> anexado com sucesso!<br></span>");
                        File arquivo = new File(pasta + nomeArquivo);
                        item.write(arquivo);
                        //out.write("Clique <a href=/fauckiu/" + nomeArquivo + ">Aqui</a>. Para ver o resultado do upload");
                    }
                }
            }

        } catch (FileUploadException e) {
            out.write("<span style='font-family: arial;'>Não foi possível efetivar o upload do arquivo - segue a causa do erro<br>" + e.getMessage() + "</span>");
            e.printStackTrace();
        }
    }

%>