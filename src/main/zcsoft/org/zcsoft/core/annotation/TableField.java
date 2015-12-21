package org.zcsoft.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface TableField {
	
	/**
	 * 列名
	 * @return
	 */
	public String fieldName();
	/**
	 * 是否是主键
	 * @return
	 */
	public boolean isPrimaryKey() default false;
	/**
	 * 是否是自动增长列；
	 * @return
	 */
	public boolean isAutoIncrement() default false;
	
	/**
	 * 是否是排序的列
	 * @return
	 */
	public boolean isOrderField() default false;
}
