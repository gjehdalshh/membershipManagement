package spring.membership.com.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import spring.membership.com.common.Utils;
import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.UserDTO;

@Service
public class UserService {
	
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private HttpSession hs;
	
	// 회원가입
	public int insUser(UserDTO dto) {
		
		UserDomain vo = mapper.selUser(dto);
		
		if(!dto.getPw().equals(dto.getCkPw())) {
			return 2;
		}
		if(vo != null) {
			if(vo.getId().equals(dto.getId())) {
				return 3;
			}
			if(vo.getNick().equals(dto.getNick())) {
				return 4;
			}
		}
		
		dto.setPw(bcrypt.encode(dto.getPw()));

		return mapper.intUser(dto);
	}
	
	// 로그인
	public int login(UserDTO dto) {

		UserDomain vo = mapper.selUser(dto);
		
		if(vo == null) {
			return 2;
		}

		if(!bcrypt.matches(dto.getPw(), vo.getPw())) {
			return 3;
		}
		
		hs.setAttribute("loginUser", vo);
	
		return 1;
	}

}



