package Daos;

import Beans.BCancion;

import java.sql.*;
import java.util.ArrayList;

public class CancionesDao {
    private String user= "root";
    private String pass= "root";
    private String url = "jdbc:mysql://localhost:3306/lab6sw1?serverTimezone=America/Lima";

    public ArrayList<BCancion> listarRecomendados(){
        ArrayList<BCancion> listaRecom=new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql="select c.idcancion, c.nombre_cancion, c.banda,        count(r.idreproduccion) as `cantidad_R` from cancion c inner join reproduccion r on (r.cancion_idcancion=c.idcancion) group by c.idcancion having `cantidad_R`>2 order by `cantidad_R` DESC";
            System.out.println(sql);
            try(Connection conn= DriverManager.getConnection(url,user,pass);
                Statement statement= conn.createStatement();
                ResultSet rs= statement.executeQuery(sql)){
                while(rs.next()){
                    BCancion bCancion= new BCancion();
                    bCancion.setIdCancion(rs.getInt(1));
                    bCancion.setNombreCancion(rs.getString(2));
                    bCancion.setNombreBanda(rs.getString(3));
                    listaRecom.add(bCancion);
                }
            }
        }catch (ClassNotFoundException | SQLException e){
            throw new RuntimeException(e);
        }
        return listaRecom;
    }

}
