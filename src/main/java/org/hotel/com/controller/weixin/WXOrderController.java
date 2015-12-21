package org.hotel.com.controller.weixin;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hotel.com.bo.MenuBO;
import org.hotel.com.bo.OrderBO;
import org.hotel.com.model.CustOrderVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 微信接口 - 订单信息
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Controller
public class WXOrderController{
	
	private static final Logger logger = LoggerFactory.getLogger(WXOrderController.class);
	
	@Autowired
	private MenuBO menuBO;
	@Autowired
	private OrderBO orderBO;
	
	/**
	 * 房间预定，创建订单；
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 */
	@RequestMapping(value="/weixin/booking.html")
	public String createBooking(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model) throws Exception {
		String user_name = request.getParameter("user_name"); //入住人
		String certi_no = request.getParameter("certi_no");//身份证号
		String phone = request.getParameter("phone");//联系电话
		String message = request.getParameter("msg");//留言信息
		String apply_date = request.getParameter("apply_date");//入住日期
		String category_id = request.getParameter("category_id");//房间类型ID
		
		try{
			String order_id = this.orderBO.createNewOrder(user_name, certi_no, phone, message, category_id,CustOrderVO.ORDER_TYPE_WEIXIN,apply_date);
			if(!StringUtils.isEmpty(order_id)){
				//成功；
				request.setAttribute("title", "房间预订");
				request.setAttribute("message", "预订成功");
				request.setAttribute("className", "weui_icon_success");
				request.setAttribute("redirectURL", "order_details.html?order_id="+order_id);//重点向页面的URL
				request.setAttribute("redirectMsg", "查看详情");
				
			}else{
				//失败；
				request.setAttribute("title", "房间预订");
				request.setAttribute("message", "预订失败");
				request.setAttribute("className", "weui_icon_warn");
				request.setAttribute("redirectURL", "javascript:history.go(-1);");//重点向页面的URL
				request.setAttribute("redirectMsg", "返回");
			}
		}catch(Exception e){
			e.printStackTrace();
			//失败；
			request.setAttribute("title", "房间预订");
			request.setAttribute("message", "系统异常，请返回页面联系客服！");
			request.setAttribute("className", "weui_icon_warn");
			request.setAttribute("redirectURL", "javascript:history.go(-1);");//重点向页面的URL
			request.setAttribute("redirectMsg", "返回");
		}
		return "weixin/opmsg"; 
	}
}
