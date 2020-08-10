package com.pojo;

import java.util.Date;

public class EntInfo {

    private int ent_id;
    private String name;
    private String legal_representative;    //法人代表
    private Date established_date;          //成立日期
    private String email;
    private String introduction;
    private String home_page;

    public EntInfo(int ent_id, String name, String legal_representative,
                   Date established_date, String email, String introduction, String home_page) {
        this.ent_id = ent_id;
        this.name = name;
        this.legal_representative = legal_representative;
        this.established_date = established_date;
        this.email = email;
        this.introduction = introduction;
        this.home_page = home_page;
    }

    public EntInfo() {
    }

    @Override
    public String toString() {
        return "EntInfo{" +
                "ent_id=" + ent_id +
                ", name='" + name + '\'' +
                ", legal_representative='" + legal_representative + '\'' +
                ", established_date=" + established_date +
                ", email='" + email + '\'' +
                ", introduction='" + introduction + '\'' +
                ", home_page='" + home_page + '\'' +
                '}';
    }

    public int getEnt_id() {
        return ent_id;
    }

    public void setEnt_id(int ent_id) {
        this.ent_id = ent_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLegal_representative() {
        return legal_representative;
    }

    public void setLegal_representative(String legal_representative) {
        this.legal_representative = legal_representative;
    }

    public Date getEstablished_date() {
        return established_date;
    }

    public void setEstablished_date(Date established_date) {
        this.established_date = established_date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getHome_page() {
        return home_page;
    }

    public void setHome_page(String home_page) {
        this.home_page = home_page;
    }
}
