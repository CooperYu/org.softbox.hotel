package org.hotel.com.bo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.hotel.com.model.CustOrderVO;
import org.hotel.com.model.OrderItemVO;
import org.hotel.com.model.ProductVO;
import org.hotel.com.utils.AdminConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zcsoft.core.orm.BaseDaoUtils;
import org.zcsoft.core.orm.SqlExeUtils;
import org.zcsoft.core.orm.SqlUtils;
import org.zcsoft.core.utils.Const;
import org.zcsoft.core.web.PageModel;

/**
 * 订单操作BO
 * @author yu.baocheng
 *
 */
@Service(value="orderBO")
public class OrderBO {
	
	@Autowired
	private BaseDaoUtils<ProductVO> baseDaoUtils;

	@Autowired
	private SqlExeUtils sqlExeUtils;
	
	
	
	/**
	 * 创建一个新的订单；
	 * @return
	 */
	public String createNewOrder(String user_name,String certi_no,String phone,String order_item_desc,String category_id,String order_type,String apply_date) throws Exception{
		
		StringBuffer insertOrderSQL = new StringBuffer();
		StringBuffer insertOrderItemSQL = new StringBuffer();
		StringBuffer selectCategorySQL = new StringBuffer();
		StringBuffer updateCategorySQL = new StringBuffer();
		insertOrderSQL.append("insert into cust_order(order_id,order_type,user_name,certi_no,phone,order_state,create_date,order_desc) values  (?,?,?,?,?,?,now(),?)");
		insertOrderItemSQL.append("insert into order_item(item_id,order_id,category_id,price,item_state,apply_date,create_date,item_desc) values (?,?,?,?,?,str_to_date(?,'%Y-%m-%d'),now(),?)");
		selectCategorySQL.append("select * from category where category_id = ? ");
		updateCategorySQL.append("update category set count = count - 1 where category_id = ?");
		String order_id = "";
		
		try{
			Map categoryMap = this.sqlExeUtils.queryForMap(selectCategorySQL.toString(), category_id);
			String priceStr = MapUtils.getString(categoryMap, "price");//查询到类型价格；
			String count = MapUtils.getString(categoryMap, "count");
			
			if(null != count && count != "0"){
				order_id = SqlUtils.getUUID();//订单ID
				String item_id = SqlUtils.getUUID();//订单项Id；
				this.sqlExeUtils.getJdbcTemplate().update(insertOrderSQL.toString(), order_id, order_type, user_name, certi_no, phone, CustOrderVO.ORDER_STATE_00A,"");
				this.sqlExeUtils.getJdbcTemplate().update(insertOrderItemSQL.toString(), item_id, order_id, category_id, new BigDecimal(priceStr).setScale(2), OrderItemVO.ITEM_STATE_00A,apply_date,order_item_desc);
				this.sqlExeUtils.getJdbcTemplate().update(updateCategorySQL.toString(),category_id);
			}
		}catch(Exception e){
			e.printStackTrace();
			return order_id;
		}
		return order_id;
	}
	
	/**
	 * 通过ID查询有效的客户订单，包含订单项明晰
	 * @param order_id
	 * @return
	 * @throws Exception
	 */
	public Map findCustOrderByOrderId(String order_id) throws Exception{
		StringBuffer selectSQL = new StringBuffer();
		selectSQL.append("select  order_id, order_type, user_name, certi_no, phone, order_state, create_date, order_desc  from cust_order where order_id = ? and order_state = ? ");
		Map custOrderMap = this.sqlExeUtils.queryForMap(selectSQL.toString(), order_id, CustOrderVO.ORDER_STATE_00A);

		selectSQL = new StringBuffer();
		selectSQL.append("select item_id, order_id, category_id, price, item_state, DATE_FORMAT(apply_date,'%Y-%m-%d') as apply_date, create_date, item_desc from order_item where order_id = ? and item_state = ? ");
		
		List orderItemList = this.sqlExeUtils.queryForList(selectSQL.toString(), order_id, OrderItemVO.ITEM_STATE_00A);
		if(MapUtils.isNotEmpty(custOrderMap)){
			custOrderMap.put("order_items", orderItemList);
		}
		return custOrderMap;
	}
	
	/****
	 * 通过分页对象执行查询订单SQL；
	 * @param pageModel
	 * @param queryParams
	 * @return
	 * @throws Exception
	 */
	public PageModel findAllCustOrderByPageModel(PageModel pageModel,Map queryParams)  throws Exception{
		
		StringBuffer selectSQL = new StringBuffer();
		selectSQL.append(" select order_id,order_type,user_name,certi_no,phone,order_state,if(order_state='00A','下单有效',if(order_state='00X','无效',if(order_state='00P','已入住',if(order_state='00S','完成','')))) as order_state_name,DATE_FORMAT(create_date,'%Y-%m-%d %H:%i:%S') as create_date,order_desc ");
		selectSQL.append(" from cust_order a order by a.create_date desc");
		pageModel.setQuerySQL(selectSQL.toString());
		
		List param = new ArrayList();
		//订单状态
		if(null != queryParams){
			String order_state = Const.getStrValue(queryParams, "order_state");
			if(StringUtils.isNotEmpty(order_state)){
				param.add(order_state);
			}
		}
		
		return this.sqlExeUtils.queryForListByPageModel(pageModel, param.toArray());
	}
	
	
	/**
	 * 更新cust_order表的order_state字段（订单状态）
	 * @param order_state
	 * @param order_id
	 * @return
	 * @throws Exception
	 */
	public String updateOrderStateByOrderId(String order_state,String order_id) throws Exception{
		
		if(StringUtils.isEmpty(order_id)) return AdminConst.FLASE_FLAG;
		
		StringBuffer updateSQL = new StringBuffer();
		updateSQL.append("update cust_order set order_state = ? where order_id = ?");
		int count = this.sqlExeUtils.update(updateSQL.toString(), order_state,order_id);
		if(count >= 1){
			return AdminConst.TRUE_FLAG;
		}
		return AdminConst.FLASE_FLAG;
		
	}
}
