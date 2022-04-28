package modelo.auxiliares;

import java.io.Serializable;

public class CitasServicios implements Serializable {
    private int fkCita;
    private int fkServicio;

    public CitasServicios(){

    }

    public int getFkCita() {
        return fkCita;
    }

    public void setFkCita(int fkCita) {
        this.fkCita = fkCita;
    }

    public int getFkServicio() {
        return fkServicio;
    }

    public void setFkServicio(int fkServicio) {
        this.fkServicio = fkServicio;
    }

    @Override
    public String toString() {
        return "CitasServicios{" +
                "fkCita=" + fkCita +
                ", fkServicio=" + fkServicio +
                '}';
    }
}
