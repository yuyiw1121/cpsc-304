package ca.ubc.cs304.model;

public class UserModel {
    private int age;
    private String name;
    private int healthCardId;
    private String gender;
    private String bloodType;
    private ContactModel contact;

    public UserModel(int age, String name, int healthCardId, String gender, String bloodType, ContactModel contact) {
        this.age = age;
        this.name = name;
        this.healthCardId = healthCardId;
        this.gender = gender;
        this.bloodType = bloodType;
        this.contact = contact;
    }

    public UserModel(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getHealthCardId() {
        return healthCardId;
    }

    public void setHealthCardId(int healthCardId) {
        this.healthCardId = healthCardId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public ContactModel getContact() {
        return contact;
    }

    public void setContact(ContactModel contact) {
        this.contact = contact;
    }
}
