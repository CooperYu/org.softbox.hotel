package org.hotel.com.controller.web;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.hotel.com.bo.CategoryAttrBO;
import org.hotel.com.bo.CategoryBO;
import org.hotel.com.bo.MenuBO;
import org.hotel.com.bo.OrderBO;
import org.hotel.com.model.CategoryVO;
import org.hotel.com.utils.AdminConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zcsoft.core.web.PageModel;


/**
 * 后台 Controller
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Controller
@RequestMapping("/admin/") 
public class AdminController{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private MenuBO menuBO;
	@Autowired
	private CategoryBO categoryBo;
	@Autowired
	private CategoryAttrBO categoryAttrBo;
	
	@Autowired
	private OrderBO orderBo;

	
	/**
	 * 跳转到登录页面
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "login.html")
	public String page2AdminLogin(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
//		logger.info("Welcome home! the client locale is "+ locale.toString());
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
//		Menu menu = new Menu();
		return "admin/login";
	}
	
	/***
	 * 跳转到订单管理页面
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "index.html")
	public String page2AdminIndex(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		PageModel pageModel = new PageModel();
		Object pageSize = request.getAttribute("pageSize");
		Object pageIndex = request.getAttribute("pageIndex");
		if( null != pageSize){pageModel.setPageSize(pageSize.toString());}
		if( null != pageIndex){pageModel.setPageIndex(pageIndex.toString());}
		//Map queryParams = new HashMap();
		//queryParams.put("order_state", "00A");//设置状态是有效的；
		pageModel = this.orderBo.findAllCustOrderByPageModel(pageModel, null);
		request.setAttribute("pageModel", pageModel);
		return "admin/index";
	}
	
	@RequestMapping(value = "rooms.html")
	public String page2AdminRooms(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		PageModel pageModel = new PageModel();
		Object pageSize = request.getAttribute("pageSize");
		Object pageIndex = request.getAttribute("pageIndex");
		if( null != pageSize){pageModel.setPageSize(pageSize.toString());}
		if( null != pageIndex){pageModel.setPageIndex(pageIndex.toString());}
		Map queryParams = new HashMap();
		queryParams.put("category_state", "00A");//设置状态是有效的；
		List categories = this.categoryBo.findAllCategory();
		request.setAttribute("categories", categories);
		return "admin/rooms";
	}
	
	
	
	/** Ajax 更新数据库 cust_order 的状态，回返更新状态；**/
	@RequestMapping(value = "updateOrderState.html", method = RequestMethod.POST)  
	public @ResponseBody String updateOrderState(HttpServletRequest request,HttpServletResponse response) throws Exception {

		String order_state  = request.getParameter("order_state");
		String order_id = request.getParameter("order_id");
		String result_code = this.orderBo.updateOrderStateByOrderId(order_state, order_id);
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", result_code);
		
		ObjectMapper mapper = new ObjectMapper();
		String returnJson =  mapper.writeValueAsString(returnMap); 
		
		return returnJson;
		
	}
	
	/**Ajax 获取Category By category_id **/
	@RequestMapping(value="getCategoryById.html", method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	public @ResponseBody String getCategoryByCategoryId(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String category_id = request.getParameter("category_id");
		Map category = this.categoryBo.findCategoryByCategoryId(category_id);
		category.put("success", AdminConst.TRUE_FLAG);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(category);
	}
	
	/** Add New Room URL **/
	@RequestMapping(value="addRoom.html" , method = RequestMethod.POST)
	public @ResponseBody String addRooms(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		
		Map hashMap = new HashMap();
		String category_id = request.getParameter("category_id");
		String category_name = request.getParameter("category_name");
		String image_path = request.getParameter("info_path");
		String category_keyword = request.getParameter("category_keyword");
		String category_desc = request.getParameter("category_desc");
		String category_state = request.getParameter("category_state");
		String price = request.getParameter("price");
		String count = request.getParameter("count");
		String action = request.getParameter("action");
		boolean flag = Boolean.FALSE;
		if(StringUtils.equals(action, "new")){
			CategoryVO room = new CategoryVO();
			room.setCategory_name(category_name);
			room.setImage_path(image_path);
			room.setCategory_keyword(category_keyword);
			room.setCategory_desc(category_desc);
			room.setPrice(new BigDecimal(price));
			room.setCount(new Integer(count));
			room.setCategory_state(category_state);
			flag = this.categoryBo.insert(room);
		}else if(StringUtils.equals(action, "modify")){
			CategoryVO room = new CategoryVO();
			room.setCategory_id(category_id);
			room.setCategory_name(category_name);
			room.setImage_path(image_path);
			room.setCategory_keyword(category_keyword);
			room.setCategory_desc(category_desc);
			room.setPrice(new BigDecimal(price));
			room.setCount(new Integer(count));
			room.setCategory_state(category_state);
			flag = this.categoryBo.updateCategory(room);
		}
		
		if(flag){
			hashMap.put("success", AdminConst.TRUE_FLAG);
		}
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(hashMap);
	}
	
	/**  delere room **/
	@RequestMapping(value="delRoom.html" ,method = RequestMethod.POST)
	public @ResponseBody String deleteRoom(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String category_id = request.getParameter("category_id");
		boolean flag  = this.categoryBo.deleteCategory(category_id);
		Map returnMap = new HashMap();
		if(flag){
			returnMap.put("success", AdminConst.TRUE_FLAG);
		}
		ObjectMapper mapper = new ObjectMapper();
		String returnJson =  mapper.writeValueAsString(returnMap); 
		return returnJson;
	}
}
