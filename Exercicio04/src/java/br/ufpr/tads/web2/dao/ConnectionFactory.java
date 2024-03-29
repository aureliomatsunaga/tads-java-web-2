package br.ufpr.tads.web2.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public abstract class ConnectionFactory {

    private static final String PROPS_FILE = "/br/ufpr/tads/web2/dao/db.properties";

    public static Connection getConnection() {
        try {
            Properties props = new Properties();
            props.load(ConnectionFactory.class.getResourceAsStream(PROPS_FILE));
            Class.forName(props.getProperty("db.driver"));
            String dbUrl = props.getProperty("db.url")
                + props.getProperty("db.host") + ":"
                + props.getProperty("db.port") + "/"
                + props.getProperty("db.schema");
            String dbUser = props.getProperty("db.user");
            String dbPassword = props.getProperty("db.password");
            return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (IOException e) {
            throw new RuntimeException("Falha ao ler as propriedades: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver de conexao com banco de dados nao encontrado: " + e.getMessage());
        } catch (SQLException e) {
            throw new RuntimeException("Falha na conexao com banco de dados: " + e.getMessage());
        }
    }
}
