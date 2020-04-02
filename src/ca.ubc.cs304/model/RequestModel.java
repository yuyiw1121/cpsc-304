package ca.ubc.cs304.model;

import java.sql.Date;

public class RequestModel {
    private int RID;
    private String bloodType;
    private int bloodAmount;
    private Date time;
    private String description;

    public RequestModel(int RID, String bloodType, int bloodAmount, Date time, String description) {
        this.RID = RID;
        this.bloodType = bloodType;
        this.bloodAmount = bloodAmount;
        this.time = time;
        this.description = description;
    }

    public int getRID() {
        return RID;
    }

    public void setRID(int RID) {
        this.RID = RID;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public int getBloodAmount() {
        return bloodAmount;
    }

    public void setBloodAmount(int bloodAmount) {
        this.bloodAmount = bloodAmount;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
