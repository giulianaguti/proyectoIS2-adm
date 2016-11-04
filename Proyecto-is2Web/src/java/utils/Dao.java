/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Julian
 */
public class Dao {

    Conexion c = new Conexion();

    public int getLoginAlumnos(int u, String p) {
        // TODO Auto-generated method stub
        int ok = 0;

        Connection con;
        con = c.getConexion();

        try {

            String strsql = "SELECT * FROM alumno";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (rs.getInt("codigo") == u && rs.getString("clave").equalsIgnoreCase(p)) {
                    ok = rs.getInt("codigo");
                }
            }
            rs.close();
            pstm.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
            ok = 0;
        }
        return ok;
    }

    public boolean getLoginAdmin(int u, String p) {
        // TODO Auto-generated method stub
        boolean ok = false;

        Connection con;
        con = c.getConexion();

        try {

            String strsql = "SELECT * FROM administrativo";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (rs.getInt("codigo") == u && rs.getString("clave").equalsIgnoreCase(p)) {
                    ok = true;
                }else{
                    ok=false;
                }
            }
            rs.close();
            pstm.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
            ok = true;
        }
        return ok;
    }

    public boolean registrar(int u, String mensaje) {
        boolean ok = false;
        Connection con = c.getConexion();
        try {
            String strsql = "INSERT INTO mensajes (idAlumno, mensaje) VALUES (" + u + ",'" + mensaje + "')";
            PreparedStatement ps = con.prepareStatement(strsql);
            ps.executeUpdate();
            ok = true;
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
            ok = false;
        }
        return ok;
    }
    
    public List<Alumno> getMensajes(){
        List<Alumno> l=new ArrayList<>();
        Connection con=c.getConexion();
        Alumno a;
        try{
            String strsql = "SELECT * FROM mensajes";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                a=new Alumno();
                a.setCodigo(rs.getInt("idAlumno"));
                a.setMensaje(rs.getString("mensaje"));
                l.add(a);
            }
            rs.close();
            pstm.close();
            con.close();
        }catch(Exception e){
            l.add(null);
        }                
        
        return l;
    }
    
    public List<Cubiculo> getCubiculos(){
        List<Cubiculo> l=new ArrayList<>();
        Connection con=c.getConexion();
        Cubiculo cu;
        try{
            String strsql = "SELECT * FROM cubiculo where Disponibilidad=1";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                cu=new Cubiculo();
                cu.setId(rs.getInt("idCubiculo"));
                cu.setCapacidad(rs.getInt("capacidad"));
                cu.setDisponibilidad(rs.getInt("disponibilidad"));
                cu.setFin(rs.getDate("Hora_Fin"));
                cu.setInicio(rs.getDate("Hora_Inicio"));
                cu.setPiso(rs.getString("piso"));
                l.add(cu);
            }
            rs.close();
            pstm.close();
            con.close();
        }catch(Exception e){
            l.add(null);
        }                
        
        return l;
    }
    
    public List<PC> getPCs(){
        List<PC> l=new ArrayList<>();
        Connection con=c.getConexion();
        PC p;
        try{
            String strsql = "SELECT * FROM pc where Disponibilidad=1";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p=new PC();
                p.setId(rs.getInt("idPC"));
                p.setDispo(rs.getInt("Disponibilidad"));
                p.setFin(rs.getDate("HoraFin"));
                p.setInicio(rs.getDate("HoraInicio"));
                p.setUbicacion(rs.getString("Ubicación"));
                l.add(p);
            }
            rs.close();
            pstm.close();
            con.close();
        }catch(Exception e){
            l.add(null);
        }                
        
        return l;
    }
    
    public boolean reservarPC(int codigo, int pc){
        boolean ok=false;
        Connection con=c.getConexion();        
        try{
            String strsql = "update pc set Disponibilidad=0, HoraInicio=current_time(), HoraFin=current_time()+Interval 1 hour where idPc="+pc;
            String sql="insert into reservapc (PC_idPC,alumno_codAlumno) values(?,?)";
            PreparedStatement pstm = con.prepareStatement(strsql);
            PreparedStatement pstm2 = con.prepareStatement(sql);
            pstm.executeUpdate();
            
            pstm2.setInt(1, pc);
            pstm2.setInt(2, codigo);
            pstm2.executeUpdate();
            pstm.close();
            pstm2.close();
            
            ok=true;
            con.close();
            
        }catch(Exception e){
            ok=false;
        }
        return ok;
    }
    
    public boolean reservarCubiculo(int codigo, int cub){
        boolean ok=false;
        Connection con=c.getConexion();        
        try{
            String strsql = "update cubiculo set Disponibilidad=0, Hora_Inicio=current_time(), Hora_Fin=current_time()+Interval 1 hour where idCubiculo="+cub;
            String sql="insert into reservacubiculo (Cubiculo_idCubiculo,alumno_codAlumno) values(?,?)";
            PreparedStatement pstm = con.prepareStatement(strsql);
            PreparedStatement pstm2 = con.prepareStatement(sql);
            pstm.executeUpdate();
            
            pstm2.setInt(1, cub);
            pstm2.setInt(2, codigo);
            pstm2.executeUpdate();
            pstm.close();
            pstm2.close();
            
            ok=true;
            con.close();
            
        }catch(Exception e){
            System.out.println(e);
            ok=false;
        }
        return ok;
    }
    
    public List<Cubiculo> getTodosCubiculos(){
        List<Cubiculo> l=new ArrayList<>();
        Connection con=c.getConexion();
        Cubiculo cu;
        try{
            String strsql = "SELECT * FROM cubiculo";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                cu=new Cubiculo();
                cu.setId(rs.getInt("idCubiculo"));
                cu.setCapacidad(rs.getInt("capacidad"));
                cu.setDisponibilidad(rs.getInt("disponibilidad"));
                cu.setFin(rs.getDate("Hora_Fin"));
                cu.setInicio(rs.getDate("Hora_Inicio"));
                cu.setPiso(rs.getString("piso"));
                l.add(cu);
            }
            rs.close();
            pstm.close();
            con.close();
        }catch(Exception e){
            l.add(null);
        }                
        
        return l;
    }
    
    public List<PC> getTodosPCs(){
        List<PC> l=new ArrayList<>();
        Connection con=c.getConexion();
        PC p;
        try{
            String strsql = "SELECT * FROM pc";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p=new PC();
                p.setId(rs.getInt("idPC"));
                p.setDispo(rs.getInt("Disponibilidad"));
                p.setFin(rs.getDate("HoraFin"));
                p.setInicio(rs.getDate("HoraInicio"));
                p.setUbicacion(rs.getString("Ubicación"));
                l.add(p);
            }
            rs.close();
            pstm.close();
            con.close();
        }catch(Exception e){
            l.add(null);
        }                
        
        return l;
    }
    

}
