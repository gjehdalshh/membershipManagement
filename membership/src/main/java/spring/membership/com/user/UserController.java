package spring.membership.com.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.github.scribejava.core.model.OAuth2AccessToken;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.membership.com.user.NaverLoginBO;
import spring.membership.com.dto.UserDTO;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;

	@GetMapping("/user/login")
	public void login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthzationUrl(session);
		model.addAttribute("url", naverAuthUrl);
	}
	
	@ResponseBody
	@PostMapping("/user/loginProc")
	public Map<String, Object> loginProc(@RequestBody UserDTO dto) {
		
		Map<String, Object> val = new HashMap<String, Object>();
		
		val.put("result", service.login(dto));
		
		return val;
	}
	
	@GetMapping("/user/join")
	public void join() {}
	
	@ResponseBody
	@PostMapping("/user/joinProc")
	public Map<String, Object> joinProc(@RequestBody UserDTO dto) {
	
		Map<String, Object> val = new HashMap<String, Object>();
		
		val.put("result", service.insUser(dto));
		
		return val;
	}
	
	/* ----------------- naver ----------------- */

	// naverLoginBO

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "/user/naverCallBack", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes re)
			throws IOException, ParseException {
		
		
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String 형식의 json 데이터

		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		System.out.println("apiReuslt : " + apiResult);
		// 2. String 형식인 apiResult를 json 형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		
		
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId",nickname);
		//세션 생성
		model.addAttribute("result", apiResult);
		
		return "redirect:/chat/home";
	}
}
