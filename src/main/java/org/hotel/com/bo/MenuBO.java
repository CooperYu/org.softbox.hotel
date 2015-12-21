package org.hotel.com.bo;

import java.util.List;
import java.util.Map;

import org.hotel.com.model.MenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zcsoft.core.orm.BaseDaoUtils;


/**
 * 菜单Bo
 * @author	yu.baocheng
 * @date	2015-9-25
 */
@Service(value="menuBO")
public class MenuBO {
	
	@Autowired
	private BaseDaoUtils<MenuVO> daoUtils;
	
	/**
	 * 保存对象；
	 * @param menu
	 * @throws Exception
	 */
	public void saveMenu4Model(MenuVO menu) throws Exception{
		this.daoUtils.save(menu);
	}
	
	/**
	 * 查询父ID 下级的Menu；
	 * @param menu_id
	 * @return
	 * @throws Exception
	 */
	public List findMenuByParentId(Integer menu_parent_id) throws Exception{
		MenuVO entity = new MenuVO();
		entity.setMenu_parent_id(menu_parent_id);
		entity.setMenu_state("00A");
		return this.daoUtils.queryByFields(entity);
	}
	
	public List findMenuByMenuDepth(String menu_depth) throws Exception{
		return null;
	}
	
	public Map findMenuByMenuId(String menu_id) throws Exception{
		return null;
	}
	
	/**
	 * 通过 menu_id 拼装导航
	 * @param menu_id
	 * @return
	 * @throws Exception
	 */
	public String findNavByMenuId(String menu_id) throws Exception{
		
		return null;
	}
}
