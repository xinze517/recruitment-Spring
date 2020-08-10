package com.pojo;

public class RecordApply {

    private int record_id;
    private int user_id;
    private int ent_id;
    private int position_id;
    private String status;

    public RecordApply(int record_id, int user_id, int ent_id, int position_id, String status) {
        this.record_id = record_id;
        this.user_id = user_id;
        this.ent_id = ent_id;
        this.position_id = position_id;
        this.status = status;
    }

    public RecordApply() {
    }

    @Override
    public String toString() {
        return "RecordApply{" +
                "record_id=" + record_id +
                ", user_id=" + user_id +
                ", ent_id=" + ent_id +
                ", position_id=" + position_id +
                ", status='" + status + '\'' +
                '}';
    }

    public int getRecord_id() {
        return record_id;
    }

    public void setRecord_id(int record_id) {
        this.record_id = record_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getEnt_id() {
        return ent_id;
    }

    public void setEnt_id(int ent_id) {
        this.ent_id = ent_id;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}