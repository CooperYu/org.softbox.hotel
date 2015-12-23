package org.hotel.com.model;

import java.math.BigDecimal;
import java.util.Date;

import org.zcsoft.core.annotation.TableField;
import org.zcsoft.core.orm.BaseVO;
import org.zcsoft.core.annotation.Table;

/**
 * 产品类型；
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Table(tableName="category")
public class CategoryVO extends BaseVO<CategoryVO>{
	
	@TableField(fieldName="category_id",isPrimaryKey=true,isAutoIncrement=false)
	private String category_id;
	
	@TableField(fieldName="category_name")
	private String category_name;
	
	@TableField(fieldName="image_path")
	private String image_path;
	
	@TableField(fieldName="category_keyword")
	private String category_keyword;
	
	@TableField(fieldName="create_date")
	private Date create_date;
	
	@TableField(fieldName="category_desc")
	private String category_desc;
	
	@TableField(fieldName="price")
	private BigDecimal price;
	
	@TableField(fieldName="count")
	private Integer count;
	
	@TableField(fieldName="category_state")
	private String category_state;
	
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getCategory_keyword() {
		return category_keyword;
	}
	public void setCategory_keyword(String category_keyword) {
		this.category_keyword = category_keyword;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getCategory_desc() {
		return category_desc;
	}
	public void setCategory_desc(String category_desc) {
		this.category_desc = category_desc;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getCategory_state() {
		return category_state;
	}
	public void setCategory_state(String category_state) {
		this.category_state = category_state;
	}
}