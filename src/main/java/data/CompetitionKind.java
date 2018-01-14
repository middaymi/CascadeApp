package data;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CompetitionKind {
    private int id;
    private String fullName;
    private String tableName;
    private String description;

    @Override
    public String toString() {
        return fullName;
    }
}
