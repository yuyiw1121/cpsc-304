package ca.ubc.cs304.model;

import java.sql.Date;

public class TransactionRecordModel {
    private int TID;
    private Date date;

    public TransactionRecordModel(int TID, Date date) {
        this.TID = TID;
        this.date = date;
    }

    public int getTID() {
        return TID;
    }

    public void setTID(int TID) {
        this.TID = TID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
