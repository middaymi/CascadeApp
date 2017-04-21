package data;

import java.sql.Timestamp;

public class Competition {
    private int id;
    private CompetitionKind kind;
    private String fullName;
    private boolean type;
    private Timestamp dateTime;
    private String address;
    private String description;

    public int getId() {
        return id;
    }

    public CompetitionKind getKind() {
        return kind;
    }

    public String getFullName() {
        return fullName;
    }

    public boolean isType() {
        return type;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public String getAddress() {
        return address;
    }

    public String getDescription() {
        return description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setKind(CompetitionKind kind) {
        this.kind = kind;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
