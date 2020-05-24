package wang.miansen.roothub.modules.qmxGroup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import wang.miansen.roothub.modules.qmxGroup.model.QmxGroup;

public interface qmxGroupDao{

	/**
	 * @param groupId
	 * @return
	 */
	QmxGroup selectById(@Param("id")Integer id);

	/**
	 * @return
	 */
	List<QmxGroup> selectAll();
	
	
}
