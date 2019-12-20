package dao;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

	public class FactoryConnection_MySQL {

    public static Connection getConnection(String Bd) throws SQLException {
        Connection Con = null;
        try {
            //String url = "jdbc:mysql://172.16.12.54:3306/"+Bd;              
            String url = "jdbc:mysql://localhost/sistema_agendamento";
            Class.forName("com.mysql.jdbc.Driver");
            Con = DriverManager.getConnection(url, "root", "0000");/**/
            if (Con != null) {
//                System.out.println("MYSQL--->Conectado com sucesso!");
            } else {
//                System.out.println("ERRO MYSQL--->Não foi possivel realizar conexão");
            }
            return Con;
        } //catch(ClassNotFoundException e){
        catch (Exception e) {
            String ErroD = e.getMessage();
//            System.out.println("ERRO MYSQL : " + ErroD);
            throw new SQLException(e.getMessage());
        }
    }
}
