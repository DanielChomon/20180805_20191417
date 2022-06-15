package Daos;

import Beans.BCancion;
import Beans.BLista;

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
            String sql="select c.idcancion, c.nombre_cancion, c.banda, count(r.idreproduccion) as `cantidad_R` from cancion c inner join reproduccion r on (r.cancion_idcancion=c.idcancion) group by c.idcancion having `cantidad_R`>2 order by `cantidad_R` DESC";
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

    public ArrayList<BCancion> listarCanciones(){
        ArrayList<BCancion> listaRecom=new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql="select c.idcancion, c.nombre_cancion, c.banda, c.fav from cancion c";
            try(Connection conn= DriverManager.getConnection(url,user,pass);
                Statement statement= conn.createStatement();
                ResultSet rs= statement.executeQuery(sql)){
                while(rs.next()){
                    BCancion bCancion= new BCancion();
                    bCancion.setIdCancion(rs.getInt(1));
                    bCancion.setNombreCancion(rs.getString(2));
                    bCancion.setNombreBanda(rs.getString(3));
                    bCancion.setFav(rs.getBoolean(4));
                    listaRecom.add(bCancion);
                }
            }
        }catch (ClassNotFoundException | SQLException e){
            throw new RuntimeException(e);
        }
        return listaRecom;
    }

    public ArrayList<BLista> listarListas(){
        ArrayList<BLista> listaLista=new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql="select * from listareproduccion l";
            try(Connection conn= DriverManager.getConnection(url,user,pass);
                Statement statement= conn.createStatement();
                ResultSet rs= statement.executeQuery(sql)){
                while(rs.next()){
                    BLista bLista= new BLista();
                    bLista.setIdNombre(rs.getString(1));
                    listaLista.add(bLista);
                }
            }
        }catch (ClassNotFoundException | SQLException e){
            throw new RuntimeException(e);
        }
        return listaLista;
    }

    public ArrayList<BCancion> filtrarPorBandas(String filtro){
        ArrayList<BCancion> lista= new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql="select c.idcancion, c.nombre_cancion, c.banda, c.fav from cancion c where c.banda like ?";
            try(Connection conn= DriverManager.getConnection(url,user,pass);
                PreparedStatement statement= conn.prepareStatement(sql)){
                statement.setString(1, "%"+filtro+"%");
                try(ResultSet rs=statement.executeQuery()){
                    while(rs.next()){
                        BCancion bCancion= new BCancion();
                        bCancion.setIdCancion(rs.getInt(1));
                        bCancion.setNombreCancion(rs.getString(2));
                        bCancion.setNombreBanda(rs.getString(3));
                        bCancion.setFav(rs.getBoolean(4));
                        lista.add(bCancion);
                    }
                }
            }
        }catch (ClassNotFoundException | SQLException e){
            throw new RuntimeException(e);
        }
        return lista;
    }

    public void anadirListaFav(String idCancion)    {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }
        String nombreLista="Favoritos";
        if(!existe_lista(nombreLista)){
            if(crear_ListaReproduccion(nombreLista)){
                anadirCancionLista(Integer.parseInt(idCancion),nombreLista);
            }
        }else{
            if(!existe_cancion(nombreLista,Integer.parseInt(idCancion))){
                anadirCancionLista(Integer.parseInt(idCancion),nombreLista);
            }else{
                eliminarCancionLista(Integer.parseInt(idCancion),nombreLista);
            }
        }
    }

    public void actualizarCancionFav(int idCancion, boolean favorito){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }
        String sql="update cancion set fav=? where idcancion=?";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setBoolean(1,favorito);
            pstmt.setInt(2, idCancion);
            pstmt.executeUpdate();
        }catch(SQLException s){
            System.out.println("Error de conexión");
        }
    }
    public boolean anadirCancionLista(int idCancion,String nombreLista){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }
        boolean exitoso;
        String sql="insert into listareproduccion_has_cancion (listareproduccion_idlistareproduccion, cancion_idcancion) " +
                "values (?, ?);";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            if(nombreLista.equals("Favoritos")){
                actualizarCancionFav(idCancion, true);
            }
            pstmt.setString(1,nombreLista);
            pstmt.setInt(2,idCancion);
            pstmt.executeUpdate();
            exitoso=true;
        }catch(SQLException s){
            System.out.println("Error de conexión");
            exitoso=false;
        }
        return exitoso;
    }
    public void eliminarCancionLista(int idCancion,String nombreLista){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }
        String sql="delete from listareproduccion_has_cancion where ListaReproduccion_idListaReproduccion=? and cancion_idcancion=?";

        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            if(nombreLista.equals("Favoritos")){
                actualizarCancionFav(idCancion, false);
            }
            pstmt.setString(1,nombreLista);
            pstmt.setInt(2,idCancion);
            pstmt.executeUpdate();
        }catch(SQLException s){
            System.out.println("Error de conexión");
        }
    }

    public boolean crear_ListaReproduccion(String nombreLista){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }
        boolean exitoso;
        String sql="insert into listareproduccion (idListaReproduccion) values (?)";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombreLista);
            pstmt.executeUpdate();
            exitoso=true;
        }catch(SQLException s){
            System.out.println("Error de conexión");
            exitoso=false;
        }
        return exitoso;
    }

    public boolean existe_lista(String nombreLista){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }
        Boolean existe=false;
        String sql="select * from listareproduccion where idListaReproduccion=?";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombreLista);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    existe= true;
                }
            }
        }catch(SQLException s){
            System.out.println("Error de conexión");
        }
        return existe;
    }
    public boolean existe_cancion(String nombreLista,int idCancion){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }
        Boolean existe=false;
        String sql="select * from listareproduccion_has_cancion where ListaReproduccion_idListaReproduccion= ? and cancion_idcancion=?";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombreLista);
            pstmt.setInt(2,idCancion);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    existe= true;
                }
            }
        }catch(SQLException s){
            System.out.println("Error de conexión");
        }
        return existe;
    }
}
