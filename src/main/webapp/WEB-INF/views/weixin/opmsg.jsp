<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ ctxPath }/styles/weui.css" />
<link rel="stylesheet" href="${ ctxPath }/styles/example.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="page">
		<div class="hd">
			<h1 class="page_title">${ title }</h1>
		</div>
		<div class="bd">
			<div class="weui_msg">
				<div class="weui_icon_area">
					<i class="${ className } weui_icon_msg"></i>
				</div>
				<div class="weui_text_area">
					<h2 class="weui_msg_title">${ message }</h2>
				</div>
				<div class="weui_opr_area">
					<p class="weui_btn_area">
						<a href="${ redirectURL }" class="weui_btn weui_btn_primary">${ redirectMsg }</a>
						<!-- <a href="javascript:;" class="weui_btn weui_btn_default"></a> -->
					</p>
				</div>
				<%--
                    <div class="weui_extra_area">
                        <a href="">查看详情</a>
                    </div>
                --%>
			</div>
		</div>
	</div>

</body>
</html>