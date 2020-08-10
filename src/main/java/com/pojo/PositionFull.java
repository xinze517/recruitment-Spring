package com.pojo;

/**
 * 完整的岗位信息展示，用于用户首页
 */
public class PositionFull {
    private int positionId;
    private String positionName;
    private String entName;
    private String positionStatus;
    private String applyStatus;
    private String complaintStatus;
    private String description;
    private String address;
    private int wage;

    public PositionFull() {
    }

    public PositionFull(int positionId, String positionName, String entName,
                        String positionStatus, String applyStatus,
                        String complaintStatus, String description,
                        String address, int wage) {
        this.positionId = positionId;
        this.positionName = positionName;
        this.entName = entName;
        this.positionStatus = positionStatus;
        this.applyStatus = applyStatus;
        this.complaintStatus = complaintStatus;
        this.description = description;
        this.address = address;
        this.wage = wage;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getEntName() {
        return entName;
    }

    public void setEntName(String entName) {
        this.entName = entName;
    }

    public String getPositionStatus() {
        return positionStatus;
    }

    public void setPositionStatus(String positionStatus) {
        this.positionStatus = positionStatus;
    }

    public String getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(String applyStatus) {
        this.applyStatus = applyStatus;
    }

    public String getComplaintStatus() {
        return complaintStatus;
    }

    public void setComplaintStatus(String complaintStatus) {
        this.complaintStatus = complaintStatus;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
