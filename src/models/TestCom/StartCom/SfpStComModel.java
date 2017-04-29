package models.TestCom.StartCom;

import data.Athlete;
import data.Element;
import data.Judge;
import dataBase.DataBaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JLabel;
import models.TestCom.SfpEditModel;
import models.TestCom.TestComModel;
import views.CommonSettings;
import views.Manager;
import views.TestCom.StartCom.StComPage;
import data.MarkCellData;

public class SfpStComModel {
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                   getDBconnection(); 
    private StComPage sfpStComPage;        
    private TestComModel tcModel;
    
    //athlets take part in selected competition    
    private HashMap<Integer, SportsmanResult> athletesByComp = new HashMap<>();
        
    //judges take part in selected competition    
    private ArrayList<Judge> judgesByComp = new ArrayList<>();
    
    //elements of selected competition
    private HashMap<Integer, Element> elementsByComp = new HashMap<>(); 
    
    private HashMap<String, PointsTable> standards = new HashMap<>();
    
    private ArrayList<ArrayList<MarkCellData>> marksList = new ArrayList<ArrayList<MarkCellData>>();
    
    private static SfpStComModel sfpStComModelInstance = null;
    private SfpStComModel() {}    
    public static SfpStComModel getSfpEditModelInstance() {
        if (sfpStComModelInstance == null) {
            sfpStComModelInstance = new SfpStComModel();
        }
        return sfpStComModelInstance;
    }  
    
    //get data
    public void setTextToWelcomeLbl(String str) {
        JLabel welLbl = Manager.getSfpStComPage().getWelcome();
        welLbl.setText(str);
        welLbl.setHorizontalTextPosition(JLabel.CENTER);
        CommonSettings.settingFont30(welLbl);
    }    
    public void setAllData() {
        setAthletes();
        setJudges();
        setElements();    
        int competitionKind = (int) tcModel.getValueAt(tcModel.selRow(), 2);
        if (competitionKind == 2) {
            loadOFPTables();
        }
        createMarkCellsArray();
        sfpStComPage.setSportsmanLabels(athletesByComp.values());
        if (competitionKind == 3) {
            sfpStComPage.setElementWithJudgesLabels(elementsByComp.values(), judgesByComp);
            sfpStComPage.setFields(marksList, 200);
        }
        else{
            sfpStComPage.setElementLabels(elementsByComp.values());
            sfpStComPage.setFields(marksList, 0);
        }                
    }
    
    //athlets***
    /*get athletes, TAKING PART IN COMPETITION from DB
    save to array as data*/
    private void setAthletes() {
        tcModel = TestComModel.getTestComModelInstance(); 
        int selRow = tcModel.selRow();
        String query;        
        PreparedStatement prst = null;        
        ResultSet rs = null;                                 
        try {           
            query = "SELECT DISTINCT ATHLETE.ID, " +
                            "ATHLETE.Surname, ATHLETE.Name, " +
                            "ATHLETE.Middlename " +
                        "FROM COMPETITION, COMPETITION_ATHLETE_LINK, " +
                            "ATHLETE " +
                        "WHERE COMPETITION_ATHLETE_LINK.IDcompetition = " + 
                    tcModel.getValueAt(selRow, 1) +  
                    "AND ATHLETE.ID = COMPETITION_ATHLETE_LINK.IDathlete;";
            prst = DBC.prepareStatement(query);
            rs = prst.executeQuery();           
        } catch (SQLException ex) {
            Logger.getLogger(SfpStComModel.class.getName()).
                   log(Level.SEVERE, 
           "Do not take athlets from DB for SFPstartComPage", ex);
        } 
        //data
        try {
            //clear the data
            getAthletesByComp().clear();            
            //get data        
            while (rs.next()) {            
                Athlete athlete = new Athlete();
                athlete.setId(rs.getInt(1));
                athlete.setName(rs.getString(3));
                athlete.setSurname(rs.getString(2));
                athlete.setMiddlename(rs.getString(4));                   
                getAthletesByComp().put(athlete.getId(), new SportsmanResult(athlete));                                                                
            }
            rs.close();
            prst.close();
        } catch (SQLException ex) {
                Logger.getLogger(SfpStComModel.class.getName()).
                       log(Level.SEVERE, 
               "Do not set athlets for SFPstartComPage", ex);
        }        
    }
    
