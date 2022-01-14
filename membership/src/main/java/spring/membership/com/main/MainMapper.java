package spring.membership.com.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.membership.com.domain.RelationDomain;
import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.RelationDTO;
import spring.membership.com.dto.UserDTO;

@Mapper
public interface MainMapper {
	UserDomain selNameUser(UserDTO dto);
	UserDomain selIdUser(UserDTO dto);
int insFriendFrom(RelationDTO dto);
	int insFriendTo(RelationDTO dto);
	RelationDTO selRelationUser(RelationDTO dto);
	
	List<RelationDomain> selFriendList(RelationDTO dto);
	List<RelationDomain> searchUserList(RelationDTO dto);
	
	RelationDomain selFriendCount(RelationDTO dto);
	RelationDomain searchUserCount(RelationDTO dto);
	

	int delFriendFrom(RelationDTO dto);
	int delFriendTo(RelationDTO dto);
	
	
	List<UserDomain> selUserTest(UserDTO dto);
}
