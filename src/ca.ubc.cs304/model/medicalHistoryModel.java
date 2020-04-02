package ca.ubc.cs304.model;

public class medicalHistoryModel {
    private int MDID;
    private String status;
    private String description;

    public medicalHistoryModel(int MDID, String status, String description) {
        this.MDID = MDID;
        this.status = status;
        this.description = description;
    }

    public int getMDID() {
        return MDID;
    }

    public void setMDID(int MDID) {
        this.MDID = MDID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
