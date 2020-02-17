package service;

import entity.Users;

public interface UserService {
    Users login(String userCode, String password);

    int updateDate(Integer user_id);
}
