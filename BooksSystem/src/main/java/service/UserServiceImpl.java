package service;

import dao.users.UserMapper;
import entity.Users;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public Users login(String userCode, String password) {
        return userMapper.login(userCode, password);
    }

    @Override
    public int updateDate(Integer user_id) {
        return userMapper.updateDate(user_id, new Date());
    }
}
