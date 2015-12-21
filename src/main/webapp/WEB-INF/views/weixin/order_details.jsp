<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/category" prefix="category"%>

<div class="content">
    <section style="max-width: 100%; color: rgb(50, 51, 54); font-family: Helvetica Neue, Helvetica ;Hiragino Sans GB,Microsoft YaHei, 微软雅黑, Arial, sans-serif; font-size: 14px; line-height: 20px; text-align: center; border: 0px none rgb(198, 198, 199); margin-top: 0.5em; margin-bottom: 0.5em; clear: both; box-sizing: border-box  ; word-wrap: break-word  ;">
        <p style="box-sizing: border-box  ; margin: 0px; line-height: 1.5em; max-width: 100%; word-wrap: break-word  ; clear: both; font-size: 1em; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(198, 198, 199);">
			<span style="box-sizing: border-box  ; max-width: 100%; word-wrap: break-word  ; font-family: 微软雅黑;">
				<span style="box-sizing: border-box  ; max-width: 100%; word-wrap: break-word  ; color: rgb(127, 127, 127);">
					<strong style="max-width: 100%; box-sizing: border-box  ; word-wrap: break-word  ;">
						<span style="box-sizing: border-box  ; max-width: 100%; word-wrap: break-word  ; font-size: 18px; letter-spacing: 5px; vertical-align: bottom;">预订信息</span>
					</strong>
				</span>
				<br/>
				<span style="box-sizing: border-box  ; max-width: 100%; word-wrap: break-word  ; color: rgb(127, 127, 127); font-size: 12px; vertical-align: bottom;">
					<strong style="max-width: 100%; box-sizing: border-box  ; word-wrap: break-word  ;">
						<span style="box-sizing: border-box  ; max-width: 100%; word-wrap: break-word  ; color: rgb(165, 165, 165); letter-spacing: 2px; margin-top: 5px; vertical-align: top;">typography</span>
					</strong>
				</span>
			</span>
        </p>	
    </section>

	<HR style="FILTER: alpha(opacity=0,finishopacity=100,style=1)" width="80%" color=#987cb9 SIZE=3>
	
	<div id="contactform" style="margin: 0px 0px 20px 5%;">
		<fieldset>
			<select id="category_id" name="category_id" class="text-input" disabled="disabled">
				<c:forEach items="${ categoryList }" var="category">
					<c:choose>
						<c:when test="${ category.category_id eq cust_order.order_items[0].category_id  }">
							<option selected="selected" value="${ category.category_id }">${ category.category_name }</option>
						</c:when>
						<c:otherwise>
							<option value="${ category.category_id }">${ category.category_name }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<br/><br/>
			<input type="text" style="color:black;" name="user_name" id="user_name" size="50" value="${ cust_order.user_name }" class="text-input"  disabled="disabled"/>
			<input type="text" style="color:black;" name="phone" id="phone" size="50" value="${ cust_order.phone }" class="text-input" disabled="disabled" />
			<input type="text" style="color:black;" name="certi_no" id="certi_no" value="${ cust_order.certi_no }" class="text-input" disabled="disabled" />
			<input type="text" style="color:black;" name="apply_date" id="apply_date" value="${ cust_order.order_items[0].apply_date }" class="text-input" readonly="readonly" disabled="disabled" />
			<textarea cols="10" style="color:black;" rows="10" name="msg" id="msg" class="text-input" disabled="disabled">${ cust_order.order_items[0].item_desc }</textarea>
			<div>
<!-- 				<a href="#" class="button" onclick="document.getElementById('contact').submit();">预定</a> -->
				<a href="tel:10010" class="button" onclick="javascript:void(0);">呼叫客服</a>
			</div>
		</fieldset>
	</div>
	<!-- end contactform -->
	
	
</div>

