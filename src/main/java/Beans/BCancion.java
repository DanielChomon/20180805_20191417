package Beans;

public class BCancion {
    private int IdCancion;
    private String nombreCancion;
    private String nombreBanda;

    public int getIdCancion() {
        return IdCancion;
    }

    public void setIdCancion(int idCancion) {
        IdCancion = idCancion;
    }

    public String getNombreCancion() {
        return nombreCancion;
    }

    public void setNombreCancion(String nombreCancion) {
        this.nombreCancion = nombreCancion;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
}
