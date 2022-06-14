package Beans;

public class BCancion {
    private String IdCancion;
    private String nombreCancion;
    private String nombreBanda;

    public String getIdCancion() {
        return IdCancion;
    }

    public void setIdCancion(String idCancion) {
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

