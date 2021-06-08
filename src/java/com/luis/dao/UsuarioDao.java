package com.luis.dao;

import com.luis.model.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class UsuarioDao {

    DbConnection conn;
    
    public UsuarioDao(DbConnection conn) {
        this.conn = conn;
    }
    
    public Usuario login(String user, String pass) {
        try {
            String sql = "select * from Usuario where username=? and password=md5(?) and estatus='activo' limit 1 ";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);
            ResultSet rs = preparedStatement.executeQuery();
            Usuario usuario = new Usuario(0);
            while (rs.next()) {
                //crear un objeto para el usuario
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setEmail(rs.getString("email"));
                usuario.setUsername(rs.getString("username"));
                usuario.setPassword(rs.getString("password"));
                usuario.setPerfil(rs.getString("perfil"));
                usuario.setEstatus(rs.getString("estatus"));
            }
            return usuario;
        } catch (SQLException e) {
            System.out.println("Error UsuarioDao.login: "+e.getMessage());
            return null;
        }
        
    }
    public  List<Usuario> getAll(){
        try {
            String sql ="select * from Usuario order by id desc";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            List<Usuario> list =new LinkedList<>();
            Usuario usuario;
            while (rs.next()){
                    usuario = new  Usuario(rs.getInt("id"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setUsername(rs.getString("username"));
                    usuario.setPassword(rs.getString("password"));
                    usuario.setPerfil(rs.getString("perfil"));
                    usuario.setEstatus(rs.getString("estatus"));
                    //add vacante object to the list
                    list.add(usuario);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("Error UsuarioDao.getAll " + e.getMessage());
            return null;
        }
    }
    public boolean insert(Usuario usuario) {
        String sql = "insert into Usuario values (?,?,?,?,md5(?),?,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, usuario.getId());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getEmail());
            ps.setString(4, usuario.getUsername());
            ps.setString(5, usuario.getPassword());
            ps.setString(6, usuario.getPerfil());
            ps.setString(7, usuario.getEstatus());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error UsuarioDao.insert " + ex.getMessage());
            return false;
        }       
    }
    public  List<Usuario> getByQuery(String query){
        try {
            String sql ="select * from Usuario where (email like ? or nombre like ?) order by id desc";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, "%" + query + "%" );
            preparedStatement.setString(2, "%" + query + "%" );
            ResultSet rs = preparedStatement.executeQuery();
            List<Usuario> list =new LinkedList<>();
            Usuario usuario;
            while (rs.next()) {   
                
                usuario = new Usuario(rs.getInt("id"));
                usuario.setEmail(rs.getString("email"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setUsername(rs.getString("username"));
                usuario.setPassword(rs.getString("password"));
                usuario.setPerfil(rs.getString("perfil"));
                usuario.setEstatus(rs.getString("estatus"));
                //add vacante object to the list
                list.add(usuario);
                
            }
            return list; 
        }catch(SQLException e){
            System.out.println("Error UsuarioDao.getByQuery: "+e.getMessage());
            return null;
        }
    }
    public Usuario getById(int idUsuario){
        try {
            String sql ="select * from Usuario where id=? limit 1";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, idUsuario);//set idUsuario
            ResultSet rs = preparedStatement.executeQuery();
            Usuario usuario = new Usuario(0);
            while (rs.next()) {                
                
                usuario.setId(rs.getInt("id"));
                usuario.setEmail(rs.getString("email"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setUsername(rs.getString("username"));
                usuario.setPassword(rs.getString("password")); 
                usuario.setPerfil(rs.getString("perfil"));
                usuario.setEstatus(rs.getString("estatus"));
            }
            return usuario; 
        }catch(SQLException e){
            System.out.println("Error UsuarioDao.getById: "+e.getMessage());
            return null;
        }
    }
    public boolean editPassword(int idUsuario,String password){
        try {
            String sql ="update Usuario set password=md5(?) where id=?";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, password);//set contraseña
            preparedStatement.setInt(2, idUsuario);//set idUsuario
            preparedStatement.executeUpdate();
         
            return true; 
        }catch(SQLException e){
            System.out.println("Error UsuarioDao.editPasword: "+e.getMessage());
            return false;
        }
    }
    public boolean editUser(Usuario usuario){
        try {
            String sql ="update Usuario set nombre=?, email=?, username=?, perfil=?, estatus=? where id=?";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, usuario.getNombre());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getUsername());
            preparedStatement.setString(4, usuario.getPerfil());
            preparedStatement.setString(5, usuario.getEstatus());
            preparedStatement.setInt(6, usuario.getId());
            preparedStatement.executeUpdate();
         
            return true; 
        }catch(SQLException e){
            System.out.println("Error UsuarioDao.editUser: "+e.getMessage());
            return false;
        }
    }
    public boolean delete(int idUsuario){
        try {
            String sql ="delete from Usuario where id=? ";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, idUsuario);
            preparedStatement.executeUpdate();
            
            return true; 
        }catch(SQLException e){
            System.out.println("Error UsuarioDao.delete: "+e.getMessage());
            return false;
        }
    }
    public int countUser(){
        try {
            String sql ="select count(*) from usuario";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        }catch(SQLException e){
            System.out.println("Error UsuarioDao.countUser: "+e.getMessage());
            return 0;
        }

    }
}
