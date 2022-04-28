package modelo.auxiliares;

import java.io.Serializable;

public class PromoServicios implements Serializable {
    private int fkPromocion;
    private int fkServicio;

    public PromoServicios(){

    }

    public int getFkPromocion() {
        return fkPromocion;
    }

    public void setFkPromocion(int fkPromocion) {
        this.fkPromocion = fkPromocion;
    }

    public int getFkServicio() {
        return fkServicio;
    }

    public void setFkServicio(int fkServicio) {
        this.fkServicio = fkServicio;
    }

    @Override
    public String toString() {
        return "PromoServicios{" +
                "fkPromocion=" + fkPromocion +
                ", fkServicio=" + fkServicio +
                '}';
    }
}
