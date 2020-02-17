package service.invitation;

import dao.invitation.InvitationMapper;
import entity.Invitation;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.replay.ReplayService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class InvitationSeviceImpl implements InvitationSevice {
    @Resource
    private InvitationMapper invitationMapper;
    @Resource
    private ReplayService replayService;

    @Override
    public List<Invitation> find(String title, Integer curPage, Integer pageSize) {
        return invitationMapper.all(title, curPage, pageSize);
    }

    @Override
    public int totalCount(String title) {
        return invitationMapper.totalCount(title);
    }

    @Transactional
    @Override
    public int del(Integer id) {
        replayService.del(id);
        return invitationMapper.del(id);
    }
}
