package org.zcsoft.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 表名
 * @author	yu.baocheng
 * @date	2015-9-23
 */
@Target(ElementType.TYPE)  
@Retention(RetentionPolicy.RUNTIME)  
public @interface Table {
	/**表名；
	 * @return
	 */
	public String tableName();
}
