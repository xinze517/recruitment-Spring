package com.pojo;

public class UserResume {
    private int user_id;
    private String self_evaluation;
    private String home_page;
    private String except_position;
    private int except_wage;
    private String except_city;
    private String work_experience;
    private String project_experience;

    public UserResume(int user_id, String self_evaluation, String home_page,
                      String except_position, int except_wage,
                      String except_city, String work_experience,
                      String project_experience) {
        this.user_id = user_id;
        this.self_evaluation = self_evaluation;
        this.home_page = home_page;
        this.except_position = except_position;
        this.except_wage = except_wage;
        this.except_city = except_city;
        this.work_experience = work_experience;
        this.project_experience = project_experience;
    }

    public UserResume() {
    }

    @Override
    public String toString() {
        return "UserResume{" +
                "user_id=" + user_id +
                ", self_evaluation='" + self_evaluation + '\'' +
                ", home_page='" + home_page + '\'' +
                ", except_position='" + except_position + '\'' +
                ", except_wage=" + except_wage +
                ", except_city='" + except_city + '\'' +
                ", work_experience='" + work_experience + '\'' +
                ", project_experience='" + project_experience + '\'' +
                '}';
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getSelf_evaluation() {
        return self_evaluation;
    }

    public void setSelf_evaluation(String self_evaluation) {
        this.self_evaluation = self_evaluation;
    }

    public String getHome_page() {
        return home_page;
    }

    public void setHome_page(String home_page) {
        this.home_page = home_page;
    }

    public String getExcept_position() {
        return except_position;
    }

    public void setExcept_position(String except_position) {
        this.except_position = except_position;
    }

    public int getExcept_wage() {
        return except_wage;
    }

    public void setExcept_wage(int except_wage) {
        this.except_wage = except_wage;
    }

    public String getExcept_city() {
        return except_city;
    }

    public void setExcept_city(String except_city) {
        this.except_city = except_city;
    }

    public String getWork_experience() {
        return work_experience;
    }

    public void setWork_experience(String work_experience) {
        this.work_experience = work_experience;
    }

    public String getProject_experience() {
        return project_experience;
    }

    public void setProject_experience(String project_experience) {
        this.project_experience = project_experience;
    }
}
