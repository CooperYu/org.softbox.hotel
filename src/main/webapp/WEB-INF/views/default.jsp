<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<script type="text/javascript">
		//获取浏览终端的信息；
		var browser={ 
			versions:function(){
				var u = navigator.userAgent, app = navigator.appVersion; 
				return {
					trident: u.indexOf('Trident') > -1,//IE内核
					presto: u.indexOf('Presto') > -1, //opera内核
					webKit: u.indexOf('AppleWebKit') > -1, //苹果、Google内核
					gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
					mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否是移动终端
					ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),//ios终端
					android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1,//android终端或者UC浏览器 
					iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1,//是否是Iphone或者QQHD浏览器
					iPad: u.indexOf('iPad') > -1,//是否是IPad 
					webApp: u.indexOf('Safari') == -1//是否Web应用程序，没有头部和底部； 
				};	
			}()
		};
		<%--
		browser.versions.
		document.writeln("是否是移动终端"+browser.versions.mobile+"<br/>");
		document.writeln("是否是IOS终端："+browser.versions.ios+"<br/>");
		document.writeln("是否是android手机“"+browser.versions.android+"<br/>");
		document.writeln("是否是iPhone 手机："+browser.versions.iPhone+"<br/>");
		document.writeln("是否是IPad："+browser.versions.iPad+"<br/>");
		document.writeln(navigator.userAgent+"<br/>"); 
		--%>
	</script>
	
	<!-- Basic Page Needs	================================================== -->
	<title><tiles:insertAttribute name="title" /> - HOME</title> 
</head>
<body>
<%-- 	<a href="${ ctxPath }/weixin/default.html">微信页面</a> --%>
	<!-- SLIDER -->
	<div id="outerslider">
		<div id="slidercontainer">
			<section id="slider">

			<div id="feature_gallery">
				<div class="bigimg">
					<img src="images/content/slide1.jpg" alt="" class="change" />
					<div class="slidedesc">Maecenas lobortis consectetur metus,
						cursus malesuada lacus interdum sit amet</div>
				</div>
				<div class="bigimg">
					<img src="images/content/slide2.jpg" alt="" class="change" />
					<div class="slidedesc">Pellentesque at urna sit amet lorem
						condimentum aliquet.</div>
				</div>
				<div class="bigimg">
					<img src="images/content/slide3.jpg" alt="" class="change" />
					<div class="slidedesc">Curabitur vel felis imperdiet tortor
						varius vehicula a quis velit.</div>
				</div>
				<div class="bigimg">
					<img src="images/content/slide4.jpg" alt="" class="change" />
					<div class="slidedesc">Morbi cursus quam vel sem cursus
						consequat consequat lacus bibendum.</div>
				</div>
				<div class="bigimg">
					<img src="images/content/slide2.jpg" alt="" class="change" />
					<div class="slidedesc">Quisque malesuada lorem nec mauris
						ornare rutrum egestas magna sodales.</div>
				</div>
				<div class="bigimg">
					<img src="images/content/slide3.jpg" alt="" class="change" />
					<div class="slidedesc">Sed semper lacus iaculis est pretium
						at ultrices ligula cursus.</div>
				</div>
			</div>
			<div id="pager-container">
				<a href="#" id="mycarousel-prev"></a> <a href="#"
					id="mycarousel-next"></a>
			</div>

			</section>
		</div>
	</div>
	<!-- END SLIDER -->

	<!-- BEFORE CONTENT -->
	<div id="outerbeforecontent">
		<div id="beforecontent">
			<section id="beforethecontent">
			<div class="box">
				<h2>Romantic Getaway</h2>
				<p>Nunc tortor ante, accumsan vel malesuada vulputate, tempus
					quis dolor. In ut purus nulla. Etiam tincidunt pharetra metus eget
					ultricies. Integer mi ante, laoreet cursus.</p>
				<a href="${ ctxPath }/room_details.html" class="button">Read More</a>
			</div>
			<div class="box">
				<h2>Family Getaway</h2>
				<p>Nunc tortor ante, accumsan vel malesuada vulputate, tempus
					quis dolor. In ut purus nulla. Etiam tincidunt pharetra metus eget
					ultricies. Integer mi ante, laoreet cursus.</p>
				<a href="${ ctxPath }/room_details.html" class="button">Read More</a>
			</div>
			<div class="box last">
				<h2>Suite Getaway</h2>
				<p>Nunc tortor ante, accumsan vel malesuada vulputate, tempus
					quis dolor. In ut purus nulla. Etiam tincidunt pharetra metus eget
					ultricies. Integer mi ante, laoreet cursus.</p>
				<a href="${ ctxPath }/room_details.html" class="button">Read More</a>
			</div>
			<div class="clear"></div>
			</section>
		</div>
	</div>
	<!-- END BEFORE CONTENT -->
	<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" title="ç½ç«æ¨¡æ¿">ç½ç«æ¨¡æ¿</a></div>

	<!-- MAIN CONTENT -->
	<div id="outermain">
		<div id="maincontent">
			<section id="mainthecontent"> 
				<article> 
					<img src="images/content/bell.png" alt="" class="alignright" />
					<h1>Welcome</h1>
					<p class="colortext">Mauris malesuada ultrices consectetur.
						Suspendisse varius ante quis mauris gravida auctor. Nam cursus felis
						non ipsum feugiat ullamcorper. Nunc ac aliquet eros.</p>
		
					<p>Nam eget justo velit. Vestibulum dignissim vestibulum
						volutpat. Morbi quam odio, facilisis ut scelerisque id, pretium
						blandit diam. Suspendisse quam magna, sollicitudin vitae volutpat
						et, porttitor ut sem. Mauris nec dolor erat. Vestibulum condimentum
						libero ac elit rutrum pharetra. Nunc aliquet nisi et erat vulputate
						pellentesque.</p>
		
					<p>Nullam vel lacus et velit placerat convallis vitae in lorem.
						Fusce massa risus, viverra ut dapibus ut, tempus sit amet metus.
						Duis in elit nisi. In hac habitasse platea dictumst.</p>
		
				</article>
				<%--
				<div class="clear"></div>
				<div class="separator line"></div>
				
				<article class="row">
					<div class="one_fourth">
						<span class="dropcap4">1</span>
						<h4>Design Ideas</h4>
						<p>Pellentesque enim lacus, viverra eu egestas vel, imperdiet
							non felis. Aliquam erat volutpat. Nullam facilisis aliquet
							eleifend.</p>
					</div>
					<div class="one_fourth">
						<span class="dropcap4">2</span>
						<h4>Problem Areas</h4>
						<p>Pellentesque enim lacus, viverra eu egestas vel, imperdiet
							non felis. Aliquam erat volutpat. Nullam facilisis aliquet
							eleifend.</p>
					</div>
					<div class="one_fourth">
						<span class="dropcap4">3</span>
						<h4>Green Garden</h4>
						<p>Pellentesque enim lacus, viverra eu egestas vel, imperdiet
							non felis. Aliquam erat volutpat. Nullam facilisis aliquet
							eleifend.</p>
					</div>
					<div class="one_fourth lastcols">
						<span class="dropcap4">4</span>
						<h4>Planting Areas</h4>
						<p>Pellentesque enim lacus, viverra eu egestas vel, imperdiet
							non felis. Aliquam erat volutpat. Nullam facilisis aliquet
							eleifend.</p>
					</div>
				</article>
				<div class="clear"></div>
				--%>
			</section>
	</div>
	<!-- END MAIN CONTENT -->
</body>
</html>
