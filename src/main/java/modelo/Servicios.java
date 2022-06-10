package modelo;

import java.io.Serializable;

public class Servicios implements Serializable {
    private int idServicio;
    private String nombreServicio;
    private float precio;
    private String descripcion;

    public Servicios(){

    }

    public Servicios(String nombreServicio, float precio, String descripcion){
        this.nombreServicio = nombreServicio;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    public Servicios(int idServicio, String nombreServicio, float precio, String descripcion){
        this.idServicio = idServicio;
        this.nombreServicio = nombreServicio;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    public Servicios(String nombreServicio){
        this.nombreServicio = nombreServicio;
    }

    public Servicios(int idServicio, String nombreServicio){
        this.idServicio = idServicio;
        this.nombreServicio = nombreServicio;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public String getNombreServicio() {
        return nombreServicio;
    }

    public void setNombreServicio(String nombreServicio) {
        this.nombreServicio = nombreServicio;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Servicios{" +
                "idServicio=" + idServicio +
                ", nombreServicio='" + nombreServicio + '\'' +
                ", precio=" + precio +
                ", descripcion='" + descripcion + '\'' +
                '}';
    }
}
