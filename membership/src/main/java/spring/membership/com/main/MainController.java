package spring.membership.com.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.RelationDTO;
import spring.membership.com.dto.UserDTO;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	// 메인 화면 
	@GetMapping("/chat/home")
	public void home(Model model, UserDTO dto, RelationDTO relDto) {
		
		// 친구 리스트 뿌리기
		model.addAttribute("friendList", service.selFriendList(relDto));
		// 친구 수
		model.addAttribute("selFriendCount", service.selFriendCount(relDto));
	}
	
	@PostMapping("/chat/home")
	public void home(Model model, RelationDTO dto) {
		if(dto.getUser_name().equals("")) { // 해당하는 친구가 없다면
			return;
		}
		// 친구 검색
		model.addAttribute("searchList", service.searchUserList(dto));
		// 친구 수
		model.addAttribute("searchListCount", service.searchUserCount(dto));
	}
	
	// 이름으로 친구 추가
	@ResponseBody
	@PostMapping("/chat/insNameFriend")
	public Map<String, Object> insFriend(@RequestBody UserDTO dto) {
		Map<String, Object> val = new HashMap<String, Object>();
		
		val.put("result", service.insNameFriend(dto));
		
		return val;
	}
	
	// 아이디로 친구 추가
	@ResponseBody
	@PostMapping("/chat/insIdFriend")
	public Map<String, Object> instIdFriend(@RequestBody UserDTO dto) {
		
		Map<String, Object> val = new HashMap<String, Object>();
		
		val.put("result", service.insIdFriend(dto));
		
		return val;
	}
	
	// 친구 삭제
	@ResponseBody
	@PostMapping("/chat/delFriend")
	public Map<String, Object> delFriend(@RequestBody RelationDTO dto) {
		Map<String, Object> val = new HashMap<String, Object>();
		
		val.put("result", service.delFriend(dto));
		
		return val;
	}
	
	
	/* list ajax로 뿌리기
	@ResponseBody
	@PostMapping("/chat/SearchProc")
	public Map<String, Object> SearchProc(@RequestBody UserDTO dto) {
		Map<String, Object> val = new HashMap<String, Object>();

		List<UserDomain> list = service.searchUserList(dto);
		for(int i = 0; i < list.size(); i++) {
			val.put("result", list.get(i).getUser_name());
		}
		
		return val;
	}
	*/
	
	
	
	
	@GetMapping("/chat/chatList")
	public void chatList() {
		
		
	}
	
	@GetMapping("/chat/chatRoom")
	public void chatRoom() {
			
	}

	@RequestMapping(value = "/chat/chatRoom", method = RequestMethod.POST)
	public String loginProcess(@RequestParam String id, HttpServletRequest request, Model model, UserDTO dto) {
		
		logger.info("Welcome " + id);
		HttpSession session = request.getSession();
		session.setAttribute("id", id);

		return "chat/chatRoom";
	}

	@GetMapping("/chat/changeInfo")
	public void changeInfo() {
	}
	
}
