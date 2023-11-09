package com.mycompany.apuestatodook.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ApuestaDAO {

    public void add(Apuesta apuesta) {
        String query = "INSERT INTO apuesta (monto, por_quien, fk_id_usuario, fk_id_partido) VALUES (?, ?, ?, ?)";
        try (Connection con = ConnectionPool.getInstance().getConnection(); PreparedStatement preparedStatement = con.prepareStatement(query)) {
            preparedStatement.setInt(1, apuesta.getMonto());
            preparedStatement.setString(2, apuesta.getPor_quien());
            preparedStatement.setInt(3, apuesta.getIdUsuario());
            preparedStatement.setInt(4, apuesta.getIdPartido());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    public List<Apuesta> getApuestasPorUsuario(int idUsuario) {
    List<Apuesta> apuestas = new ArrayList<>();
    String query = "SELECT * FROM apuesta WHERE fk_id_usuario = ?";
    
    try (Connection con = ConnectionPool.getInstance().getConnection();
         PreparedStatement preparedStatement = con.prepareStatement(query)) {
        preparedStatement.setInt(1, idUsuario);
        
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Apuesta apuesta = rsRowToApuesta(resultSet);
                apuestas.add(apuesta);
            }
        }
    } catch (SQLException ex) {
        throw new RuntimeException(ex);
    }
    
    return apuestas;
    }
    
    public String getResultadoPorPartido(int idPartido) {
    String query = "SELECT ganador FROM resultado WHERE id_partido = ?";
    try (Connection con = ConnectionPool.getInstance().getConnection();
         PreparedStatement preparedStatement = con.prepareStatement(query)) {
        preparedStatement.setInt(1, idPartido);
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getString("ganador");
            }
        }
    } catch (SQLException ex) {
        throw new RuntimeException(ex);
    }
    return null;
    }


    private Apuesta rsRowToApuesta(ResultSet rs) throws SQLException {
        int monto = rs.getInt("monto");
        String por_quien = rs.getString("por_quien");
        int idUsuario = rs.getInt("fk_id_usuario");
        int idPartido = rs.getInt("fk_id_partido");

        return new Apuesta(monto, por_quien, idUsuario, idPartido);
    }
    
    public void updateEstado(Apuesta apuesta) {
    String query = "UPDATE apuesta SET estado = ? WHERE id_apuesta = ?";
    try (Connection con = ConnectionPool.getInstance().getConnection();
         PreparedStatement preparedStatement = con.prepareStatement(query)) {
        preparedStatement.setString(1, String.valueOf(apuesta.getEstado()));
        preparedStatement.setInt(2, apuesta.getIdApuesta());
        preparedStatement.executeUpdate();
    } catch (SQLException ex) {
        throw new RuntimeException(ex);
    }
    }
}