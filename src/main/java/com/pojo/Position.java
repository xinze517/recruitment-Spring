package com.pojo;

public class Position {

    private int position_id;
    private int ent_id;
    private String name;
    private String status;
    private String description;
    private String requirements;
    private String address;
    private int wage;

    public Position(int position_id, int ent_id, String name,
                    String status, String description,
                    String requirements, String address, int wage) {
        this.position_id = position_id;
        this.ent_id = ent_id;
        this.name = name;
        this.status = status;
        this.description = description;
        this.requirements = requirements;
        this.address = address;
        this.wage = wage;
    }

    public Position() {
    }

    @Override
    public String toString() {
        return "position{" +
                "position_id=" + position_id +
                ", ent_id=" + ent_id +
                ", name='" + name + '\'' +
                ", status='" + status + '\'' +
                ", description='" + description + '\'' +
                ", requirements='" + requirements + '\'' +
                ", address='" + address + '\'' +
                ", wage=" + wage +
                '}';
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
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

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getWage() {
        return wage;
    }

    public void setWage(int wage) {
        this.wage = wage;
    }
}

