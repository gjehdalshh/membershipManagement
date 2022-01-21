package spring.membership.com.common;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import spring.membership.com.domain.UserDomain;


public class Utils {
	
	 private Utils() {}
	
	private static class InnerInstanceClazz {
        // 클래스 로딩 시점에서 생성
        private static final Utils uniqueInstance = new Utils();
    }

    public static Utils getInstance() {
        return InnerInstanceClazz.uniqueInstance;
    }
	
    
    // 시간처리 함수
	public String timeFormat(String dateTime) {
		
		int time = Integer.parseInt(dateTime);
		String getTime = "";
		
		if (time < 60) {
			getTime = time + "초 전";
		} else if (time < 3600) {
			getTime = time / 60 + "분 전";
		} else if (time < 86400) {
			getTime = time / 3600 + "시간 전";
		} else if (time < 604800) {
			getTime = time / 86400 + "일 전";
		} else if (time < 2592000) {
			getTime = time / 604800 + "주 전";
		} else if (time < 31104000) {
			getTime = time / 2592000 + "달 전";
		} else {
			getTime = time / 31104000 + "년 전";
		}
		
		return getTime;
	}
}







