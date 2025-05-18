package model;

public class Doctor {
    private int id;
    private String name;
    private int specializationId;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getSpecializationId() {
        return specializationId;
    }
    public void setSpecializationId(int specializationId) {
        this.specializationId = specializationId;
    }
}
