package com.mycompany.apuestatodook.model;


public class Apuesta {
    private int idApuesta;
    private int monto;
    private String por_quien;
    private int idUsuario;
    private int idPartido;
    private int estado;

    public Apuesta(int monto, String por_quien, int idUsuario, int idPartido) {
        this.monto = monto;
        this.por_quien = por_quien;
        this.idUsuario = idUsuario;
        this.idPartido = idPartido;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    public int getIdApuesta() {
        return idApuesta;
    }

    public int getMonto() {
        return monto;
    }

    public String getPor_quien() {
        return por_quien;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public int getIdPartido() {
        return idPartido;
    }

    public void setIdApuesta(int idApuesta) {
        this.idApuesta = idApuesta;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    public void setPor_quien(String por_quien) {
        this.por_quien = por_quien;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setIdPartido(int idPartido) {
        this.idPartido = idPartido;
    }

}