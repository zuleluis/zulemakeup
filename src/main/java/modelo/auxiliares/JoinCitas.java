package modelo.auxiliares;

import java.io.Serializable;
import java.util.LinkedList;

import modelo.Clientes;
import modelo.Citas;
import modelo.Promociones;

public class JoinCitas implements Serializable {
    private Clientes cliente;
    private Promociones promocion;
    private Citas cita;

    public JoinCitas(){

    }

    public JoinCitas(Clientes cliente, Promociones promocion, Citas cita){
        this.cliente = cliente;
        this.cita = cita;
        this.promocion = promocion;
    }

    public Clientes getCliente() {
        return cliente;
    }

    public void setCliente(Clientes cliente) {
        this.cliente = cliente;
    }

    public Promociones getPromocion() {
        return promocion;
    }

    public void setPromocion(Promociones promocion) {
        this.promocion = promocion;
    }

    public Citas getCita() {
        return cita;
    }

    public void setCita(Citas cita) {
        this.cita = cita;
    }

    @Override
    public String toString() {
        return "JoinCitas{" +
                "cliente=" + cliente +
                ", promocion=" + promocion +
                ", cita=" + cita +
                '}';
    }
}
