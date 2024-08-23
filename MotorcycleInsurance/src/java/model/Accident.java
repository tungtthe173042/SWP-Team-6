package model;

import java.sql.Date;

public class Accident {
    private int accidentID;
    private String image;
    private String accidentDescription;
    private Date accidentDate;
    private Date accidentName; 
    private Integer cIsuranceID;

    // Constructor
    public Accident() {
    }

    // Getters and Setters
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

    public Date getAccidentName() {
        return accidentName;
    }

    public void setAccidentName(Date accidentName) {
        this.accidentName = accidentName;
    }

    public Integer getCIsuranceID() {
        return cIsuranceID;
    }

    public void setCIsuranceID(Integer cIsuranceID) {
        this.cIsuranceID = cIsuranceID;
    }

    @Override
    public String toString() {
        return "Accident{" +
                "accidentID=" + accidentID +
                ", image='" + image + '\'' +
                ", accidentDescription='" + accidentDescription + '\'' +
                ", accidentDate=" + accidentDate +
                ", accidentName=" + accidentName +
                ", cIsuranceID=" + cIsuranceID +
                '}';
    }
}