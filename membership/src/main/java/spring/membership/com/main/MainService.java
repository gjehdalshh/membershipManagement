package spring.membership.com.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.membership.com.domain.RelationDomain;
import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.RelationDTO;
import spring.membership.com.dto.UserDTO;

@Service
public class MainService {
	
	@Autowired
	private MainMapper mapper;
	
	// 친구 검색
	public List<UserDomain> searchUserList(UserDTO dto) {
		return mapper.searchUserList(dto);
	}
	
	// 친구 추가
	public int insFriend(RelationDTO dto) {
		RelationDomain vo = mapper.selRelation(dto);
		
		if(vo != null) {
			return 2;
		}
	
		mapper.insFriendFrom(dto);
		mapper.insFriendTo(dto);
	
		return 1;
	}
	
	// 친구 삭제
	public int delFriend(RelationDTO dto) {
		
		mapper.delFriendFrom(dto);
		mapper.delFriendTo(dto);
		
		return 1;
	}
	
	// 친구 뿌리기
	public List<RelationDomain> selFriendList(RelationDTO dto) {
		return mapper.selFriendList(dto);
	}

}
