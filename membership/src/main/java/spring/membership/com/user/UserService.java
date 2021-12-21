package spring.membership.com.user;

import java.util.List;

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

		if (!dto.getPw().equals(dto.getCkPw())) {
			return 2;
		}
		if (vo != null) {
			if (vo.getId().equals(dto.getId())) {
				return 3;
			}
			if (vo.getNick().equals(dto.getNick())) {
				return 4;
			}
		}

		if (!dto.getId().contains("@")) {
			return 5;
		}
		if(dto.getPh().contains("-")) {
			return 6;
		}

		dto.setPw(bcrypt.encode(dto.getPw()));

		return mapper.intUser(dto);
	}

	// 로그인
	public int login(UserDTO dto) {

		UserDomain vo = mapper.selUser(dto);

		if (vo == null) {
			return 2;
		}
		
		if (!bcrypt.matches(dto.getPw(), vo.getPw())) {
			return 3;
		}
	
		hs.setAttribute("id", vo);

		return 1;
	}
	
	// 아이디, 비밀번호 찾기
	public UserDomain findInfoProc(UserDTO dto, int check) {
		
		UserDomain vo;
		
		if(check == 1) {
			vo = mapper.findIdProc(dto);
		} else {
			vo = mapper.findPwProc(dto);
		}

		if(vo == null) {
			UserDomain voNull = new UserDomain();
			voNull.setId("error");
			return voNull;
		}
		return vo;
	}
	
	// 비밀번호 찾기(변경)
	public int changePwProc(UserDTO dto) {

		if(!dto.getNew_pw().equals(dto.getNew_chkPw())) {
			return 2;
		}
		if(dto.getNew_pw().equals("")) {
			return 3;
		}
		if(dto.getNew_chkPw().equals("")) {
			return 4;
		}
		dto.setPw(bcrypt.encode(dto.getNew_pw()));
		
		return mapper.changePwProc(dto);
	}

	// 이름 변경
	public int changeNm(UserDTO dto) {
		
		UserDomain vo = mapper.selUserId(dto);

		if (dto.getUser_name().equals("")) {
			return 2;
		}
		
		if(vo.getUser_name().equals(dto.getUser_name())) {
			return 3;
		}

		return mapper.changeNm(dto);
	}

	// 비밀번호 변경
	public int changePw(UserDTO dto) {

		UserDomain vo = mapper.selUserId(dto);

		if (dto.getPw().equals("")) {
			return 2;
		}
		if (dto.getNew_pw().equals("")) {
			return 3;
		}
		if (dto.getNew_chkPw().equals("")) {
			return 4;
		}
		
		if (!bcrypt.matches(dto.getPw(), vo.getPw())) {
			return 5;
		}

		if (!dto.getNew_pw().equals(dto.getNew_chkPw())) {
			return 6;
		}
		
		dto.setPw(bcrypt.encode(dto.getPw()));
		
		return mapper.changePw(dto);
	}
	
	// 별명 변경
	public int changeNick(UserDTO dto) {
		
		UserDomain vo = mapper.selUser(dto);
		
		if(dto.getNick().equals("")) {
			return 2;
		}
		if(vo != null) {
			return 3;
		}
		
		return mapper.changeNick(dto);
	}

}
