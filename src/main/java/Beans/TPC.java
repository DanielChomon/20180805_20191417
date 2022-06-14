package Beans;

public class TPC {
    private String fecha;
    private String nombre_tour;
    private String nombre_ciudad;

    public TPC(String fecha, String nombre_tour, String nombre_ciudad) {
        this.fecha = fecha;
        this.nombre_tour = nombre_tour;
        this.nombre_ciudad = nombre_ciudad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombre_tour() {
        return nombre_tour;
    }

    public void setNombre_tour(String nombre_tour) {
        this.nombre_tour = nombre_tour;
    }

    public String getNombre_ciudad() {
        return nombre_ciudad;
    }

    public void setNombre_ciudad(String nombre_ciudad) {
        this.nombre_ciudad = nombre_ciudad;
    }
}
