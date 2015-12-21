package org.hotel.com.model;

import java.math.BigDecimal;
import java.util.Date;

import org.zcsoft.core.annotation.TableField;
import org.zcsoft.core.annotation.Table;


/**
 * 产品表；
 * @author	yu.baocheng
 * @date	2015-9-23
 */
/**
 * @author Cooper
 *
 */
@Table(tableName="product")
public class ProductVO {

	/**
	 * 主键你ID
	 */
	@TableField(fieldName="product_id",isPrimaryKey=true,isAutoIncrement=false)
	private String product_id;
	
	/**
	 * 名称
	 */
	@TableField(fieldName="product_name")
	private String product_name;
	
	/**
	 * 类别
	 */
	@TableField(fieldName="category_id")
	private String category_id;
	
	/**
	 * 单价
	 */
	@TableField(fieldName="product_price")
	private BigDecimal product_price;
	
	/**
	 * 关键字
	 */
	@TableField(fieldName="product_keyword")
	private String product_keyword;
	
	/**
	 * 创建时间
	 */
	@TableField(fieldName="create_date")
	private Date create_date;
	
	/**
	 * 商品描述
	 */
	@TableField(fieldName="product_desc")
	private String product_desc;
	
	/**
	 * 图片路径
	 */
	@TableField(fieldName="image_path")
	private String image_path;
	
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public BigDecimal getProduct_price() {
		return product_price;
	}
	public void setProduct_price(BigDecimal product_price) {
		this.product_price = product_price;
	}
	public String getProduct_keyword() {
		return product_keyword;
	}
	public void setProduct_keyword(String product_keyword) {
		this.product_keyword = product_keyword;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
}
