package net.ourams.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.UserDao;
import net.ourams.vo.PostVo;
import net.ourams.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
		
	/* interseptor를 이용해서 로그인 하는 서비스 */
	public UserVo login(String email, String password) {
		return userDao.selectAuthUser(email, password);
	}
	
	/* userno를 이용해 선택된 사용자 정보를 가져온다 */
	public UserVo read(int userNo) {
		//PostDao.updateHit(postNo);
		UserVo userVo = userDao.selecteUser(userNo);
		return userVo;
	}

	public int joinMemberByUserVo(UserVo joinUserVo) {
		return userDao.insertUsersByUserVO(joinUserVo);
	}
}
