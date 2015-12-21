package org.hotel.com.controller.web;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hotel.com.bo.CategoryAttrBO;
import org.hotel.com.bo.CategoryBO;
import org.hotel.com.bo.MenuBO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 主标题Controller
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Controller
public class DefaultController{
	
	private static final Logger logger = LoggerFactory.getLogger(DefaultController.class);
	
	@Autowired
	private MenuBO menuBO;
	@Autowired
	private CategoryBO categoryBo;
	@Autowired
	private CategoryAttrBO categoryAttrBo;

	
	/**
	 * 首页
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "default.html")
	public String page2Default(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
//		logger.info("Welcome home! the client locale is "+ locale.toString());
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
//		Menu menu = new Menu();
//		menuBO.saveMenu4Model(menu);
		return "default";
	}
	
	
	/**
	 * 关于我们
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "about.html")
	public String page2About(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		return "about";
	}
	
	/**
	 * 房间预订
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "rooms/room_types.html")
	public String page2RoomTypes(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		List categoryList = this.categoryBo.findAllCategory();
		request.setAttribute("categoryList", categoryList);
		return "room_types";
	}
	
	/**
	 * 房间预订
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "rooms/room_details.html")
	public String page2RoomDetails(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		String category_id = request.getParameter("category_id");
		Map categoryMap = this.categoryBo.findCategoryByCategoryId(category_id);
		List categoryAttrList = this.categoryAttrBo.findCategoryAttrByCategoryId(category_id);
		request.setAttribute("category", categoryMap);
		request.setAttribute("categoryAttrs", categoryAttrList);
		return "room_details";
	}
	
	/**
	 * 酒店设施
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="facilities.html")
	public String page2Facilities(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		return "facilities";
	}
	
	/**
	 * 联系我们
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="contact.html")
	public String page2Contact(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		return "contact";
	}
	
	
	/**
	 * 酒店图片展示
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="gallery.html")
	public String page2Gallery(HttpServletRequest request,HttpServletResponse response,Locale locale, Model model, Exception e) throws Exception {
		return "gallery";
	}
	
	@RequestMapping(value="error.html")
	public String page2Error() throws Exception{
		return "error";
	}
	
}
