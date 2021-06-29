package com.kh.interactFunding.common.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PageBarUtils {

	public static String getRenamedFilename(String originalFilename) {
		
		//확장자 추출
		int beginIndex = originalFilename.lastIndexOf(".");
		String ext = originalFilename.substring(beginIndex);
		
		//년월일_난수 formant
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
		DecimalFormat df = new DecimalFormat("000");
		
		return sdf.format(new Date())+df.format(Math.random()*1000)+ext;
	}
	
	/**
	 *  1. cPage 
	 *  2. limit 6
	 * 	3. totalContents 총 컨텐츠수
	 * 	4. url 이동할 주소 /spring/board/boardList.do
	 *  ----------------------------------------
	 * 	5. totalPage 전체페이지수 - pageNo 넘침 방지
	 * 	6. pageBarSize 페이지바에 표시할 페이지 개수 지정 : 5
	 * 	7. pageStart ~ pageEnd pageNo의 범위
	 * 	8. pageNo 페이지넘버를 출력할 증감변수
	 * 
	 * @param cPage
	 * @param numPerPage
	 * @param totalContents
	 * @param url
	 * @return
	 */
	public static String getPageBar(int totalContents, int cPage, int limit, String url) {
		StringBuilder pageBar = new StringBuilder();
		final int pageBarSize = 5;
		final int totalPage = (int) Math.ceil((double) totalContents / limit);
		final int pageStart = ((cPage - 1) / pageBarSize) * pageBarSize + 1; 
		final int pageEnd = pageStart + pageBarSize - 1;
		if(url.indexOf("?")==-1) {
			url+= "?cPage=";
		}else {
			url += "&cPage=";
		}
		int pageNo = pageStart;
		
		
		//현재페이지바
//		pageBar.append("<ul>");
//		//1. 이전영역
//		if(pageNo == 1) {}
//		else {
//			pageBar.append("<li class='cPage'><a href='"+url+(pageNo-1)+"' class='prev'><</a></li>");
//		}
//		
//		//2. pageNo 영역
//		while(pageNo <= pageEnd && pageNo <= totalPage) {
//			if(pageNo == cPage) {
//				pageBar.append("<li class='cPage'><span class='cPageA'>"+pageNo+"</span></li>");
//			}else {
//				pageBar.append("<li class='cPage'><a href='"+url+pageNo+"'>"+pageNo+"</a>");
//			}
//			pageNo++;
//		}
//		
//		//3. 다음영역
//		if(pageNo > totalPage) {}
//		else {
//			pageBar.append("<li class='cPage'><a href='"+url+pageNo+"' class='next'>></a></li>");
//		}
//		
//		pageBar.append("</ul>");
		
		// 페이지바
		//1. 이전영역
		if(pageNo == 1) {}
		else {
			pageBar.append("<a href='"+url+(pageNo-1)+"'/><</a>\n");
		}
		
		//2. pageNo영역
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				pageBar.append("<span class='cPage'>"+pageNo+"</span>");
			}else {
				pageBar.append("<a href='"+url+pageNo+"'/>"+pageNo+"</a>\n");
			}
			pageNo++;
		}
		//3. 다음영역
		if(pageNo > totalPage) {}
		else {
			pageBar.append("<a href='"+url+pageNo+"'/>></a>\n");
		}
		
		//기존 HelloSpringUtils 수정판
//		//1. 이전영역
//		if(pageNo == 1) {
//			//이전버튼 비활성화
//		}
//		else {
//			//이전버튼 활성화
//			pageBar.append("  <li class=\"page-item\">\r\n"
//					+ "      <a class=\"page-link\" href=\"" + url + (pageNo -1) + "\" aria-label=\"Previous\">\r\n"
//					+ "        <span aria-hidden=\"true\">&laquo;</span>\r\n"
//					+ "        <span class=\"sr-only\">Previous</span>\r\n"
//					+ "      </a>\r\n"
//					+ "    </li>");
//		}
//		//2. pageNo영역
//		while(pageNo <= pageEnd && pageNo <= totalPage) {
//			if(pageNo == cPage) {
//				//현재페이지 - 링크비활성화
//				pageBar.append("<li class=\"page-item active\">\r\n"
//						+ "      <a class=\"page-link\" href=\"#\">" + pageNo + "<span class=\"sr-only\">(current)</span></a>\r\n"
//						+ "    </li>");
//			}
//			else {
//				//현재페이지 아닌 경우 - 링크활성화
//				pageBar.append(" <li class=\"page-item\"><a class=\"page-link\" href=\"" + url + pageNo + "\">" + pageNo + "</a></li>");
//			}
//			
//			pageNo++;
//		}
//		
//		//3. 다음영역
//		if(pageNo > totalPage) {
//			//다음버튼 비활성화
//
//		}
//		else {
//			//다음버튼 활성화
//			pageBar.append("<li class=\"page-item\">\r\n"
//					+ "      <a class=\"page-link\" href=\"" + url + pageNo + "\" aria-label=\"Next\">\r\n"
//					+ "        <span aria-hidden=\"true\">&raquo;</span>\r\n"
//					+ "        <span class=\"sr-only\">Next</span>\r\n"
//					+ "      </a>\r\n"
//					+ "    </li>");
//		}
//		
//		pageBar.append("  </ul>\r\n"
//				+ "</nav>");
		
		return pageBar.toString();
	}

}