package spring.membership.com.main;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	@Autowired
	private HttpSession hs;

	// 세션 아이디 값 불러오기
	public int getSesstionIuser() {
		UserDomain vo = (UserDomain) hs.getAttribute("id");

		return vo.getI_user();
	}

	// 이름으로 친구 추가
	public int insNameFriend(UserDTO dto) {

		UserDomain vo = mapper.selNameUser(dto);

		if (vo == null) {
			return 2;
		}

		RelationDTO relVo = new RelationDTO();
		relVo.setI_userFrom(dto.getI_user());
		relVo.setI_userTo(vo.getI_user());

		RelationDTO checkVo = mapper.selRelationUser(relVo);

		if (checkVo != null) {
			return 3;
		}

		mapper.insFriendFrom(relVo);
		mapper.insFriendTo(relVo);

		return 1;
	}

	// 아이디로 친구 추가
	public int insIdFriend(UserDTO dto) {

		UserDomain vo = mapper.selIdUser(dto);

		if (vo == null) {
			return 2;
		}

		RelationDTO relVo = new RelationDTO();
		relVo.setI_userFrom(dto.getI_user());
		relVo.setI_userTo(vo.getI_user());

		RelationDTO checkVo = mapper.selRelationUser(relVo);

		if (checkVo != null) {
			return 3;
		}

		mapper.insFriendFrom(relVo);
		mapper.insFriendTo(relVo);

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

		dto.setI_userFrom(getSesstionIuser());

		return mapper.selFriendList(dto);
	}

	// 친구 수
	public RelationDomain selFriendCount(RelationDTO dto) {

		dto.setI_userFrom(getSesstionIuser());

		return mapper.selFriendCount(dto);
	}

	// 친구 검색
	public List<RelationDomain> searchUserList(RelationDTO dto) {

		if (dto.getUser_name() == null) {
			return null;
		}

		dto.setI_userFrom(getSesstionIuser());
		
		return mapper.searchUserList(dto);
	}

	// 검색 친구 수
	public RelationDomain searchUserCount(RelationDTO dto) {
		
		if (dto.getUser_name() == null) {
			return null;
		}
		
		dto.setI_userFrom(getSesstionIuser());
		
		return mapper.searchUserCount(dto);
	}
}
