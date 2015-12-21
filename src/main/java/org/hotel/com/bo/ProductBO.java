package org.hotel.com.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hotel.com.model.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zcsoft.core.orm.BaseDaoUtils;
import org.zcsoft.core.orm.SqlExeUtils;


@Service(value="productBO")
public class ProductBO {
	
	@Autowired
	private BaseDaoUtils<ProductVO> baseDaoUtils;

	@Autowired
	private SqlExeUtils sqlExeUtils;
	
	/**
	 * 通过product_id查询Product数据；
	 * @param product_id
	 * @return
	 * @throws Exception
	 */
	public Map findProductByProductId(String product_id) throws Exception{
		return this.sqlExeUtils.queryForMap("select * from product where product_id = ?", product_id);
	}
	
	/**
	 * 通过类型查询所有的产品；
	 * @param category_id
	 * @return
	 * @throws Exception
	 */
	public List findProductByCategoryId(String category_id) throws Exception{
		if(StringUtils.isEmpty(category_id)) return new ArrayList();
		StringBuffer selectSQL = new StringBuffer();
		selectSQL.append("select * from product where category_id = ?");
		return this.sqlExeUtils.queryForList(selectSQL.toString(), category_id);
	}
	
	
}
