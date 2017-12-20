/* 
 * Created on 2005-7-1 
 * 
 * TODO To change the template for this generated file go to 
 * Window - Preferences - Java - Code Style - Code Templates 
 */
package com.qf.util.html2pdf;

import java.awt.Dimension;
import java.awt.Insets;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;

/**
 * @author jcoder
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class HTMLconvertPDF {

	protected Dimension format = PD4Constants.A4;

	protected boolean landscapeValue = false;

	protected int topValue = 10;

	protected int leftValue = 10;

	protected int rightValue = 10;

	protected int bottomValue = 10;

	protected String unitsValue = "mm";

	protected String proxyHost = "";

	protected int proxyPort = 0;

	protected int userSpaceWidth = 780;

	public void runConverter(String urlstring, String fileName,String path,
			HttpServletResponse response) throws IOException {

		if (urlstring.length() > 0) {

			if (!urlstring.startsWith("http://")
					&& !urlstring.startsWith("file:")) {

				urlstring = "http://" + urlstring;

			}

			ByteArrayOutputStream ba = new ByteArrayOutputStream();

			if (proxyHost != null && proxyHost.length() != 0 && proxyPort != 0) {

				System.getProperties().setProperty("proxySet", "true");

				System.getProperties().setProperty("proxyHost", proxyHost);

				System.getProperties().setProperty("proxyPort", "" + proxyPort);

			}

			PD4ML pd4ml = new PD4ML();
			pd4ml.setPageSize(new java.awt.Dimension(450, 450));
			pd4ml.setPageInsets(new java.awt.Insets(20, 50, 10, 10));
			pd4ml.enableImgSplit(false);
			pd4ml.useTTF("java:com/qf/util/html2pdf/fonts", true);
			pd4ml.enableDebugInfo();

			try {

				pd4ml.setPageSize(landscapeValue ? pd4ml
						.changePageOrientation(format) : format);

			} catch (Exception e) {

				e.printStackTrace();

			}

			if (unitsValue.equals("mm")) {

				pd4ml.setPageInsetsMM(new Insets(topValue, leftValue,

				bottomValue, rightValue));

			} else {

				pd4ml.setPageInsets(new Insets(topValue, leftValue,

				bottomValue, rightValue));

			}

			pd4ml.setHtmlWidth(userSpaceWidth);
			URL url = new URL(urlstring);
			pd4ml.render(urlstring, ba);
			
			if(fileName.lastIndexOf(".pdf")==-1)
				fileName = fileName + ".pdf";
			try {
				response.setHeader("Content-disposition",
						"attachment; filename="
								+ new String(fileName.getBytes("gb2312"),
										"iso8859-1"));
//				response.setHeader("Content-disposition",
//						"attachment; filename="
//								+ new String(fileName.getBytes("gb2312"),
//										"iso8859-1"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			response.setContentType("application/pdf");
			response.setContentLength(ba.size());
			try {
				ServletOutputStream out = response.getOutputStream();
				FileOutputStream fos = new FileOutputStream(new File(path));
				ba.writeTo(fos);
				fos.flush();
				fos.close();
				ba.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}

}