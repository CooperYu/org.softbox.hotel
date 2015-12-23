package org.hotel.com.model;

import java.util.Date;

import org.zcsoft.core.annotation.TableField;
import org.zcsoft.core.orm.BaseVO;
import org.zcsoft.core.annotation.Table;


/**
 * 用户表
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Table(tableName="appUser")
public class AppUserVO extends BaseVO<AppUserVO> {
	
	@TableField(fieldName="user_id",isPrimaryKey=true,isAutoIncrement=false)
	private String user_id;
	
	@TableField(fieldName="user_name")
	private String user_name;
	
	@TableField(fieldName="user_password")
	private String user_password;
	
	@TableField(fieldName="create_date")
	private Date create_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
}
