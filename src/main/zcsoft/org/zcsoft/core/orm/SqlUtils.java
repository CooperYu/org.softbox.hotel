package org.zcsoft.core.orm;

import java.util.UUID;

import org.apache.log4j.Logger;

public class SqlUtils {
	
	private Boolean showSQL;
	
	public final static Logger log = Logger.getLogger(SqlUtils.class);
	
	public void setShowSQL(Boolean showSQL){
		this.showSQL = showSQL;
	}
	
	public void printlnSQL(String sql){
		if(showSQL)
			log.info(sql);
	}
	
	/**
	 * 获取UUID
	 * @return
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}