    //judges***
    /*get judges, TAKING PART IN COMPETITION from DB
    save to array as data*/
    private void setJudges() {
        tcModel = TestComModel.getTestComModelInstance();        
        int selRow = tcModel.selRow();   
        sfpStComPage = Manager.getSfpStComPage();
        String query;        
        PreparedStatement prst = null;        
        ResultSet rs = null;                         
        //database 
        try {           
            query = "SELECT JUDGE.ID, JUDGE.Surname, JUDGE.Name, " +
                              "JUDGE.Middlename " +
                        "FROM JUDGE, COMPETITION_JUDGE_LINK " +
                        "WHERE COMPETITION_JUDGE_LINK.IDjudge = JUDGE.id " +
                              "AND COMPETITION_JUDGE_LINK.IDcompetition = " + 
                              tcModel.getValueAt(selRow, 1) + ";";
            prst = DBC.prepareStatement(query);
            rs = prst.executeQuery();             
        } catch (SQLException ex) {
            Logger.getLogger(SfpStComModel.class.getName()).
                   log(Level.SEVERE, 
                   "Do not take judges from DB for SFPstartComPage", ex);
        }          
        //data        
        try { 
            //clear data
            judgesByComp.clear(); 
            sfpStComPage.getListModel().clear();
            //get data   
            int i = 1;
            while (rs.next()) {            
                Judge judge = new Judge();
                judge.setId(rs.getInt(1));
                judge.setSurname(rs.getString(2));
                judge.setName(rs.getString(3));
                judge.setMiddlename(rs.getString(4));                
                judgesByComp.add(judge);  
                String str = i + ". " + judge;               
                sfpStComPage.getListModel().addElement(str);
                
                i++;
            }
            prst.close();
            rs.close();
        } catch (SQLException ex) {
                Logger.getLogger(SfpStComModel.class.getName()).
                       log(Level.SEVERE, 
                "Do not set judges for SFPstartComPage", ex);
        }        
    }
    
    //elements***
    /*get elements in COMPETITION from DB
    save to array as data*/
    private void setElements () {
        tcModel = TestComModel.getTestComModelInstance();        
        int selRow = tcModel.selRow();        
        String query;   
        String queryTableName;
        
        PreparedStatement prstTableName = null;
        ResultSet rsTableName = null;
        PreparedStatement prst = null;        
        ResultSet rs = null;                         
        //database 
        try {
            queryTableName = "SELECT COMPETITION_KIND.TableName " +
                             "FROM COMPETITION_KIND, COMPETITION " +
                             "WHERE COMPETITION_KIND.ID = " +
                                    "COMPETITION.IDcompetitionKind " +
                             "AND COMPETITION_KIND.ID = " + 
                                    tcModel.getValueAt(selRow, 2) + ";";
            System.out.println("queryTableName " + queryTableName);
            prstTableName = DBC.prepareStatement(queryTableName);
            rsTableName = prstTableName.executeQuery(); 
            String tableName = "";
            while(rsTableName.next()) {
                tableName = rsTableName.getString(1);
            }            
            
            query = "SELECT " + tableName + ". * " + 
                    "FROM " + tableName + ", TESTS_ELEMENTS_LINK " +
                    "WHERE TESTS_ELEMENTS_LINK.IDelement = " + tableName + ".ID " +
                    "AND TESTS_ELEMENTS_LINK.IDcompetition = " +
                     tcModel.getValueAt(selRow, 1) + ";";                   

            System.out.println(query);
                        
            prst = DBC.prepareStatement(query);
            rs = prst.executeQuery(); 
            
        } catch (SQLException ex) {
            Logger.getLogger(SfpEditModel.class.getName()).
                   log(Level.SEVERE, 
                   "Do not take elements from DB for SFPstartComPage", ex);
        }        
        //data        
        try { 
            //clear data
            getElementsByComp().clear();                                       
            //get data      
            while (rs.next()) {            
                Element element = new Element();
                element.setId(rs.getInt(1));
                element.setFullName(rs.getString(2));
                element.setDescription(rs.getString(3));                
                int competitionKind = (int) tcModel.getValueAt(tcModel.selRow(), 2);
                if (competitionKind == 2) {
                    element.setTableName("VALUES_" + element.getId());
                }               
                getElementsByComp().put(element.getId(), element);                                
            }
            prst.close();
            rs.close();
        } catch (SQLException ex) {
                Logger.getLogger(SfpStComModel.class.getName()).
                       log(Level.SEVERE, 
                "Do not set elements for SFPstartComPage", ex);
        }        
    }  
    
