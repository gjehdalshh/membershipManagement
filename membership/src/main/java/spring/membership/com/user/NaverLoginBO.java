package spring.membership.com.user;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {
	// 인증 요청문을 구성하는 파라미터
	// 애플리케이션 등록 후 발급 받은 클라이언트 아이디
	private final static String CLIENT_ID = "y0kGyn11UxPK2sTF3cM5";
	// 애플리케이션 등록 후 발급 받은 클라이언트 비밀코드
	private final static String CLIENT_SECRET = "NvEYBenErH";
	// 네이버 로그인 인증 결과를 전달받을 콜백 url
	private final static String REDIRECT_URL = "http://localhost:8090/user/naverCallBack";
	// 애플리케이션이 생성한 상태 토큰
	private final static String SESSION_STATE = "oauth_state";
	
	// 프로필 조회 API URL
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	// 네이버 아이디로 인증 url 생성 메서드
	public String getAuthzationUrl(HttpSession session) {
		// 세션 유효성 검증을 위한 난수 생성
		String state = generateRandomString();
		setSession(session, state);
		
		// scribe에서 제공하는 인증 url 생성 기능을 이용하여 네아로 인증 url 생성
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URL)
				.state(state)
				.build(NaverLoginAPI.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	// 네이버 아이디로 callback 처리 및 accessToken 획득 메서드
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
		
		// callback으로 전달받은 세션검증용 난수값과 세션에 저장되어 있는 값이 일치하는지 확인
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)) {
			
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URL)
					.state(state)
					.build(NaverLoginAPI.instance());
			
			// scribe에서 제공하는 accesstoken 획득 기능으로 네아로 accessToken을 획득
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	// 세션 유효성 검증을 위한 난수 생성기
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	// http session에 데이터 저장
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	// http session에서 데이터 가져오기
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	// accessToken을 이용하여 네이버 사용자 프로필 api를 호출
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
		
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(CLIENT_ID).build(NaverLoginAPI.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL,  oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
}
