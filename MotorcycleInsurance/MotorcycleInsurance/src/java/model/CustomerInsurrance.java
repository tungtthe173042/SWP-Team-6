package model;

import java.util.Date;

public class CustomerInsurrance {
    private int CIsuranceID;
    private int UserID;
    private String InsuranceName;
    private Date StartDate;
    private Date EndDate;
    private String OwnerName;
    private String LicensePlates;
    private String EngineNumber;
    private String ChassisNumber;

    public int getCIsuranceID() {
        return CIsuranceID;
    }

    public void setCIsuranceID(int CIsuranceID) {
        this.CIsuranceID = CIsuranceID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getInsuranceName() {
        return InsuranceName;
    }

    public void setInsuranceName(String insuranceName) {
        InsuranceName = insuranceName;
    }

    public Date getStartDate() {
        return StartDate;
    }

    public void setStartDate(Date startDate) {
        StartDate = startDate;
    }

    public Date getEndDate() {
        return EndDate;
    }

    public void setEndDate(Date endDate) {
        EndDate = endDate;
    }

    public String getOwnerName() {
        return OwnerName;
    }

    public void setOwnerName(String ownerName) {
        OwnerName = ownerName;
    }

    public String getLicensePlates() {
        return LicensePlates;
    }

    public void setLicensePlates(String licensePlates) {
        LicensePlates = licensePlates;
    }

    public String getEngineNumber() {
        return EngineNumber;
    }

    public void setEngineNumber(String engineNumber) {
        EngineNumber = engineNumber;
    }

    public String getChassisNumber() {
        return ChassisNumber;
    }

    public void setChassisNumber(String chassisNumber) {
        ChassisNumber = chassisNumber;
    }
}
