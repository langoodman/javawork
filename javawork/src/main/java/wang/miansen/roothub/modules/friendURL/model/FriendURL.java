/**
 * @TitleFriendURL.java
 * @Packagewang.miansen.roothub.modules.friendURL.model
 * @DescripsionTODO
 * @Author22848
 * @Date2020年1月15日
 */
package wang.miansen.roothub.modules.friendURL.model;

/**
 * @ClassName:FriendURL
 * @Description:TODO
 * @Author:wtc
 * @Date2020年1月15日
 */
public class FriendURL {
    /*
     * @Field: 主键
     * */
	private Integer id;
	
	/*
	 * @Field:URL
	 * */
	private String url;
	
	/*
	 * @Field:权重
	 * */
	private Integer weight;
	
	/*
	 * @Field:URL的名字
	 * */
    private String URLName;

	/**
	 * @return: id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param :id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return: url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param :url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return: weight
	 */
	public Integer getWeight() {
		return weight;
	}

	/**
	 * @param :weight the weight to set
	 */
	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	/**
	 * @return: uRLName
	 */
	public String getURLName() {
		return URLName;
	}

	/**
	 * @param :uRLName the uRLName to set
	 */
	public void setURLName(String uRLName) {
		URLName = uRLName;
	}
    
   
    
    
}
