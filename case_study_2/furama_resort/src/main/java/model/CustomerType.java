package model;

public class CustomerType {
    private int id;
    private String customerType;

    public CustomerType(int id, String customerType) {
        this.id = id;
        this.customerType = customerType;
    }

    public CustomerType() {
    }

    public CustomerType(int id) {
        this.id = id;
    }
}
