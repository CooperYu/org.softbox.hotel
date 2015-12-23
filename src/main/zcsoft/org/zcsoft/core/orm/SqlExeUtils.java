package org.zcsoft.core.orm;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.zcsoft.core.utils.Const;
import org.zcsoft.core.web.PageModel;

/**
 * 操作SQL的工具类
 * @author	yu.baocheng
 * @date	2015-9-24
 */
@Repository
public class SqlExeUtils extends JdbcDaoSupport{
	
	@Autowired
	private SqlUtils sqlUtils;
	
	/**
	 * 执行SQL查询，返回Map对象；
	 * @param sql
	 * @param args
	 * @return Map
	 */
	public Map queryForMap(String sql,Object...args){
		sqlUtils.printlnSQL(sql);
		return getJdbcTemplate().queryForMap(sql, args);
	}
	
	/**
	 * 执行SQL查询，返回List<Map>对象
	 * @param sql
	 * @param args
	 * @return
	 */
	public List<Map<String,Object>> queryForList(String sql,Object...args){
		sqlUtils.printlnSQL(sql);
		return getJdbcTemplate().queryForList(sql, args);
	}
	
	
	public PageModel queryForListByPageModel(PageModel pageModel,Object...args){
		String countSQL = "select count(1) as singleValue from ("+ pageModel.getQuerySQL() +") t ";
		Map countMap = getJdbcTemplate().queryForMap(countSQL,args);
		long count = Const.getLongValue(countMap, "singleValue");
		pageModel.setDataTotal(String.valueOf(count));
		
		String selectSQL = pageModel.getQuerySQL();// + " limit "+ pageModel.getDataIndex() +" , " + pageModel.getPageSize();
		List resultList = getJdbcTemplate().queryForList(selectSQL, args);
		pageModel.setDataResult(resultList);
		return pageModel;
	}
	
	
	/**
	 * 执行SQL，update操作，返回受影响的行数；
	 * @param sql
	 * @param args
	 * @return
	 */
	public int update(String sql,Object...args){
		sqlUtils.printlnSQL(sql);
		return getJdbcTemplate().update(sql, args);
	}
	
	/***
	 * 查询返回一个结果，结果类型在 requiredType 参数中定义，如果需要返回String类型，写入String.class 即可
	 * @param sql
	 * @param requiredType
	 * @param args
	 * @return
	 */
	public <T> T queryForSingleValue(String sql,Class<T> requiredType ,Object...args){
		sqlUtils.printlnSQL(sql);
		return getJdbcTemplate().queryForObject(sql, requiredType, args);
	}
}