    /**
     * TODO
     */
    private void loadOFPTables(){
        // load from DB to pointsTablesList
        for(Element element : getElementsByComp().values()) {
            // получить список нормативов из element.getTableName()
            standards.put(element.getTableName(), new PointsTable());
        }

    }

    private void createMarkCellsArray() {
        int competitionKind = (int) tcModel.getValueAt(tcModel.selRow(), 2);       
        for(SportsmanResult sportsman : getAthletesByComp().values()) {
            ArrayList<MarkCellData> list = new ArrayList<>();
            for(Element element : getElementsByComp().values()) {
                MarkCellData markCellData = null;
                if (competitionKind == 3) {
                    for(Judge judge : judgesByComp) {
                        markCellData = new MarkCellData(sportsman.getAthlete().getId(), element.getId(), judge.getId(), 0);
                        list.add(markCellData);
                    }
                }
                else {
                    markCellData = new MarkCellData(sportsman.getAthlete().getId(), element.getId(), null, 0);
                    list.add(markCellData);
                }
            }
            marksList.add(list);
        }
    }

    private void saveMarks() {
        // save to ALL_RESULTS marksList + competitionID
    }

    // after click button CalculateResults
    private void calculateResults() {
        /*
            0. Перевод результатов в баллы (для СФП и льда они равны, для ОФП смотрим таблицы)
            1. Расчет суммы баллов по каждому человеку
            2. Расчет мест по каждому элементу
            (если судья один - все просто, если несколько - по судьям и элементам, т.е. каждому столбцу)
            3. Расчет суммы мест по человеку
            4. Расчет итоговых мест по людям
            [5. Расчет среднего балла по человеку]
            [6. Определение сдачи/не сдачи зачета по проходному] - ?
            7. Сохранение результаов в БД
         */
    }

    private void saveResults() {
        // save to RESULTS sportsmanList + competitionID
    }

    /**
     * Нормализация результатов, п. 0 calculateResults
     */
    private void normalizevalues() {
        
        int competitionKind = (int) tcModel.getValueAt(tcModel.selRow(), 2);
        
        for (ArrayList<MarkCellData> marks : getMarksList()) {
            for (MarkCellData mark : marks) {
                if (competitionKind == 2) { // ОФП
                    Element element = getElementsByComp().get(mark.getElementId()); // какой это был элемент
                    PointsTable standard = standards.get(element.getTableName());  // имя таблицы с нормативами этого элемента
                    Athlete athlete = getAthletesByComp().get(mark.getSportsmenId()).getAthlete(); // какой спортсмен
                    int normalMark = standard.getNormalMark(athlete.getSex(), athlete.getAge(), mark.getValue()); // получение нормализованной оценки
                    mark.setNormalMark(normalMark); // установка нормализованной оценки
                }
                else if (competitionKind == 1 || competitionKind == 3 ) { // СФП + ледовые зачеты
                    mark.setNormalMark((int)mark.getValue());
                }
            }
        }
    }

    public HashMap<Integer, SportsmanResult> getAthletesByComp() {
        return athletesByComp;
    }

    public HashMap<Integer, Element> getElementsByComp() {
        return elementsByComp;
    }

    public ArrayList<ArrayList<MarkCellData>> getMarksList() {
        return marksList;
    }
}
