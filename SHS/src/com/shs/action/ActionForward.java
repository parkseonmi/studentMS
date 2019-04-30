package com.shs.action;

public class ActionForward {
	// view page(결과값을 어디로 넘길지 결정)
	private String path; // = shs_index.jsp
	
	private boolean isRedirect; // false값이 들어있음
	// 페이지 넘길 때 2가지 방법
	// 1) sendRedirect
	// 2) forward
	// true -> sendRedirect
	// false -> forward
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path; // = shs_index.jsp
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}
