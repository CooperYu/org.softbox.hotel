package org.zcsoft.core.orm;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.zcsoft.core.annotation.Table;
import org.zcsoft.core.annotation.TableField;

public class BaseVO<T> {
	
	private T entity;
	
	/**
	 * 转换为 List
	 * @return
	 */
	public List toList(){
		List returnList = new ArrayList();
		Class<? extends Object> entityClass = entity.getClass();
		Table table = entityClass.getAnnotation(Table.class);
		Field[] fields = entityClass.getDeclaredFields();
		String temp = "";
		StringBuffer valueSql = new StringBuffer();
		for (Field f : fields) {
			TableField tf = f.getAnnotation(TableField.class);
			// 获得字段第一个字母大写
			String firstLetter = f.getName().substring(0, 1).toUpperCase();
			// 转换成字段的get方法
			String getMethodName = "get" + firstLetter + f.getName().substring(1);
			try{
				Method getMethod = entityClass.getMethod(getMethodName, new Class[] {});
				// 这个对象字段get方法的值
				Object value = getMethod.invoke(entity, new Object[] {});
				returnList.add(value);
			}catch(Exception e){
				
			}
		}
		return null;
	}
	
}
