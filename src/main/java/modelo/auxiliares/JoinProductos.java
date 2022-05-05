package modelo.auxiliares;

import modelo.Productos;
import modelo.catalogos.Marcas;
import modelo.catalogos.Tipos;
import modelo.catalogos.Aplicacion;

import java.io.Serializable;

public class JoinProductos implements Serializable {
    private Productos producto;
    private Marcas marca;
    private Tipos tipo;
    private Aplicacion aplicacion;

    public JoinProductos(){

    }

    public JoinProductos(Productos producto, Marcas marca, Tipos tipo, Aplicacion aplicacion){
        this.producto = producto;
        this.marca = marca;
        this.tipo = tipo;
        this.aplicacion = aplicacion;
    }

    public Productos getProducto() {
        return producto;
    }

    public void setProducto(Productos producto) {
        this.producto = producto;
    }

    public Marcas getMarca() {
        return marca;
    }

    public void setMarca(Marcas marca) {
        this.marca = marca;
    }

    public Aplicacion getAplicacion() {
        return aplicacion;
    }

    public void setAplicacion(Aplicacion aplicacion) {
        this.aplicacion = aplicacion;
    }

    public Tipos getTipo() {
        return tipo;
    }

    public void setTipo(Tipos tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "JoinProductos{" +
                "producto=" + producto +
                ", marca=" + marca +
                ", tipo=" + tipo +
                ", aplicacion=" + aplicacion +
                '}';
    }
}
