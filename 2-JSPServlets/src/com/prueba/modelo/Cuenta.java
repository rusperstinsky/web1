package com.prueba.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class Cuenta {

	private Connection con;
	private static final Logger log = LogManager.getLogger("Cuenta: ");

	
	public Cuenta(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean login(String email, String contrasena) {
		String sql = "select count(*) as count from administrador where email = ? and contrasena = ?";
		int cta = 0;
		log.debug("SQL: " + sql);
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			st.setString(2, contrasena);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
				cta = rs.getInt("count");			
			}
			rs.close();
		} catch (SQLException e) {
			log.error("Al realizar login: "+ e.getMessage());
		}
		
		if(cta == 0){
			return false;
		} else {
			return true;
		}
				
	}
	
}
