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
import spring.membership.com.dto.UserDTO;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@GetMapping("/chat/home")
	public void home(Model model, UserDTO dto) {}
	
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
