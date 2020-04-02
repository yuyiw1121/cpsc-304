package ca.ubc.cs304.model;

public class EmployeeModel {
    private int EID;
    private String name;
    private String email;
    private String username;
    private String password;

    public EmployeeModel(int EID, String name, String email, String username, String password) {
        this.EID = EID;
        this.name = name;
        this.email = email;
        this.username = username;
        this.password = password;
    }

    public int getEID() {
        return EID;
    }

    public void setEID(int EID) {
        this.EID = EID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}
