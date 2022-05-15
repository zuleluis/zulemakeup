//Modelo para los servicios que va a incluir cada cita

package modelo.auxiliares;

import java.io.Serializable;

import modelo.Citas;
import modelo.Servicios;

public class CitasServicios implements Serializable {
    private Citas cita;
    private Servicios servicio;

    public CitasServicios(){

    }

    public CitasServicios(Citas cita, Servicios servicio){
        this.cita = cita;
        this.servicio = servicio;
    }

    public CitasServicios(Servicios servicio){
        this.servicio = servicio;
    }

    public Citas getCita() {
        return cita;
    }

    public void setCita(Citas cita) {
        this.cita = cita;
    }

    public Servicios getServicio() {
        return servicio;
    }

    public void setServicio(Servicios servicio) {
        this.servicio = servicio;
    }

    @Override
    public String toString() {
        return "CitasServicios{" +
                "cita=" + cita +
                ", servicio=" + servicio +
                '}';
    }
}
