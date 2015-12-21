package org.hotel.com.controller.weixin;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hotel.com.bo.CategoryAttrBO;
import org.hotel.com.bo.CategoryBO;
import org.hotel.com.bo.MenuBO;
import org.hotel.com.bo.OrderBO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 微信接口 - 产品操作控制器
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Controller
public class WXDefaultController{
	
	private static final Logger logger = LoggerFactory.getLogger(WXDefaultController.class);
	
	@Autowired
	private MenuBO menuBO;
	@Autowired
	private CategoryBO categoryBO;
	@Autowired
	private CategoryAttrBO categoryAttrBO;
	@Autowired
	private OrderBO orderBO;
	
	/**
	 * 微信首页
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "weixin/default.html")
	public String page2WeiXinDefault(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model) throws Exception {
		return "weixin/default";
	}
	
	/**
	 * 跳转到房间预订页面
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "weixin/order.html")
	public String page2WeiXinOrder(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model) throws Exception {
		
		List<Map> categoryList = this.categoryBO.findAllCategory();
		request.setAttribute("categoryList", categoryList);
		return "weixin/order";
	}
	
	
	/**
	 * 跳转到房间明细页面
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "weixin/room_details.html")
	public String page2WeiXinRoomDetails(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		String category_id = request.getParameter("category_id");
		Map categoryMap = this.categoryBO.findCategoryByCategoryId(category_id);
		List categoryAttrList = this.categoryAttrBO.findCategoryAttrByCategoryId(category_id);
		request.setAttribute("category", categoryMap);
		request.setAttribute("categoryAttrs", categoryAttrList);
		return "weixin/room_details";
	}
	
	
	/**
	 * 跳转订单明细页面；
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "weixin/order_details.html")
	public String page2WeiXinOrderDetails(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		String order_id = request.getParameter("order_id");
		//订单信息
		Map orderMap = this.orderBO.findCustOrderByOrderId(order_id);
		request.setAttribute("cust_order", orderMap);

		//所有的房间类型；
		List<Map> categoryList = this.categoryBO.findAllCategory();
		request.setAttribute("categoryList", categoryList);
		
		return "weixin/order_details";
	}
}
