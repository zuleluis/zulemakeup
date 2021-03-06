package modelo;

import java.io.Serializable;

public class Citas implements Serializable {
    private int idCita;
    private int fkCliente;
    private String fecha;
    private String hora;
    private boolean tipoLugar;
    private String lugar;
    private int fkPromocion;
    private float importe;
    private String nota;
    private boolean borrar;

    //Constructor vacío
    public Citas(){

    }

    //Insertar
    public Citas(int fkCliente, String fecha, String hora, boolean tipoLugar, String lugar, int fkPromocion, float importe, String nota, boolean borrar){
        this.fkCliente = fkCliente;
        this.fecha = fecha;
        this.hora = hora;
        this.tipoLugar = tipoLugar;
        this.lugar = lugar;
        this.fkPromocion = fkPromocion;
        this.importe = importe;
        this.nota = nota;
        this.borrar = borrar;
    }

    //Mostrar
    public Citas(String fecha, String hora, boolean tipoLugar, String lugar, float importe, String nota){
        this.fecha = fecha;
        this.hora = hora;
        this.tipoLugar = tipoLugar;
        this.lugar = lugar;
        this.importe = importe;
        this.nota = nota;
    }

    public Citas(String fecha, String hora, boolean tipoLugar, String lugar, int fkPromocion, float importe, String nota){
        this.fecha = fecha;
        this.hora = hora;
        this.tipoLugar = tipoLugar;
        this.lugar = lugar;
        this.importe = importe;
        this.nota = nota;
    }

    public Citas(String fecha, String hora, boolean tipoLugar, String lugar, float importe, String nota, boolean borrar){
        this.fecha = fecha;
        this.hora = hora;
        this.tipoLugar = tipoLugar;
        this.lugar = lugar;
        this.importe = importe;
        this.nota = nota;
        this.borrar = borrar;
    }

    public Citas(int idCita, String fecha, String hora, boolean tipoLugar, String lugar, float importe, String nota, boolean borrar){
        this.idCita = idCita;
        this.fecha = fecha;
        this.hora = hora;
        this.tipoLugar = tipoLugar;
        this.lugar = lugar;
        this.importe = importe;
        this.nota = nota;
        this.borrar = borrar;
    }

    public Citas(int idCita, int fkCliente, String fecha, String hora, boolean tipoLugar, String lugar, int fkPromocion, float importe, String nota, boolean borrar){
        this.idCita = idCita;
        this.fkCliente = fkCliente;
        this.fecha = fecha;
        this.hora = hora;
        this.tipoLugar = tipoLugar;
        this.lugar = lugar;
        this.fkPromocion = fkPromocion;
        this.importe = importe;
        this.nota = nota;
        this.borrar = borrar;
    }

    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public int getFkCliente() {
        return fkCliente;
    }

    public void setFkCliente(int fkCliente) {
        this.fkCliente = fkCliente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public boolean isTipoLugar() {
        return tipoLugar;
    }

    public void setTipoLugar(boolean tipoLugar) {
        this.tipoLugar = tipoLugar;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public int getFkPromocion() {
        return fkPromocion;
    }

    public void setFkPromocion(int fkPromocion) {
        this.fkPromocion = fkPromocion;
    }

    public float getImporte() {
        return importe;
    }

    public void setImporte(float importe) {
        this.importe = importe;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }

    public boolean isBorrar() {
        return borrar;
    }

    public void setBorrar(boolean borrar) {
        this.borrar = borrar;
    }

    @Override
    public String toString() {
        return "Citas{" +
                "idCita=" + idCita +
                ", fkCliente=" + fkCliente +
                ", fecha='" + fecha + '\'' +
                ", hora='" + hora + '\'' +
                ", tipoLugar=" + tipoLugar +
                ", lugar='" + lugar + '\'' +
                ", fkPromocion=" + fkPromocion +
                ", importe=" + importe +
                ", nota='" + nota + '\'' +
                ", borrar=" + borrar +
                '}';
    }
}
