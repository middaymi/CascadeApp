package dataBase;
import lombok.experimental.UtilityClass;


@UtilityClass
public class SqlQuery {

                                                //TEST_COM_MODEL TABLE//
    //get all data by competition
    public String getCompetitionDataFromDB() {
        return "SELECT COMPETITION_KIND.FullName as FullNameKind, COMPETITION.* " +
                "FROM COMPETITION, COMPETITION_KIND " +
                "WHERE COMPETITION.IDcompetitionKind = COMPETITION_KIND.ID;";
    }

    //update fields in db after edit table cell
    public String updateFieldFullNameKind(int IDcompetitionKind, int IDcompetition) {
        return String.format("UPDATE COMPETITION SET IDcompetitionKind = %d " +
                             "WHERE ID = %d;", IDcompetitionKind, IDcompetition);
    }

    public String updateField(String columnName, Object columnValue, int IDcompetition) {
        return String.format("UPDATE COMPETITION SET %s = '%s' WHERE ID = %d;", columnName, columnValue, IDcompetition);
    }
                                                //- - -//


    //SFP * * * * * * * * * * * * * * * * * * * * * SFP * * * * * * * * * * * * * * * * * * * * * * * SFP * * * * * * *

                                                //COMBOBOX//

    //in combobox set elements, athletes, judges by number of sfp-competition
    public String setComboboxElements(int IDCompetition) {
        return String.format("SELECT SFP_ELEMENT.* FROM SFP_ELEMENT WHERE NOT SFP_ELEMENT.ID = ANY (" +
                                    "SELECT TESTS_ELEMENTS_LINK.IDelement " +
                                    "FROM TESTS_ELEMENTS_LINK " +
                                    "WHERE TESTS_ELEMENTS_LINK.IDcompetition = %d);", IDCompetition);
    }

    public String setComboboxAthletes() {
        return String.format("");
    }

    public String setComboboxJudges() {
        return String.format("");
    }
                                                //- - -//


    //in selection-list set elements, athletes, judges by number of sfp-competition
    public String setListElements(int IDCompetition) {
        return String.format("SELECT DISTINCT SFP_ELEMENT. * " +
                "FROM SFP_ELEMENT, TESTS_ELEMENTS_LINK " +
                "WHERE TESTS_ELEMENTS_LINK.IDelement = SFP_ELEMENT.ID " +
                "AND TESTS_ELEMENTS_LINK.IDcompetition =  %d", IDCompetition);
    }

    public String setListAthletes() {
        return String.format("");
    }

    public String setListJudges() {
        return String.format("");
    }



    //add element, athlete or judge chosen from combobox to list (to db, too)
    public String addElement(int IDCompetition, int IDElement) {
        return String.format("INSERT INTO TESTS_ELEMENTS_LINK VALUES (%d, %d)", IDCompetition, IDElement);
    }

    public String addAthlete() {
        return String.format("");
    }
    public  String addJudge() {
        return String.format("");
    }


}
