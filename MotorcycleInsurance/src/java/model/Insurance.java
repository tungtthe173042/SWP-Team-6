package model;

public class Insurance {

    private int insuranceID;
    private String insuranceName;
    private String insuranceDescription;
    private int insurancePrice;
    private int status;
    private String image;

    public Insurance() {
    }

    public Insurance(int insuranceID, String insuranceName, String insuranceDescription, int insurancePrice, int status, String image) {
        this.insuranceID = insuranceID;
        this.insuranceName = insuranceName;
        this.insuranceDescription = insuranceDescription;
        this.insurancePrice = insurancePrice;
        this.status = status;
        this.image = image;
    }

    // Thêm getter và setter cho trường image
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getInsuranceID() {
        return insuranceID;
    }

    public void setInsuranceID(int insuranceID) {
        this.insuranceID = insuranceID;
    }

    public String getInsuranceName() {
        return insuranceName;
    }

    public void setInsuranceName(String insuranceName) {
        this.insuranceName = insuranceName;
    }

    public String getInsuranceDescription() {
        return insuranceDescription;
    }

    public void setInsuranceDescription(String insuranceDescription) {
        this.insuranceDescription = insuranceDescription;
    }

    public int getInsurancePrice() {
        return insurancePrice;
    }

    public void setInsurancePrice(int insurancePrice) {
        this.insurancePrice = insurancePrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Insurance{" + "insuranceID=" + insuranceID + ", insuranceName=" + insuranceName + ", insuranceDescription=" + insuranceDescription + ", insurancePrice=" + insurancePrice + ", status=" + status + '}';
    }
}
