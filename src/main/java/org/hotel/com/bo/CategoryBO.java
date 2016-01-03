package org.hotel.com.bo;

import java.util.List;
import java.util.Map;

import org.hotel.com.model.CategoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zcsoft.core.orm.BaseDaoUtils;
import org.zcsoft.core.orm.BaseVO;
import org.zcsoft.core.orm.SqlExeUtils;
import org.zcsoft.core.orm.SqlUtils;


@Service(value="categoryBO")
public class CategoryBO {
	
	@Autowired
	private BaseDaoUtils<CategoryVO> baseDaoUtils;

	@Autowired
	private SqlExeUtils sqlExeUtils;
	
	/**
	 * 通过product_id查询Product数据；
	 * @param category_id
	 * @return
	 * @throws Exception
	 */
	public Map findCategoryByCategoryId(String category_id) throws Exception{
		return this.sqlExeUtils.queryForMap("select * from category where category_id = ? ", category_id);
	}
	
	/**
	 * 获取所有的商品类型；
	 * @return
	 * @throws Exception
	 */
	public List findAllCategory() throws Exception{
		StringBuffer selectSQL = new StringBuffer();
		selectSQL.append("SELECT category_id,category_name,image_path, category_state,if(category_state='00A','有效',if(category_state='00X','无效','')) as category_state_name,price,count,category_keyword,DATE_FORMAT(create_date,'%Y-%m-%d %H:%i:%S') as create_date,category_desc from category ");
		return this.sqlExeUtils.queryForList(selectSQL.toString(), null);
	}
	
	
	/**
	 * 新增Category
	 * @param categoryParam
	 * @return
	 * @throws Exception
	 */
	public boolean insert(CategoryVO categoryVO)throws Exception{
		StringBuffer insertSql = new StringBuffer();
		insertSql.append("insert into category");
		insertSql.append(" (category_id,category_name,image_path,category_keyword,create_date,category_desc,price,count,category_state)");
		insertSql.append(" values(?,?,?,?,now(),?,?,?,?)");
		categoryVO.setCategory_id(SqlUtils.getUUID());
//		int count = this.sqlExeUtils.update(insertSql.toString(), categoryVO.toArray());
		int count = this.sqlExeUtils.update(insertSql.toString(), 
				categoryVO.getCategory_id(),
				categoryVO.getCategory_name(),
				categoryVO.getImage_path(),
				categoryVO.getCategory_keyword(),
				categoryVO.getCategory_desc(),
				categoryVO.getPrice(),
				categoryVO.getCount(),
				categoryVO.getCategory_state());
		if(count > 0){
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}
	
	/**
	 * 更新 Category 的状态；
	 * @param category_id
	 * @param category_state
	 * @return
	 * @throws Exception
	 */
	public boolean updateCategoryState(String category_id,String category_state) throws Exception{
		StringBuffer updateSql = new StringBuffer();
		updateSql.append("update category set category_state = ? where category_id = ?");
		int count = this.sqlExeUtils.update(updateSql.toString(),category_state,category_id);
		if(count > 0){
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}
	
	public boolean updateCategory(CategoryVO categoryVO) throws Exception{
		StringBuffer updateSQL = new StringBuffer();
		updateSQL.append("update category set category_name = ?, image_path = ?, category_state = ?, price = ?, count = ?, category_keyword = ?, category_desc = ? where category_id = ?");
		int count = this.sqlExeUtils.update(updateSQL.toString(), 
				categoryVO.getCategory_name(),
				categoryVO.getImage_path(),
				categoryVO.getCategory_state(),
				categoryVO.getPrice(),
				categoryVO.getCount(),
				categoryVO.getCategory_keyword(),
				categoryVO.getCategory_desc(),
				categoryVO.getCategory_id());
		if(count > 0){
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}
	
	/**
	 * 删除Category
	 * @param category_id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteCategory(String category_id) throws Exception{
		StringBuffer deleteSql = new StringBuffer();
		deleteSql.append("delete from category where category_id = ? ");
		int count = this.sqlExeUtils.update(deleteSql.toString(), category_id);
		if(count > 0){
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}
	
	public Boolean deleteCategory(String category_id,String category_name) throws Exception{
		
		return null;
	}
}
