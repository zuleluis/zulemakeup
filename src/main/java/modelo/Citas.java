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

    //Constructor vacío
    public Citas(){

    }

    //Insertar
    public Citas(int fkCliente, String fecha, String hora, boolean tipoLugar, String lugar, int fkPromocion, float importe, String nota){
        this.fkCliente = fkCliente;
        this.fecha = fecha;
        this.hora = hora;
        this.tipoLugar = tipoLugar;
        this.lugar = lugar;
        this.fkPromocion = fkPromocion;
        this.importe = importe;
        this.nota = nota;
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
                '}';
    }
}
