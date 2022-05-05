package modelo.catalogos;

import java.io.Serializable;

public class Marcas implements Serializable {
    private int idMarca;
    private String nombre;

    public Marcas(){

    }

    public Marcas(String nombre){
        this.nombre = nombre;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Marcas{" +
                "idMarca=" + idMarca +
                ", nombre='" + nombre + '\'' +
                '}';
    }
}
