package org.zcsoft.core.orm;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.zcsoft.core.annotation.Table;
import org.zcsoft.core.annotation.TableField;

/**
 * 对Model进行查询的DB工具类；
 * 
 * @author yu.baocheng
 * @date 2015-9-24
 */
@Repository
public class BaseDaoUtils<T> extends JdbcDaoSupport {
	
	@Autowired
	private SqlUtils sqlUtils;
	
	/**
	 * 保存对象
	 * @param o
	 */
	public void save(T entity) {
		Class<? extends Object> entityClass = entity.getClass();

		StringBuffer sql = new StringBuffer();
		sql.append("insert into ");
		Table a = (Table) entityClass.getAnnotation(Table.class);
		if (a != null) {
			sql.append(a.tableName());
		} else {
			sql.append(entityClass.getName().substring(entityClass.getName().lastIndexOf(".") + 1));
		}
		sql.append(" (");

		Field[] fields = entityClass.getDeclaredFields();
		String temp = "";
		StringBuffer valueSql = new StringBuffer();
		for (Field f : fields) {
			TableField tf = f.getAnnotation(TableField.class);
			
			/***
			 * 判断是否是主键，一般MySQL主键都是自动增长的；
			 * 如果是主键默认调过，
			 */
			if(tf.isPrimaryKey() && tf.isAutoIncrement()) continue;
			
			// 获得字段第一个字母大写
			String firstLetter = f.getName().substring(0, 1).toUpperCase();
			// 转换成字段的get方法
			String getMethodName = "get" + firstLetter + f.getName().substring(1);
			try {

				Method getMethod = entityClass.getMethod(getMethodName, new Class[] {});
				// 这个对象字段get方法的值
				Object value = getMethod.invoke(entity, new Object[] {});

				if (f.getType().getName().equals(java.lang.String.class.getName())) {
					valueSql.append(temp + "'" + value + "'");
				} else {
					valueSql.append(temp + value);
				}

			} catch (Exception e) {
			}

			if (tf != null) {
				sql.append(temp + tf.fieldName());
			} else {
				sql.append(temp + f.getName());
			}
			temp = ",";
		}

		sql.append(")values(");
		sql.append(valueSql);
		sql.append(")");
		//System.out.println(sql.toString());
		//通过Spring JDBCTemplate模板执行脚本；
		//getJdbcTemplate().execute(sql.toString());
	}
	
	public Map queryByPK(T entity){
		
		Class<? extends Object> entityClass = entity.getClass();
		StringBuffer sql = new StringBuffer();
		sql.append("select  ");
		Table table = (Table) entityClass.getAnnotation(Table.class);
		if (table != null) {
			sql.append(table.tableName());
		} else {
			sql.append(entityClass.getName().substring(entityClass.getName().lastIndexOf(".") + 1));
		}
		sql.append(" (");

		Field[] fields = entityClass.getDeclaredFields();
		String temp = "";
		StringBuffer valueSql = new StringBuffer();
		for (Field f : fields) {
			TableField tf = f.getAnnotation(TableField.class);
			
			/***
			 * 判断是否是主键，一般MySQL主键都是自动增长的；
			 * 如果是主键默认调过，
			 */
			if(tf.isPrimaryKey() && tf.isAutoIncrement()) continue;
			
			// 获得字段第一个字母大写
			String firstLetter = f.getName().substring(0, 1).toUpperCase();
			// 转换成字段的get方法
			String getMethodName = "get" + firstLetter + f.getName().substring(1);
			try {

				Method getMethod = entityClass.getMethod(getMethodName, new Class[] {});
				// 这个对象字段get方法的值
				Object value = getMethod.invoke(entity, new Object[] {});

				if (f.getType().getName().equals(java.lang.String.class.getName())) {
					valueSql.append(temp + "'" + value + "'");
				} else {
					valueSql.append(temp + value);
				}

			} catch (Exception e) {
			}

			if (tf != null) {
				sql.append(temp + tf.fieldName());
			} else {
				sql.append(temp + f.getName());
			}
			temp = ",";
		}

		sql.append(")values(");
		sql.append(valueSql);
		sql.append(")");
		//System.out.println(sql.toString());
		return null;
	}
	
	/**
	 * 查询字段查询，支持多字段查询
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public List queryByFields(T entity) throws Exception{
		Class<? extends Object> entityClass = entity.getClass();
		
		StringBuffer selectSQL = new StringBuffer();
		StringBuffer whereSQL = new StringBuffer();
		StringBuffer orderBySQL = new StringBuffer();
		
		selectSQL.append("select  ");
		whereSQL.append(" where 1 = 1 ");
		orderBySQL.append("order by ");
		
		String temp = " ";
		Field[] fields = entityClass.getDeclaredFields();
		
		for (Field field : fields) {
			TableField tableField = field.getAnnotation(TableField.class);
			
			if(tableField.isOrderField()) orderBySQL.append(tableField.fieldName() +",");
			
			// 获得字段第一个字母大写
			String firstLetter = field.getName().substring(0, 1).toUpperCase();
			// 转换成字段的get方法
			String getMethodName = "get" + firstLetter + field.getName().substring(1);
			try {

				Method getMethod = entityClass.getMethod(getMethodName, new Class[] {});
				// 这个对象字段get方法的值
				Object value = getMethod.invoke(entity, new Object[] {});
				if(null != value && value != ""){
					if (field.getType().getName().equals(java.lang.String.class.getName())) {
						whereSQL.append(" and " + tableField.fieldName() + " = '" + value + "' ");
					} else {
						whereSQL.append(" and " + tableField.fieldName() + " = " + value + " ");
					}
				}
			} catch (Exception e) {}

			selectSQL.append(temp + tableField.fieldName());
			temp = ",";
		}
		
		selectSQL.append(" from ");
		Table table = (Table) entityClass.getAnnotation(Table.class);
		if (table != null) {
			selectSQL.append(table.tableName());
		} else {
			selectSQL.append(entityClass.getName().substring(entityClass.getName().lastIndexOf(".") + 1));
		}
		
		if(orderBySQL.lastIndexOf(",") > 1){
			orderBySQL = new StringBuffer(orderBySQL.substring(0, orderBySQL.lastIndexOf(",")));
		}else{
			orderBySQL = new StringBuffer();
		}
		selectSQL.append(whereSQL);
		selectSQL.append(orderBySQL);
		sqlUtils.printlnSQL(selectSQL.toString());
		List returnList = getJdbcTemplate().queryForList(selectSQL.toString());
		return returnList;
	}
}
