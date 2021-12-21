package spring.membership.com.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.UserDTO;

@Mapper
public interface UserMapper {
	int intUser(UserDTO dto);
	UserDomain selUser(UserDTO dto);
	UserDomain selUserId(UserDTO dto);
	UserDomain findIdProc(UserDTO dto);
	UserDomain findPwProc(UserDTO dto);
	int changePwProc(UserDTO dto);
	int changeNm(UserDTO dto);
	int changePw(UserDTO dto);
	int changeNick(UserDTO dto);
}
