package modelo.catalogos;

import java.io.Serializable;

public class Tipos implements Serializable {
    private int idTipo;
    private String nombre;

    public Tipos(){

    }

    public Tipos(String nombre){
        this.nombre = nombre;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Tipos{" +
                "idTipo=" + idTipo +
                ", nombre='" + nombre + '\'' +
                '}';
    }
}
