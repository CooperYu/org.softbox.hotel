package org.hotel.com.model;

import java.util.Date;

import org.zcsoft.core.annotation.TableField;
import org.zcsoft.core.orm.BaseVO;
import org.zcsoft.core.annotation.Table;


/**
 * 订单表
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Table(tableName="cust_order")
public class CustOrderVO extends BaseVO<CustOrderVO> {
	
	/**
	 * 订单状态：有效
	 */
	public static final String ORDER_STATE_00A = "00A";
	/**
	 * 订单状态：无效；
	 */
	public static final String ORDER_STATE_OOX = "00X";
	
	//订单来源{
	public static final String ORDER_TYPE_WEB = "WEB"; //web网页
	public static final String ORDER_TYPE_WEIXIN = "WEIXIN";//微信
	//}
	
	
	@TableField(fieldName="order_id",isPrimaryKey=true,isAutoIncrement=false)
	private String order_id;
	
	@TableField(fieldName="order_type")
	private String order_type;
	
	@TableField(fieldName="user_name")
	private String user_name;
	@TableField(fieldName="certi_no")
	private String certi_no;
	@TableField(fieldName="phone")
	private String phone;

	@TableField(fieldName="order_state")
	private String order_state;
	
	@TableField(fieldName="create_date")
	private Date create_date;
	
	@TableField(fieldName="order_desc")
	private String order_desc;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCerti_no() {
		return certi_no;
	}
	public void setCerti_no(String certi_no) {
		this.certi_no = certi_no;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getOrder_desc() {
		return order_desc;
	}
	public void setOrder_desc(String order_desc) {
		this.order_desc = order_desc;
	}
}
