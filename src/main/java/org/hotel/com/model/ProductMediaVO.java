package org.hotel.com.model;

import java.util.Date;

import org.zcsoft.core.annotation.TableField;
import org.zcsoft.core.annotation.Table;


/**
 * 商品媒体
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Table(tableName="product_media")
public class ProductMediaVO {

	@TableField(fieldName="media_id",isPrimaryKey=true,isAutoIncrement=false)
	private String media_id;
	
	@TableField(fieldName="media_name")
	private String media_name;
	
	@TableField(fieldName="media_path")
	private String media_path;
	
	@TableField(fieldName="product_id")
	private Integer product_id;
	
	@TableField(fieldName="create_date")
	private Date create_date;
	
	@TableField(fieldName="media_desc")
	private String media_desc;
	
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	public String getMedia_name() {
		return media_name;
	}
	public void setMedia_name(String media_name) {
		this.media_name = media_name;
	}
	public String getMedia_path() {
		return media_path;
	}
	public void setMedia_path(String media_path) {
		this.media_path = media_path;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getMedia_desc() {
		return media_desc;
	}
	public void setMedia_desc(String media_desc) {
		this.media_desc = media_desc;
	}
}
