package spring.membership.com.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.membership.com.dto.UserDTO;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@GetMapping("/chat/home")
	public void home(Model model, UserDTO dto) {}

	@RequestMapping(value = "/chat/home", method = RequestMethod.POST)
	public String loginProcess(@RequestParam String id, HttpServletRequest request, Model model, UserDTO dto) {

		System.out.println(dto.getUser_name());
		model.addAttribute("searchUserList", service.searchUserList(dto));
		
		logger.info("Welcome " + id);
		HttpSession session = request.getSession();
		session.setAttribute("id", id);

		return "chat/home";
	}

	@GetMapping("/chat/changeInfo")
	public void changeInfo() {
	}

	@GetMapping("/chat/chatRoom")
	public void chatRoom() {
			
	}
}
