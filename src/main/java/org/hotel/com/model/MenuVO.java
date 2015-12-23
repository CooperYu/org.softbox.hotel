package org.hotel.com.model;

import org.zcsoft.core.annotation.Table;
import org.zcsoft.core.annotation.TableField;
import org.zcsoft.core.orm.BaseVO;

/**
 * 菜单model；
 * @author	yu.baocheng
 * @date	2015-9-25
 */
@Table(tableName="menu")
public class MenuVO extends BaseVO<MenuVO> {
	
	@TableField(fieldName="menu_id",isPrimaryKey=true,isAutoIncrement=false)
	public String menu_id;
	
	@TableField(fieldName="menu_name")
	public String menu_name;
	
	@TableField(fieldName="menu_path")
	public String menu_path;
	
	@TableField(fieldName="menu_code")
	public String menu_code;
	
	@TableField(fieldName="menu_depth")
	public String menu_depth;
	
	@TableField(fieldName="menu_parent_id")
	public Integer menu_parent_id;
	
	@TableField(fieldName="menu_url")
	public String menu_url;
	
	@TableField(fieldName="menu_state")
	public String menu_state;
	
	@TableField(fieldName="menu_orderBy",isOrderField=true)
	public String menu_orderBy;
	
	@TableField(fieldName="menu_desc")
	public String menu_desc;

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_path() {
		return menu_path;
	}

	public void setMenu_path(String menu_path) {
		this.menu_path = menu_path;
	}
	
	public String getMenu_code() {
		return menu_code;
	}

	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}

	public String getMenu_depth() {
		return menu_depth;
	}

	public void setMenu_depth(String menu_depth) {
		this.menu_depth = menu_depth;
	}

	public String getMenu_url() {
		return menu_url;
	}

	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}

	public String getMenu_desc() {
		return menu_desc;
	}

	public void setMenu_desc(String menu_desc) {
		this.menu_desc = menu_desc;
	}



	public Integer getMenu_parent_id() {
		return menu_parent_id;
	}

	public void setMenu_parent_id(Integer menu_parent_id) {
		this.menu_parent_id = menu_parent_id;
	}

	public String getMenu_orderBy() {
		return menu_orderBy;
	}

	public void setMenu_orderBy(String menu_orderBy) {
		this.menu_orderBy = menu_orderBy;
	}

	public String getMenu_state() {
		return menu_state;
	}

	public void setMenu_state(String menu_state) {
		this.menu_state = menu_state;
	}
}
