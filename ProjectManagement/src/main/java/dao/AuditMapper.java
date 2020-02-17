package dao;

import entity.Audit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuditMapper {
    List<Audit> all(@Param("status") Integer status, @Param("curPage") Integer curPage,
                    @Param("pageSize") Integer pageSize);

    int totalCount(@Param("status") Integer status);

    int updateStatus(@Param("status") Integer status, @Param("id") Integer id);

    Audit selectById(Integer id);
}
