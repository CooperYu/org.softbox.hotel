package org.hotel.com.controller.web;

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
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 订单 Controller
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Controller
public class OrderController{
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
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
	@RequestMapping(value="/booking.html")
	public String createBooking(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model) throws Exception {
		String user_name = request.getParameter("user_name");
		String certi_no = request.getParameter("certi_no");
		String phone = request.getParameter("phone");
		String message = request.getParameter("msg");
		String category_id = request.getParameter("category_id");//房间类型ID
		String apply_date = request.getParameter("apply_date");//入住时间；
		boolean create_flag = Boolean.FALSE;
		try{
			request.getSession().setAttribute("create_flag", this.orderBO.createNewOrder(user_name, certi_no, phone, message, category_id,CustOrderVO.ORDER_TYPE_WEB,apply_date));
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("create_flag", create_flag);
			return "rooms/room_details";
		}
		return "redirect:/rooms/room_details.html?category_id="+ category_id; 
	}
}
