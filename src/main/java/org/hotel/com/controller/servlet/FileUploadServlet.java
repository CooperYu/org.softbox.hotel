package org.hotel.com.controller.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;

public class FileUploadServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		try {
//			String temp = request.getParameter("folder");
			// System.out.println("temp==="+temp);
			// 上传文件的临时目录
			String tempDir = request.getSession().getServletContext().getRealPath("roomsImage");
			String responsePath = request.getSession().getServletContext().getContextPath()+ File.separator + "roomsImage" + File.separator;
			File tFile = new File(tempDir);
			if (!tFile.exists())
				tFile.mkdir();
			// 创建缓冲区
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// 设置缓冲区大小 1*1024*1024 设置1Mb
			factory.setSizeThreshold(1 * 1024 * 1024);
			// 设置缓冲临时目录
			factory.setRepository(new File(tempDir));

			ServletFileUpload upload = new ServletFileUpload(factory);
			// 设置编码
			upload.setHeaderEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			// 设置文件最大值,这里设置5Mb,5*1024*1024;
			upload.setSizeMax(20 * 1024 * 1024);
			
			List<FileItem> fileItems  = upload.parseRequest(request); // 得到所有的文件
			String fileFullPath = StringUtils.EMPTY;
			
			
			for(FileItem fileItem : fileItems){
				if (!fileItem.isFormField() && fileItem.getName().length() > 0) { // 过滤非文件域
					String fileName = fileItem.getName(); // 获取文件名称
					responsePath +=  fileName;
					fileFullPath = tempDir + File.separator + fileName; // 文件最终存放目录
					File file = new File(fileFullPath);
					fileItem.write(file);
					//out.write(fi.toString().getBytes());
					//out.flush();
					//out.close();
				}

			}
			response.getWriter().write(responsePath.substring(request.getContextPath().length() + 1, responsePath.length()));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response); // 默认调用POST
	}
}
