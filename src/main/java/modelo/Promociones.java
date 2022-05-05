package modelo;

import java.io.Serializable;

public class Promociones implements Serializable {
    private int idPromocion;
    private String nombrePromocion;
    private float precio;
    private boolean estado;

    public Promociones(){

    }

    //Insertar
    public Promociones(String nombrePromocion, float precio, boolean estado){
        this.nombrePromocion = nombrePromocion;
        this.precio = precio;
        this.estado = estado;
    }

    //Mostrar
    public Promociones(String nombrePromocion){
        this.nombrePromocion = nombrePromocion;
    }

    public int getIdPromocion() {
        return idPromocion;
    }

    public void setIdPromocion(int idPromocion) {
        this.idPromocion = idPromocion;
    }

    public String getNombrePromocion() {
        return nombrePromocion;
    }

    public void setNombrePromocion(String nombrePromocion) {
        this.nombrePromocion = nombrePromocion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Promociones{" +
                "idPromocion=" + idPromocion +
                ", nombrePromocion='" + nombrePromocion + '\'' +
                ", precio=" + precio +
                ", estado=" + estado +
                '}';
    }
}
