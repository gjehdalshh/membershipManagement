package spring.membership.com.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.UserDTO;

@Service
public class MainService {
	
	@Autowired
	private MainMapper mapper;
	
	public List<UserDomain> searchUserList(UserDTO dto) {
		
		return mapper.searchUserList(dto);
	}

}
