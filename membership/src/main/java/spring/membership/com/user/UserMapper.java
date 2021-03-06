package spring.membership.com.user;

import org.apache.ibatis.annotations.Mapper;

import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.UserDTO;

@Mapper
public interface UserMapper {
	int intUser(UserDTO dto);
	UserDomain selUser(UserDTO dto);
}
