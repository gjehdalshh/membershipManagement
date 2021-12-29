package spring.membership.com.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApiController {
	
	@GetMapping("/api/index")
	public void index() {}
}
