package dataBase;

public class SqlQuery {

    //SFP * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    //in combobox set elements, athletes, judges by number of sfp-competition
    public static String setComboboxElements(int IDCompetition) {
        return String.format("SELECT SFP_ELEMENT.* FROM SFP_ELEMENT WHERE NOT SFP_ELEMENT.ID = ANY " +
                                    "(SELECT TESTS_ELEMENTS_LINK.IDisuElement " +
                                    "FROM TESTS_ELEMENTS_LINK " +
                                    "WHERE TESTS_ELEMENTS_LINK.IDcompetition = %d);", IDCompetition);
    }

    public static String setComboboxAthletes() {
        return String.format("");
    }

    public static String setComboboxJudges() {
        return String.format("");
    }



    //in selection-list set elements, athletes, judges by number of sfp-competition
    public static String setListElements(int IDCompetition) {
        return String.format("SELECT DISTINCT SFP_ELEMENT. * " +
                "FROM SFP_ELEMENT, TESTS_ELEMENTS_LINK " +
                "WHERE TESTS_ELEMENTS_LINK.IDisuElement = SFP_ELEMENT.ID " +
                "AND TESTS_ELEMENTS_LINK.IDcompetition =  %d", IDCompetition);
    }

    public static String setListAthletes() {
        return String.format("");
    }

    public static String setListJudges() {
        return String.format("");
    }



    //add element, athlete or judge chosen from combobox to list (to db, too)
    public static String addElement(int IDCompetition, int IDElement) {
        return String.format("INSERT INTO TESTS_ELEMENTS_LINK VALUES (%d, %d)", IDCompetition, IDElement);
    }

    public static String addAthlete() {
        return String.format("");
    }
    public static String addJudge() {
        return String.format("");
    }


}
