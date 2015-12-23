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
	 * 
	 * @param categoryParam
	 * @return
	 * @throws Exception
	 */
	public boolean insert(CategoryVO categoryVO)throws Exception{
		StringBuffer insertSql = new StringBuffer();
		insertSql.append("insert into category");
		insertSql.append(" (category_id,category_name,image_path,category_keyword,create_date,category_desc,price,count,category_state)");
		insertSql.append(" values(?,?,?,?,?,?,?,?,?)");
		categoryVO.setCategory_id(SqlUtils.getUUID());
		int count = this.sqlExeUtils.update(insertSql.toString(), categoryVO.toList().toArray());
		if(count > 0){
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}
}
