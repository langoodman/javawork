package wang.miansen.roothub.modules.mail.model;


public class MailRetrieve {
    private long id;
    private String account;
	private String sid;
    private long outTime;

    /**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the account
	 */
	public String getAccount() {
		return account;
	}

	/**
	 * @param account the account to set
	 */
	public void setAccount(String account) {
		this.account = account;
	}

	/**
	 * @return the sid
	 */
	public String getSid() {
		return sid;
	}

	/**
	 * @param sid the sid to set
	 */
	public void setSid(String sid) {
		this.sid = sid;
	}

	/**
	 * @return the outTime
	 */
	public long getOutTime() {
		return outTime;
	}

	/**
	 * @param outTime the outTime to set
	 */
	public void setOutTime(long outTime) {
		this.outTime = outTime;
	}


    public MailRetrieve(){;}

    public MailRetrieve(String account, String sid, long outTime) {
        this.account = account;
        this.sid = sid;
        this.outTime = outTime;
    }

}
