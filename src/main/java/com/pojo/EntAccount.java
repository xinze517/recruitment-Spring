package com.pojo;

public class EntAccount {
    private int ent_id;
    private String account;
    private String password;
    private String status;

    public EntAccount(int ent_id, String account, String password, String status) {
        this.ent_id = ent_id;
        this.account = account;
        this.password = password;
        this.status = status;
    }

    public EntAccount() {
    }

    public int getEnt_id() {
        return ent_id;
    }

    public void setEnt_id(int ent_id) {
        this.ent_id = ent_id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ent_account{" +
                "ent_id=" + ent_id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                '}';
    }
}
