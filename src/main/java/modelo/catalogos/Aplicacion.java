package modelo.catalogos;

import java.io.Serializable;

public class Aplicacion implements Serializable {
    private int idAplicacion;
    private String nombre;

    public Aplicacion(){

    }

    public Aplicacion(int idAplicacion, String nombre){
        this.idAplicacion = idAplicacion;
        this.nombre = nombre;
    }

    public Aplicacion(String nombre){
        this.nombre = nombre;
    }

    public int getIdAplicacion() {
        return idAplicacion;
    }

    public void setIdAplicacion(int idAplicacion) {
        this.idAplicacion = idAplicacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Aplicacion{" +
                "idAplicacion=" + idAplicacion +
                ", nombre='" + nombre + '\'' +
                '}';
    }
}
