package data;

import lombok.Data;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.text.DateFormatter;

@Data
public class Competition {
    private int id;
    private Integer rankId;
    private CompetitionKind kind;
    private String fullName;
    private boolean type;
    private Timestamp dateTime;
    private String address;
    private String description;
    private boolean finished;
    
    public Competition() {
        dateTime = new Timestamp((new Date()).getTime());
    }

    public String getDate() {
        SimpleDateFormat df = new SimpleDateFormat("dd.MM.yyyy");
        df.format(this.getDateTime());
        return df.format(this.getDateTime());
    }
}
