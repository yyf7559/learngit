package service.replay;

import dao.replay.ReplayMapper;
import entity.Replay;
import org.springframework.stereotype.Service;
import service.invitation.InvitationSevice;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReplayServiceImpl implements ReplayService {
    @Resource
    private ReplayMapper replayMapper;

    @Override
    public List<Replay> find(Integer invid, Integer curPage, Integer pageSize) {
        return replayMapper.all(invid, curPage, pageSize);
    }

    @Override
    public int totalCount(Integer invid) {
        return replayMapper.totalCount(invid);
    }

    @Override
    public int del(Integer invid) {
        return replayMapper.del(invid);
    }

    @Override
    public int add(Replay r) {
        return replayMapper.add(r);
    }
}
