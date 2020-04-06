package ca.ubc.cs304.model;

public class AccountModel {
    private String username;
    private String password;
    private int AID;
    private String status;
    private String accountType;

    public AccountModel(String username, String password, int AID, String status, String accountType) {
        this.username = username;
        this.password = password;
        this.AID = AID;
        this.status = status;
        this.accountType = accountType;
    }



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAID() {
        return AID;
    }

    public void setAID(int AID) {
        this.AID = AID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }
}
