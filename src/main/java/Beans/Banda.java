package Beans;

public class Banda {
    private String idBanda;
    private String nombre_banda;
    private int idlider;


    public Banda(String idBanda, String nombre_banda, int idlider) {
        this.idBanda = idBanda;
        this.nombre_banda = nombre_banda;
        this.idlider = idlider;
    }

    public String getIdBanda() {
        return idBanda;
    }

    public void setIdBanda(String idBanda) {
        this.idBanda = idBanda;
    }

    public String getNombre_banda() {
        return nombre_banda;
    }

    public void setNombre_banda(String nombre_banda) {
        this.nombre_banda = nombre_banda;
    }

    public int getIdlider() {
        return idlider;
    }

    public void setIdlider(int idlider) {
        this.idlider = idlider;
    }
}
