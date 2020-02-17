package dao.users;

import entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface UserMapper {
    Users login(@Param("userName") String userName, @Param("password") String password);

    int updateDate(@Param("user_id") Integer user_id, @Param("last_logintime") Date last_logintime);
}
