package wang.miansen.roothub.modules.qmxGroup.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wang.miansen.roothub.modules.qmxGroup.dao.qmxGroupDao;
import wang.miansen.roothub.modules.qmxGroup.model.QmxGroup;
import wang.miansen.roothub.modules.qmxGroup.service.qmxGroupService;

@Service
public class qmxGroupServiceImpl implements qmxGroupService{
	
	@Autowired
	qmxGroupDao qmxgroupdao;
	
	@Override
	public QmxGroup findById(Integer groupId) {
		QmxGroup group = qmxgroupdao.selectById(groupId);
		return group;
	}

	@Override
	public List<QmxGroup> findAll() {
		return qmxgroupdao.selectAll();
	}
	
}