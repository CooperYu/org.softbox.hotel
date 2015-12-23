package org.hotel.com.model;

import java.math.BigDecimal;
import java.util.Date;

import org.zcsoft.core.annotation.Table;
import org.zcsoft.core.annotation.TableField;
import org.zcsoft.core.orm.BaseVO;

/**
 * 订单项（order_item)
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Table(tableName="order_item")
public class OrderItemVO extends BaseVO<OrderItemVO> {
	
	/**
	 * 订单状态：有效
	 */
	public static final String ITEM_STATE_00A = "00A";
	/**
	 * 订单状态：无效；
	 */
	public static final String ITEM_STATE_OOX = "00X";
	
	@TableField(fieldName="item_id",isPrimaryKey=true,isAutoIncrement=false)
	private String item_id;
	
	@TableField(fieldName="order_id")
	private String order_id;
	
	@TableField(fieldName="category_id")
	private String category_id;
	
	@TableField(fieldName="price")
	private BigDecimal price;
	
	@TableField(fieldName="item_state")
	private String item_state;

	@TableField(fieldName="apply_date")
	private String apply_date;
	
	@TableField(fieldName="create_date")
	private Date create_date;
	
	@TableField(fieldName="item_desc")
	private String item_desc;
	
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getItem_state() {
		return item_state;
	}
	public void setItem_state(String item_state) {
		this.item_state = item_state;
	}
	public String getApply_date() {
		return apply_date;
	}
	public void setApply_date(String apply_date) {
		this.apply_date = apply_date;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getItem_desc() {
		return item_desc;
	}
	public void setItem_desc(String item_desc) {
		this.item_desc = item_desc;
	}
}
