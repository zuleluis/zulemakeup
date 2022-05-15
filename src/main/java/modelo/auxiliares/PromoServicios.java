//Modelo para los servicios que incluye cada promoción

package modelo.auxiliares;

import modelo.Promociones;
import modelo.Servicios;

import java.io.Serializable;

public class PromoServicios implements Serializable {
    private Promociones promocion;
    private Servicios servicio;

    public PromoServicios(){

    }

    public PromoServicios(Promociones promocion, Servicios servicio){
        this.promocion = promocion;
        this.servicio = servicio;
    }

    public PromoServicios( Servicios servicio){
        this.servicio = servicio;
    }

    public Promociones getPromocion() {
        return promocion;
    }

    public void setPromocion(Promociones promocion) {
        this.promocion = promocion;
    }

    public Servicios getServicio() {
        return servicio;
    }

    public void setServicio(Servicios servicio) {
        this.servicio = servicio;
    }

    @Override
    public String toString() {
        return "PromoServicios{" +
                "promocion=" + promocion +
                ", servicio=" + servicio +
                '}';
    }
}
