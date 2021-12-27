package spring.membership.com.common;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import spring.membership.com.domain.UserDomain;


public class Utils {
	
	@Autowired
	private HttpSession hs;
	
	 private Utils() {}
	
	private static class InnerInstanceClazz {
        // 클래스 로딩 시점에서 생성
        private static final Utils uniqueInstance = new Utils();
    }

    public static Utils getInstance() {
        return InnerInstanceClazz.uniqueInstance;
    }
	
	public int getSesstionIuser() {
		System.out.println("bbb");
		
		System.out.println((UserDomain)hs.getAttribute("id"));
		
		//UserDomain vo = (UserDomain)hs.getAttribute("id");
		//System.out.println("확인"+vo.getI_user());
		return 1;
	}
}
