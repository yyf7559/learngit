package service;

import dao.AuditMapper;
import entity.Audit;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ProjectServiceImpl implements ProjectService {

    @Resource
    private AuditMapper auditMapper;

    @Override
    public List<Audit> all(Integer status, Integer curPage, Integer pageSize) {
        return auditMapper.all(status, curPage, pageSize);
    }

    @Override
    public int totalCount(Integer status) {
        return auditMapper.totalCount(status);
    }

    @Override
    public int updateStatus(Integer status, Integer id) {
        return auditMapper.updateStatus(status, id);
    }

    @Override
    public Audit selectById(Integer id) {
        return auditMapper.selectById(id);
    }
}
