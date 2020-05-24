package wang.miansen.roothub.modules.qmxGroup.service;
import java.util.List;

import wang.miansen.roothub.modules.qmxGroup.model.QmxGroup;
import wang.miansen.roothub.modules.user.model.User;

public interface qmxGroupService{
	QmxGroup findById(Integer groupId);
	
	List<QmxGroup> findAll();
	
}