package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class CustomerInsurrance {

    private int CIsuranceID;
    private int UserID;
    private String InsuranceName;
    private LocalDate StartDate;
    private LocalDate EndDate;
    private String OwnerName;
    private String LicensePlates;
    private String EngineNumber;
    private String ChassisNumber;
    private String VehicleRegistrationAddress;
    private String PassengerAccident;
    private Boolean isDelete;

    // Getters and Setters
    public int getCIsuranceID() {
        return CIsuranceID;
    }

    public void setCIsuranceID(int CIsuranceID) {
        this.CIsuranceID = CIsuranceID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getInsuranceName() {
        return InsuranceName;
    }

    public void setInsuranceName(String InsuranceName) {
        this.InsuranceName = InsuranceName;
    }

    public LocalDate getStartDate() {
        return StartDate;
    }

    public void setStartDate(LocalDate StartDate) {
        this.StartDate = StartDate;
    }

    public LocalDate getEndDate() {
        return EndDate;
    }

    public void setEndDate(LocalDate EndDate) {
        this.EndDate = EndDate;
    }

    public String getOwnerName() {
        return OwnerName;
    }

    public void setOwnerName(String OwnerName) {
        this.OwnerName = OwnerName;
    }

    public String getLicensePlates() {
        return LicensePlates;
    }

    public void setLicensePlates(String LicensePlates) {
        this.LicensePlates = LicensePlates;
    }

    public String getEngineNumber() {
        return EngineNumber;
    }

    public void setEngineNumber(String EngineNumber) {
        this.EngineNumber = EngineNumber;
    }

    public String getChassisNumber() {
        return ChassisNumber;
    }

    public void setChassisNumber(String ChassisNumber) {
        this.ChassisNumber = ChassisNumber;
    }

    public String getVehicleRegistrationAddress() {
        return VehicleRegistrationAddress;
    }

    public void setVehicleRegistrationAddress(String VehicleRegistrationAddress) {
        this.VehicleRegistrationAddress = VehicleRegistrationAddress;
    }

    public String getPassengerAccident() {
        return PassengerAccident;
    }

    public void setPassengerAccident(String PassengerAccident) {
        this.PassengerAccident = PassengerAccident;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String startDateStr = (StartDate != null) ? StartDate.format(dateFormatter) : "N/A";
        String endDateStr = (EndDate != null) ? EndDate.format(dateFormatter) : "N/A";

        return String.format(
            "CustomerInsurrance Details:\n" +
            "===========================\n" +
            "Insurance ID: %d\n" +
            "User ID: %s\n" +
            "Insurance Name: %s\n" +
            "Start Date: %s\n" +
            "End Date: %s\n" +
            "Owner Name: %s\n" +
            "License Plates: %s\n" +
            "Engine Number: %s\n" +
            "Chassis Number: %s\n" +
            "Vehicle Registration Address: %s\n" +
            "Passenger Accident: %s\n" +
            "Is Delete: %s",
            CIsuranceID,
            UserID,
            (InsuranceName != null) ? InsuranceName : "N/A",
            startDateStr,
            endDateStr,
            (OwnerName != null) ? OwnerName : "N/A",
            (LicensePlates != null) ? LicensePlates : "N/A",
            (EngineNumber != null) ? EngineNumber : "N/A",
            (ChassisNumber != null) ? ChassisNumber : "N/A",
            (VehicleRegistrationAddress != null) ? VehicleRegistrationAddress : "N/A",
            (PassengerAccident != null) ? PassengerAccident : "N/A",
            (isDelete != null) ? isDelete.toString() : "N/A"
        );
    }
}
