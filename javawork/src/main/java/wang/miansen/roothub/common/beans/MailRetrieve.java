package wang.miansen.roothub.common.beans;

import lombok.Data;


@Data
public class MailRetrieve {
    private long id;

    private String account;

    private String sid;

    private long outTime;
    public MailRetrieve(){;}

    public MailRetrieve(String account, String sid, long outTime) {
        this.account = account;
        this.sid = sid;
        this.outTime = outTime;
    }

}
