package spring.membership.com.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.membership.com.domain.UserDomain;
import spring.membership.com.dto.UserDTO;

@Mapper
public interface MainMapper {
	List<UserDomain> searchUserList(UserDTO dto);
}
