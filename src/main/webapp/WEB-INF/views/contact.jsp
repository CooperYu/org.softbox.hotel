<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- MAIN CONTENT -->
<div id="outermain">
	<div id="maincontent">
		<section id="mainthecontent">
			<h1 class="pagetitle">Contact Us</h1>
			<div id="breadcrumb">
				You are here: <a href="index.html">Home</a> / Contact
			</div>

			<div class="eight columns firstcols">
				<p>Nunc tortor ante, accumsan vel malesuada vulputate, tempus
					quis dolor. In ut purus nulla. Etiam tincidunt pharetra metus eget
					ultricies. Integer mi ante, laoreet cursus commodo non, lobortis ut
					magna. Proin libero magna, suscipit quis lacinia eget, sollicitudin
					in elit. Vivamus adipiscing, turpis quis pharetra auctor, nisi
					purus laoreet mi, a tempor enim ligula sit amet est. Class aptent
					taciti sociosqu ad litora torquent per conubia nostra, per inceptos
					himenaeos.</p>
				<div class="two_fifth firstcols">
					<ul class="bullet arrow">
						<li>Green Hotel - Office Blvd No. 356-357</li>
						<li>Farmville Town, LA 12345</li>
					</ul>
				</div>
				<div class="one_fourth">
					<ul class="bullet arrow">
						<li>Fax: +62 500 800 112</li>
						<li>Telp: +62 500 800 123</li>
					</ul>
				</div>
				<div class="one_fourth lastcols">
					<ul class="bullet arrow">
						<li><a href="mailto:testmail@yourdomain.com">testmail@yourdomain.com</a></li>
						<li><a href="http://www.templatesquare.com">www.templatesquare.com</a></li>
					</ul>
				</div>
				<div class="clear"></div>

				<hr />
				<div id="contactform">
					<form id="contact" action="#" />
					<fieldset>
						<span class="error" id="name_error">Please enter name !</span> <span
							class="error" id="email_error">Please enter email address
							!</span> <span class="error" id="email_error2">Please enter valid
							email address !</span> <span class="error" id="msg_error">Please
							enter message !</span> <input type="text" name="name" id="name"
							size="50" value="Name" class="text-input"
							onblur="if (this.value == ''){this.value = 'Name'; }"
							onfocus="if (this.value == 'Name') {this.value = ''; }" /> <input
							type="text" name="email" id="email" size="50" value="Email"
							class="text-input"
							onblur="if (this.value == ''){this.value = 'Email'; }"
							onfocus="if (this.value == 'Email') {this.value = ''; }" /> <input
							type="text" name="subject" id="subject" value="Subject"
							class="text-input"
							onblur="if (this.value == ''){this.value = 'Subject'; }"
							onfocus="if (this.value == 'Subject') {this.value = ''; }" />
						<textarea cols="60" rows="10" name="msg" id="msg"
							class="text-input">Message</textarea>
						<br /> <input type="submit" name="submit" class="button"
							id="submit_btn" value="Send Message" /><br class="clear" />
					</fieldset>
					</form>
				</div>
				<!-- end contactform -->
			</div>
			<div class="four columns lastcols">
				<iframe
					src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Jalan+Kemanggisan+Utama,+Jakarta,+Indonesia&amp;sll=37.0625,-95.677068&amp;sspn=46.092115,79.013672&amp;ie=UTF8&amp;hq=&amp;hnear=Jalan+Kemanggisan+Utama,+Jakarta+Barat,+Jakarta,+Indonesia&amp;ll=-6.189793,106.7908&amp;spn=0.016639,0.034246&amp;z=14&amp;iwloc=A&amp;output=embed"
					style="width: 100%; height: 548px; line-height: normal; border: 0px;"></iframe>
			</div>

			<div class="clear"></div>
		</section>
	</div>
</div>
<!-- END MAIN CONTENT -->