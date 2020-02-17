package service;

import entity.Audit;

import java.util.List;

public interface ProjectService {
    List<Audit> all(Integer status, Integer curPage, Integer pageSize);

    int totalCount(Integer status);

    int updateStatus(Integer status, Integer id);

    Audit selectById(Integer id);
}
