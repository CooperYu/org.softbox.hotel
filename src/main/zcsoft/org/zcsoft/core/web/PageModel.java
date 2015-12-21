package org.zcsoft.core.web;

import java.util.ArrayList;
import java.util.List;


/**
 * 分页模型
 * @author Cooper
 *
 * 2015年12月14日 下午5:04:02
 */
public class PageModel{

	/**<h2>页面大小：每页数据条数；默认10条；</h2>**/
	private String pageSize = "10";
	/**<h2>总共多少条数据</h2>**/
	private String dataTotal;
	/**<h2>当前是第几页,默认第一行数据开始</h2>*/
	private String pageIndex = "1";
	/**<h2>数据列表</h2>**/
	private List dataResult = new ArrayList();
	/**查询脚本**/
	private String querySQL;
	
	/**设置当前页面每页现实多少条数据；＊*/
	public void setPageSize(String pageSize){
		this.pageSize = pageSize;
	}
	
	/**获取页面显示多少条数据**/
	public String getPageSize(){
		return this.pageSize;
	}
	
	/**设置总共有多少条数据**/
	public void setDataTotal(String dataTotal){
		this.dataTotal = dataTotal;
	}
	
	/**获取查询数据的总条数**/
	private String getDataTotal(){
		return this.dataTotal;
	}
	
	/**设置当前是第几页**/
	public void setPageIndex(String pageIndex){
		this.pageIndex = pageIndex;
	}
	
	/**获取当前是第几页**/
	public String getPageIndex(){
		return this.pageIndex;
	}
	
	/**设置分页结果List**/
	public void setDataResult(List list){
		this.dataResult = list;
	}
	
	public List getDataResult(){
		return this.dataResult;
	}
	
	/**获取查询语句**/
	public String getQuerySQL() {
		return querySQL;
	}
	
	/**设置查询语句**/
	public void setQuerySQL(String querySQL) {
		this.querySQL = querySQL;
	}

	
	
	
	
	/**获取共多少页；**/
	public Integer getPageTotal(){
		if((Integer.valueOf(getPageTotal()) % Integer.valueOf(getPageSize())) == 0 ){
			return Integer.valueOf(getDataTotal()) / Integer.valueOf(getPageSize());
		}else{
			return Integer.valueOf(getDataTotal()) / Integer.valueOf(getPageSize()) + 1;
		}
	}
	
	/**是否有下一页**/
	public boolean hasNext(){
		if(Integer.valueOf(getPageIndex()) <= Integer.valueOf(getPageTotal())){
			return Boolean.TRUE;
		}else{
			return Boolean.FALSE;
		}
	}
	
	/**是否有上一次**/
	public boolean hasPrevious(){
		if(Integer.valueOf(getPageIndex()) <= 0 ){
			return Boolean.FALSE;
		}else{
			return Boolean.TRUE;
		}
	}
	
	/**分页时从第多少条数据开始；(当前页码 ＊ 每页显示多少条数据)**/
	public Integer getDataIndex(){
		return (Integer.valueOf(getPageIndex()) - 1) * Integer.valueOf(getPageSize());
	}
}
