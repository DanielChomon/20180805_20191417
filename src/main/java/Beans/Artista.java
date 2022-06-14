package Beans;

public class Artista {
    private int idArtista;
    private String nombre_artista;
    private String idinstrumento;
    private String idbanda;

    public Artista(int idArtista, String nombre_artista, String idinstrumento, String idbanda) {
        this.idArtista = idArtista;
        this.nombre_artista = nombre_artista;
        this.idinstrumento = idinstrumento;
        this.idbanda = idbanda;
    }

    public int getIdArtista() {
        return idArtista;
    }

    public void setIdArtista(int idArtista) {
        this.idArtista = idArtista;
    }

    public String getNombre_artista() {
        return nombre_artista;
    }

    public void setNombre_artista(String nombre_artista) {
        this.nombre_artista = nombre_artista;
    }

    public String getIdinstrumento() {
        return idinstrumento;
    }

    public void setIdinstrumento(String idinstrumento) {
        this.idinstrumento = idinstrumento;
    }

    public String getIdbanda() {
        return idbanda;
    }

    public void setIdbanda(String idbanda) {
        this.idbanda = idbanda;
    }

}
