package org.hotel.com.bo;

import java.util.List;

import org.hotel.com.model.CategoryAttrVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zcsoft.core.orm.BaseDaoUtils;
import org.zcsoft.core.orm.SqlExeUtils;


/**
 * @author Cooper
 *
 */
@Service(value="categoryAttrBO")
public class CategoryAttrBO {
	
	@Autowired
	private BaseDaoUtils<CategoryAttrVO> baseDaoUtils;

	@Autowired
	private SqlExeUtils sqlExeUtils;
	
	
	/**
	 * 通过category_id查询所有的类型参数
	 * @param category_id
	 * @return
	 */
	public List findCategoryAttrByCategoryId(String category_id) throws Exception{
		CategoryAttrVO categoryAttr = new CategoryAttrVO();
		categoryAttr.setCategory_id(category_id);
		return baseDaoUtils.queryByFields(categoryAttr);
	}
}
