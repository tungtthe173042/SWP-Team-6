package model;

import java.sql.Date;

public class Accident {
    private int accidentID;
    private String image;
    private String accidentDescription;
    private Date accidentDate;
    private String accidentName;
    private Integer cIsuranceID;
    private Boolean status;

    public Accident() {
    }

    public Accident(int accidentID, String image, String accidentDescription, Date accidentDate, String accidentName, Integer cIsuranceID, Boolean status) {
        this.accidentID = accidentID;
        this.image = image;
        this.accidentDescription = accidentDescription;
        this.accidentDate = accidentDate;
        this.accidentName = accidentName;
        this.cIsuranceID = cIsuranceID;
        this.status = status;
    }

    // Getters và Setters
    public int getAccidentID() {
        return accidentID;
    }

    public void setAccidentID(int accidentID) {
        this.accidentID = accidentID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAccidentDescription() {
        return accidentDescription;
    }

    public void setAccidentDescription(String accidentDescription) {
        this.accidentDescription = accidentDescription;
    }

    public Date getAccidentDate() {
        return accidentDate;
    }

    public void setAccidentDate(Date accidentDate) {
        this.accidentDate = accidentDate;
    }

    public String getAccidentName() {
        return accidentName;
    }

    public void setAccidentName(String accidentName) {
        this.accidentName = accidentName;
    }

    public Integer getCIsuranceID() {
        return cIsuranceID;
    }

    public void setCIsuranceID(Integer cIsuranceID) {
        this.cIsuranceID = cIsuranceID;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    // Phương thức toString() để in thông tin của đối tượng
    @Override
    public String toString() {
        return "Accident{" +
                "accidentID=" + accidentID +
                ", image='" + image + '\'' +
                ", accidentDescription='" + accidentDescription + '\'' +
                ", accidentDate=" + accidentDate +
                ", accidentName='" + accidentName + '\'' +
                ", cIsuranceID=" + cIsuranceID +
                ", status=" + status +
                '}';
    }
}