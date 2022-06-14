package Beans;

public class Tour {
    private int idTour;
    private String nombre_Tour;
    private String idbanda;

    public Tour(int idTour, String nombre_Tour, String idbanda) {
        this.idTour = idTour;
        this.nombre_Tour = nombre_Tour;
        this.idbanda = idbanda;
    }

    public int getIdTour() {
        return idTour;
    }

    public void setIdTour(int idTour) {
        this.idTour = idTour;
    }

    public String getNombre_Tour() {
        return nombre_Tour;
    }

    public void setNombre_Tour(String nombre_Tour) {
        this.nombre_Tour = nombre_Tour;
    }

    public String getIdbanda() {
        return idbanda;
    }

    public void setIdbanda(String idbanda) {
        this.idbanda = idbanda;
    }
}
