package com.pojo;

/**
 * 用户账户
 */
public class UserAccount {
    private int user_id;
    private String account;
    private String password;
    private boolean access_basic_information;
    private boolean access_resume;
    private boolean access_apply;
    private boolean access_apply_record;
    private boolean access_complaint;
    private boolean access_edit_password;


    public boolean isAccess_apply_record() {
        return access_apply_record;
    }

    public void setAccess_apply_record(boolean access_apply_record) {
        this.access_apply_record = access_apply_record;
    }

    public UserAccount(int user_id, String account, String password,
                       boolean access_basic_information, boolean access_resume,
                       boolean access_apply, boolean access_apply_record,
                       boolean access_complaint, boolean access_edit_password) {
        this.user_id = user_id;
        this.account = account;
        this.password = password;
        this.access_basic_information = access_basic_information;
        this.access_resume = access_resume;
        this.access_apply = access_apply;
        this.access_apply_record = access_apply_record;
        this.access_complaint = access_complaint;
        this.access_edit_password = access_edit_password;
    }

    public UserAccount() {
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public boolean isAccess_basic_information() {
        return access_basic_information;
    }

    public void setAccess_basic_information(boolean access_basic_information) {
        this.access_basic_information = access_basic_information;
    }

    public boolean isAccess_resume() {
        return access_resume;
    }

    public void setAccess_resume(boolean access_resume) {
        this.access_resume = access_resume;
    }

    public boolean isAccess_apply() {
        return access_apply;
    }

    public void setAccess_apply(boolean access_apply) {
        this.access_apply = access_apply;
    }

    public boolean isAccess_complaint() {
        return access_complaint;
    }

    public void setAccess_complaint(boolean access_complaint) {
        this.access_complaint = access_complaint;
    }

    public boolean isAccess_edit_password() {
        return access_edit_password;
    }

    public void setAccess_edit_password(boolean access_edit_password) {
        this.access_edit_password = access_edit_password;
    }

    @Override
    public String toString() {
        return "UserAccount{" +
                "user_id=" + user_id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", access_basic_information=" + access_basic_information +
                ", access_resume=" + access_resume +
                ", access_apply=" + access_apply +
                ", access_apply_record=" + access_apply_record +
                ", access_complaint=" + access_complaint +
                ", access_edit_password=" + access_edit_password +
                '}';
    }
}
