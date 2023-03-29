package model;

public class CustomerType {
    private int id;
    private String customerTypeName;

    public CustomerType() {
    }

    public CustomerType(int id, String CustomerTypeName) {
        this.id = id;
        this.customerTypeName = CustomerTypeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerTypeName() {
        return customerTypeName;
    }

    public void setCustomerTypeName(String CustomerTypeName) {
        this.customerTypeName = CustomerTypeName;
    }

    @Override
    public String toString() {
        return "CustomerType{" +
                "id=" + id +
                ", customerTypeName='" + customerTypeName + '\'' +
                '}';
    }
}
