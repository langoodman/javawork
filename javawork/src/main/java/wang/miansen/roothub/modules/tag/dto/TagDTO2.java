package wang.miansen.roothub.modules.tag.dto;

import wang.miansen.roothub.common.dto.BaseDTO;

/**
* @author lan_wh
*
* @Description TODO
*
* @Title: TagDTO2.java 
*
* @date 创建时间：2020年1月15日 下午4:55:17
*
* @Package wang.miansen.roothub.modules.tag.dto
*
* @ClassName TagDTO2
*
* @version 1.0.0
*
*/

public class TagDTO2 implements BaseDTO{
	/**
	 * 数量
	 */
	private Integer number;
	/**
	 * 名字
	 */
	private String tag;
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "TagDTO2 [number=" + number + ", tag=" + tag + "]";
	}
	

}
