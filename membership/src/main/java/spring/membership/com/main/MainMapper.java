package spring.membership.com.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.membership.com.domain.RelationDomain;
import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.RelationDTO;
import spring.membership.com.dto.UserDTO;

@Mapper
public interface MainMapper {
	UserDomain selUser(UserDTO dto);
	int insFriendFrom(RelationDTO dto);
	int insFriendTo(RelationDTO dto);
	
	
	List<UserDomain> searchUserList(UserDTO dto);
	RelationDomain selRelation(RelationDTO dto);

	List<RelationDomain> selFriendList(RelationDTO dto);
	int delFriendFrom(RelationDTO dto);
	int delFriendTo(RelationDTO dto);
}
