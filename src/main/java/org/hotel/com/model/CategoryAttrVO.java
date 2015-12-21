package org.hotel.com.model;

import org.zcsoft.core.annotation.Table;
import org.zcsoft.core.annotation.TableField;

/**
 * 产品类型；
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Table(tableName="category_attr")
public class CategoryAttrVO {
	
	@TableField(fieldName="attr_id",isPrimaryKey=true,isAutoIncrement=false)
	private String attr_id;//参数ID
	
	@TableField(fieldName="category_id")
	private String category_id;//挂在哪个类型上的，category_id
	
	@TableField(fieldName="attr_name")
	private String attr_name;//参数的名称；
	
	@TableField(fieldName="attr_value")
	private String attr_value;//参数的值

	public String getAttr_id() {
		return attr_id;
	}

	public void setAttr_id(String attr_id) {
		this.attr_id = attr_id;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getAttr_name() {
		return attr_name;
	}

	public void setAttr_name(String attr_name) {
		this.attr_name = attr_name;
	}

	public String getAttr_value() {
		return attr_value;
	}

	public void setAttr_value(String attr_value) {
		this.attr_value = attr_value;
	}
}
