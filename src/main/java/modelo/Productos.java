package modelo;

import java.io.Serializable;

public class Productos implements Serializable {
    private int idProducto;
    private int fkMarca;
    private String nombreProducto;
    private int fkAplicacion;
    private int fkTipo;
    private String modelo;
    private int cantidad;
    private boolean agotado;

    public Productos(){

    }

    //Insertar
    public Productos(int fkMarca, String nombreProducto, int fkAplicacion, int fkTipo, String modelo, int cantidad, boolean agotado){
        this.fkMarca = fkMarca;
        this.nombreProducto = nombreProducto;
        this.fkAplicacion = fkAplicacion;
        this.fkTipo = fkTipo;
        this.modelo = modelo;
        this.cantidad = cantidad;
        this.agotado = agotado;
    }


    //Mostrar
    public Productos(String nombreProducto, String modelo, int cantidad, boolean agotado){
        this.nombreProducto = nombreProducto;
        this.modelo = modelo;
        this.cantidad = cantidad;
        this.agotado = agotado;
    }

    public Productos(int idProducto, String nombreProducto, String modelo, int cantidad, boolean agotado){
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.modelo = modelo;
        this.cantidad = cantidad;
        this.agotado = agotado;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getFkMarca() {
        return fkMarca;
    }

    public void setFkMarca(int fkMarca) {
        this.fkMarca = fkMarca;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getFkAplicacion() {
        return fkAplicacion;
    }

    public void setFkAplicacion(int fkAplicacion) {
        this.fkAplicacion = fkAplicacion;
    }

    public int getFkTipo() {
        return fkTipo;
    }

    public void setFkTipo(int fkTipo) {
        this.fkTipo = fkTipo;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public boolean isAgotado() {
        return agotado;
    }

    public void setAgotado(boolean agotado) {
        this.agotado = agotado;
    }

    @Override
    public String toString() {
        return "Productos{" +
                "idProducto=" + idProducto +
                ", nombreProducto='" + nombreProducto + '\'' +
                ", fkAplicacion=" + fkAplicacion +
                ", fkTipo=" + fkTipo +
                ", modelo='" + modelo + '\'' +
                ", cantidad=" + cantidad +
                ", agotado=" + agotado +
                '}';
    }
}
