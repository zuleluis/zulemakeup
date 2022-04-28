package datos;
import java.sql.*;

public class Conexion {
    private static String user = "postgres";
    private static String password = "1234";
    private static String bd = "zulemakeup";
    private static String server="jdbc:postgresql://localhost:5432/" + bd;
    private static String driver = "org.postgresql.Driver";

    public static Connection getConnection(){
        try {
            Class.forName(driver);
            return DriverManager.getConnection(server, user, password);

        } catch (SQLException e){
            //e.printStackTrace();
            System.out.println("Error de conexión a la base de datos" + server);
        } catch (ClassNotFoundException e){
            //e.printStackTrace();
            System.out.println("Error, no se encuentra la clase indicada");
        }
        return null;
    }

    public static void close(ResultSet result){
        try{
            result.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void close(Statement statement){
        try{
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void close(Connection connection){
        try{
            connection.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }


}
