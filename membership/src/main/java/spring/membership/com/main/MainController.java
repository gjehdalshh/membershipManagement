package spring.membership.com.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	
	@GetMapping("/chat/home")
	public void home() {}
	
	@GetMapping("/chat/changeInfo")
	public void changeInfo() {}
}
