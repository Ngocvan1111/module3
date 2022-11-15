package model;

public class Room {
    private int roomId;
    private String name;
    private String phoneNumber;
    private String startDay;
    private int typePayId;
    private String note;
    private TypePay typePay;

    public Room() {
    }

    public Room(int roomId, String name, String phoneNumber, String startDay, int typePayId, String note, TypePay typePay) {
        this.roomId = roomId;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.startDay = startDay;
        this.typePayId = typePayId;
        this.note = note;
        this.typePay = typePay;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getStartDay() {
        return startDay;
    }

    public void setStartDay(String startDay) {
        this.startDay = startDay;
    }

    public int getTypePayId() {
        return typePayId;
    }

    public void setTypePayId(int typePayId) {
        this.typePayId = typePayId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public TypePay getTypePay() {
        return typePay;
    }

    public void setTypePay(TypePay typePay) {
        this.typePay = typePay;
    }
}
