package com.pojo;

public class EntBlackList {

    private int black_list_id;
    private int ent_id;
    private int user_id;

    public EntBlackList(int black_list_id, int ent_id, int user_id) {
        this.black_list_id = black_list_id;
        this.ent_id = ent_id;
        this.user_id = user_id;
    }

    public EntBlackList() {
    }

    @Override
    public String toString() {
        return "EntBlackList{" +
                "black_list_id=" + black_list_id +
                ", ent_id=" + ent_id +
                ", user_id=" + user_id +
                '}';
    }

    public int getBlack_list_id() {
        return black_list_id;
    }

    public void setBlack_list_id(int black_list_id) {
        this.black_list_id = black_list_id;
    }

    public int getEnt_id() {
        return ent_id;
    }

    public void setEnt_id(int ent_id) {
        this.ent_id = ent_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}
