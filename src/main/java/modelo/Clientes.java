package modelo;

import java.io.Serializable;

public class Clientes implements Serializable {
    private int idCliente;
    private String nombre;
    private String apPaterno;
    private String apMaterno;
    private String fechaNac;
    private String calle;
    private int numero;
    private String colonia;
    private String ciudad;
    private String numTel;

    public Clientes(){

    }

    // Insertar
    public Clientes(String nombre, String apPaterno, String apMaterno, String fechaNac, String calle, int numero, String colonia, String ciudad, String numTel){
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.fechaNac = fechaNac;
        this.calle = calle;
        this.numero = numero;
        this.colonia = colonia;
        this.ciudad = ciudad;
        this.numTel = numTel;
    }

    //Mostrar
    public Clientes(String nombre, String apPaterno, String apMaterno){
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getNumTel() {
        return numTel;
    }

    public void setNumTel(String numTel) {
        this.numTel = numTel;
    }

    @Override
    public String toString() {
        return "Clientes{" +
                "idCliente=" + idCliente +
                ", nombre='" + nombre + '\'' +
                ", apPaterno='" + apPaterno + '\'' +
                ", apMaterno='" + apMaterno + '\'' +
                ", fechaNac='" + fechaNac + '\'' +
                ", calle='" + calle + '\'' +
                ", numero=" + numero +
                ", colonia='" + colonia + '\'' +
                ", ciudad='" + ciudad + '\'' +
                ", numTel='" + numTel + '\'' +
                '}';
    }
}
