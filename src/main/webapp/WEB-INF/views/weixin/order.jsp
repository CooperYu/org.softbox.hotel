<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#apply_date").datepicker();
    });
	
	function booking_submit(){
		if($('#user_name').val() == '' || $('#user_name').val() == '姓名'){
			alert("请输入姓名！");
			return;
		}
		if($('#phone').val() == '' || $('#phone').val() == '电话'){
			alert("请输入联系电话！");
			return;
		}
		if($('#certi_no').val() == '' || $('#certi_no').val() == '身份证号'){
			alert("请输入证件号码！");
			return;
		}
		if($('#apply_date').val() == '' || $('#apply_date').val() == '入住日期'){
			alert("请输入入住日期！");
			return;
		}
		
		$('#contactform').submit();
	}
</script>

<div class="content">
    <section style="max-width: 100%; color: rgb(50, 51, 54); font-family: Helvetica Neue, Helvetica ;Hiragino Sans GB,Microsoft YaHei, 微软雅黑, Arial, sans-serif; font-size: 14px; line-height: 20px; text-align: center; border: 0px none rgb(198, 198, 199); margin-top: 0.5em; margin-bottom: 0.5em; clear: both; box-sizing: border-box  ; word-wrap: break-word  ;">
        <p style="box-sizing: border-box  ; margin: 0px; line-height: 1.5em; max-width: 100%; word-wrap: break-word  ; clear: both; font-size: 1em; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(198, 198, 199);">
			<span style="box-sizing: border-box  ; max-width: 100%; word-wrap: break-word  ; font-family: 微软雅黑;">
				<span style="box-sizing: border-box  ; max-width: 100%; word-wrap: break-word  ; color: rgb(127, 127, 127);">
					<strong style="max-width: 100%; box-sizing: border-box  ; word-wrap: break-word  ;">
						<span style="box-sizing: border-box  ; max-width: 100%; word-wrap: break-word  ; font-size: 18px; letter-spacing: 5px; vertical-align: bottom;">房间预订</span>
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
	
	<form id="contactform" action="${ ctxPath }/weixin/booking.html" method="post" />
		<div id="contact" style="margin: 0px 0px 20px 5%">
			<fieldset>
				<select id="category_id" name="category_id" class="text-input">
					<c:forEach items="${ categoryList }" var="category">
						<option value="${ category.category_id }">${ category.category_name }</option>
					</c:forEach>
				</select>
				<br/><br/>
				<input type="text" name="user_name" id="user_name" size="50" value="姓名" class="text-input" onblur="if (this.value == ''){this.value = '姓名'; }" onfocus="if (this.value == '姓名') {this.value = ''; }" />
				<input type="text" name="phone" id="phone" size="50" value="电话" class="text-input" onblur="if (this.value == ''){this.value = '电话'; }" onfocus="if (this.value == '电话') {this.value = ''; }" />
				<input type="text" name="certi_no" id="certi_no" value="身份证号" class="text-input" onblur="if (this.value == ''){this.value = '身份证号'; }" onfocus="if (this.value == '身份证号') {this.value = ''; }" />
				<input type="text" name="apply_date" id="apply_date" value="入住日期" class="text-input" readonly="readonly" />
				<textarea cols="10" rows="10" name="msg" id="msg" class="text-input">留言</textarea>
				<div>
					<a href="#" class="button" onclick="booking_submit()">预定</a>
					<a href="tel:10010" class="button" onclick="javascript:void(0);">呼叫客服</a>
				</div>
			</fieldset>
		</div>
		<!-- end contactform -->
	</form>
</div>

