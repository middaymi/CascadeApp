package models.TestCom.StartCom;

import data.Athlete;
import data.Competition;
import data.CompetitionIsuAthleteResult;
import data.Component;
import data.ComponentIsu;
import data.ComponentValue;
import data.ElementData;
import data.ElementIsu;
import data.IsuElementType;
import data.IsuElementsData;
import data.Judge;
import data.Rank;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import models.TestCom.TestComModel;
import views.Manager;
import views.TestCom.StartCom.SingleStComPage;

public class IsuComModel extends StComModel {
    
    //athlets take part in selected competition  and their results   
    private HashMap<Integer, CompetitionIsuAthleteResult> athletesByComp = new HashMap<>();
    private Competition competition;
    private ArrayList<Component> components = new ArrayList<>(); 
    private HashMap<Integer, ElementData> allElements = new HashMap<>();
    private HashMap<Integer, IsuElementType> allTypes = new HashMap<>();
    private float factor = 0;
    private Rank rank = new Rank();
    //generate empty or full protocol
    private int mode;
    private boolean isFinished = false;
    
    private SingleStComPage singleComPage;
    
    private CompetitionIsuAthleteResult CIAR;
    
    private IsuComModel() {}
    
    private static IsuComModel stComModelInstance = null;  
    public static IsuComModel getModelInstance() {
        if (stComModelInstance == null) {
            stComModelInstance = new IsuComModel();
        }
        return stComModelInstance;
    }
    
    private Competition getSelCompetition() {
        int index = TestComModel.getTestComModelInstance().selRow();
        competition = TestComModel.getTestComModelInstance().
                      getCompetitions().get(index);
        return competition;
    }
    
    //judges***
    /*get judges, TAKING PART IN COMPETITION from DB
    save to array as data*/
    private void setJudges() {
        tcModel = TestComModel.getTestComModelInstance();        
        int selRow = tcModel.selRow();   
        singleComPage = Manager.getSingleComPage();
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
            prst = getDBC().prepareStatement(query);
            rs = prst.executeQuery();             
        } catch (SQLException ex) {
            Logger.getLogger(StComModel.class.getName()).
                   log(Level.SEVERE, 
                   "Do not take judges from DB for SFPstartComPage", ex);
        }          
        //data        
        try { 
            //clear data
            getJudgesByComp().clear(); 
            singleComPage.getLstModel().clear();
            //get data   
            int i = 1;
            while (rs.next()) {            
                Judge judge = new Judge();
                judge.setId(rs.getInt(1));
                judge.setSurname(rs.getString(2));
                judge.setName(rs.getString(3));
                judge.setMiddlename(rs.getString(4));                
                getJudgesByComp().add(judge);  
                String str = "<html>"+ i + ". " + judge.getSurname() + " " +
                                        judge.getName() +
                                        "<p align=left>" + 
                                        judge.getMiddlename() + 
                             "</html>";                         
                singleComPage.getLstModel().addElement(str);                
                i++;
            }
            prst.close();
            rs.close();
        } catch (SQLException ex) {
                Logger.getLogger(StComModel.class.getName()).
                       log(Level.SEVERE, 
                "Do not set judges for SFPstartComPage", ex);
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
                            "ATHLETE.Middlename, ATHLETE.Birthday " +
                        "FROM COMPETITION, COMPETITION_ATHLETE_LINK, " +
                            "ATHLETE " +
                        "WHERE COMPETITION_ATHLETE_LINK.IDcompetition = " + 
                    tcModel.getValueAt(selRow, 1) +  
                    "AND ATHLETE.ID = COMPETITION_ATHLETE_LINK.IDathlete;";
            prst = getDBC().prepareStatement(query);
            rs = prst.executeQuery();           
        } catch (SQLException ex) {
            Logger.getLogger(StComModel.class.getName()).
                   log(Level.SEVERE, 
           "Do not take athlets from DB for SFPstartComPage", ex);
        } 
        //data
        try {
            //clear the data
            getAthletesByComp().clear();  
            singleComPage.getAthlCmb().removeAllItems();
            //get data        
            while (rs.next()) {            
                Athlete athlete = new Athlete();
                athlete.setId(rs.getInt(1));
                athlete.setName(rs.getString(3));
                athlete.setSurname(rs.getString(2));
                athlete.setMiddlename(rs.getString(4)); 
                athlete.setBirthday(rs.getDate(5));
                singleComPage.getAthlCmb().addItem(athlete);
            }            
            rs.close();
            prst.close();
            singleComPage.getAthlCmb().setSelectedItem(null);
            singleComPage.getAthlCmb().addActionListener(new controllers.TestComPage.SingleComPage.
                                                              SetAthlete()); 
            
        } catch (SQLException ex) {
                Logger.getLogger(StComModel.class.getName()).
                       log(Level.SEVERE, 
               "Do not set athlets for SingleStartCompetition class", ex);
        }        
    }
    
    //element types***
    /*get element types from DB
    save to array as data*/
    private void setTypes() {                
        String query;        
        PreparedStatement prst = null;        
        ResultSet rs = null;                                 
        try {           
            query = "SELECT * FROM ISU_ELEMENT_TYPE";
            prst = getDBC().prepareStatement(query);
            rs = prst.executeQuery();          
            while(rs.next()) {
                IsuElementType type = new IsuElementType();
                type.setId(rs.getInt(1));
                type.setFullName(rs.getString(2));
                type.setDescription(rs.getString(3));
                getAllTypes().put(type.getId(), type);                  
            }
            prst.close();
            rs.close();                        
            
        } catch (SQLException ex) {
            Logger.getLogger(StComModel.class.getName()).
                   log(Level.SEVERE, 
           "Do not take element's types from DB", ex);
        } 
    }
    
    //elements***
    /*get all elements from DB
    save to array as data*/
    private void setElements() {
        String query;        
        PreparedStatement prst = null;        
        ResultSet rs = null;                                 
        try {           
            query = "SELECT * FROM ISU_ELEMENT";
            prst = getDBC().prepareStatement(query);
            rs = prst.executeQuery();          
            while(rs.next()) {
                ElementData element = new ElementData();
                element.setId(rs.getInt(1));
                element.setAbbreviation(rs.getString(2));
                element.setFullNameEng(rs.getString(3));
                element.setFullNameRus(rs.getString(4));
                element.setLevel(rs.getInt(5));
                element.setElementTypeId(rs.getInt(6));
                element.setValuePlus3(rs.getFloat(7));
                element.setValuePlus2(rs.getFloat(8));
                element.setValuePlus1(rs.getFloat(9));
                element.setBase(rs.getFloat(10));
                element.setBaseV(rs.getFloat(11));
                element.setBaseV1(rs.getFloat(12));
                element.setBaseV2(rs.getInt(13));
                element.setValueMinus1(rs.getFloat(14));
                element.setValueMinus2(rs.getFloat(15));
                element.setValueMinus3(rs.getFloat(16));
                allElements.put(element.getId(), element);
            }
            IsuElementsData.setData(allElements);
        rs.close();
        prst.close();
        } catch (SQLException ex) {
                Logger.getLogger(StComModel.class.getName()).
                       log(Level.SEVERE, 
               "Do not set elementsIsu", ex);
        }         
    }
    
    //selected rank***
    private void setRank() {
        tcModel = TestComModel.getTestComModelInstance(); 
        int selRow = tcModel.selRow();
        String query;        
        PreparedStatement prst = null;        
        ResultSet rs = null;                                 
        try {           
            query = "SELECT * FROM RANK WHERE ID = " + 
                     tcModel.getCompetitions().get(selRow).getRankId() + ";";
            prst = getDBC().prepareStatement(query);
            rs = prst.executeQuery();          
            //get items
            while (rs.next()) {                            
                rank.setId(rs.getInt(1));
                rank.setFullName(rs.getString(2));
                rank.setRequirements(rs.getString(3));
                rank.setProgramStructure(rs.getString(4)); 
                rank.setProgramsCount(rs.getInt(5));     
            }
            prst.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(StComModel.class.getName()).
                   log(Level.SEVERE, 
           "Do not take selected rank from DB", ex);
        }
    }
    
    //components***
    private void setComponents(){
        components.clear();
        singleComPage.getCompPanel().removeAll();
        String query;        
        PreparedStatement prst = null;        
        ResultSet rs = null;
        try {           
            query = "SELECT COMPONENT_RANK_LINK.IDcomponent, " +
                            "COMPONENT_RANK_LINK.IDrank, " +
                            "COMPONENT.FullNameENG, COMPONENT.FullNameRUS, " +
                            "COMPONENT.Description " +
                    "FROM COMPONENT_RANK_LINK, COMPONENT " +
                    "WHERE IDrank = " + competition.getRankId() + " " +
                    "AND COMPONENT_RANK_LINK.IDcomponent = COMPONENT.ID;";             
            prst = getDBC().prepareStatement(query);
            rs = prst.executeQuery();                      
            while (rs.next()) {   
                Component component = new Component();
                component.setId(rs.getInt(1));
                component.setRankId(rs.getInt(2));
                component.setFullNameENG(rs.getString(3));
                component.setFullNameRUS(rs.getString(4));
                component.setDescription(rs.getString(5));
                components.add(component);                                
            }
            prst.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(StComModel.class.getName()).
                   log(Level.SEVERE, 
           "Do not take selected rank from DB", ex);
        }
    }
    
    public void setAllData() { 
        //set mode empty
        mode = 0;
        
        //get a competition
        getSelCompetition();
        
        //get the last link of panel
        singleComPage = Manager.getSingleComPage();
                
        //set name of competition and rank
        singleComPage.setFulllName(competition.getFullName());
        setRank();
        singleComPage.setRank(rank.getFullName());              
        
        //clearing arrays are at these methods
        singleComPage.getElRows().clear();
        setAthletes();
        setJudges(); 
        setTypes();
        setElements();
        setComponents();
        this.factor = IsuElementsData.getFactor(this.competition.getRankId());        
        singleComPage.createLbls();        
    }
    
    public boolean checkDeductionsAndComponentsValue(String deductions) {
        Pattern p = Pattern.compile("^\\d+?((\\.|\\,)[0-9]{0,2})?$");  
        Matcher m = p.matcher(deductions);  
        return m.matches();
    } 
    
//    private boolean isAthleteResultInDB(ArrayList<Judge>judges) {
//        PreparedStatement prst = null;
//        ResultSet rs = null;
//        String query;
//        
//        try {
//            query = "SELECT R.IDathlete, A.Surname, A.Name, A.Middlename, " +
//                    "A.IDrank, A.Sex,\n" +
//                    "R.ID as IDresult, R.Place, R.SumResult,\n" +
//                    "R.isDone, R.StartNumber, R.SumOfAllElements, R.SumOfAllComponents,\n" +
//                    "R.Deductions\n" +
//                    "FROM RESULT as R, ATHLETE as A \n" +
//                    "WHERE IDcompetition = " + competition.getId() + " " + 
//                    "AND R.IDathlete = A.ID;";
//                        
//            prst = getDBC().prepareStatement(query);
//            rs = prst.executeQuery();
//            
//            //all final results by competition 
//            HashMap<Integer, CompetitionIsuAthleteResult> CIARS = new HashMap<>();
//            while (rs.next()) {                
//                Athlete athlete = new Athlete();
//                athlete.setId(rs.getInt(1));
//                athlete.setSurname(rs.getString(2));
//                athlete.setName(rs.getString(3));
//                athlete.setMiddlename(rs.getString(4));
//                athlete.setIdrank(rs.getInt(5));
//                athlete.setSex(rs.getBoolean(6));
//                CompetitionIsuAthleteResult CIAR = 
//                        new CompetitionIsuAthleteResult(athlete);
//                
//                //result field
//                CIAR.setResultId(rs.getInt(7));
//                CIAR.setPlace(rs.getInt(8));
//                CIAR.setTotalScore(rs.getFloat(9));
//                CIAR.setIsDone(rs.getBoolean(10));
//                CIAR.setStartNumber(rs.getInt(11));
//                CIAR.setElementScore(rs.getFloat(12));
//                CIAR.setComponentScore(rs.getFloat(13));
//                CIAR.setDeductions(rs.getFloat(14));
//                
//                ElementIsu elIsu = new ElementIsu();
//                
//                ComponentIsu compIsu = new ComponentIsu();
//                
//                //compIsu.setJudgesValues(getCompJudMarks(athlete.getId()));
//
//                CIARS.put(athlete.getId(), CIAR);                
//            }
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(IsuComModel.class.getName()).log(Level.SEVERE, null, ex);
//        }        
//    }
    
//    private HashMap<Integer, ComponentValue> getCompJudMarks(int athleteId) {
//        //hash <IDcomponent, Values>
//        PreparedStatement prst = null;
//        ResultSet rs = null;
//        String query;
//        
//        PreparedStatement prstComp = null;
//        ResultSet rsComp = null;
//        String queryComp;
//        //componentId, hashmap
//        HashMap<Integer, HashMap<Integer, ComponentValue>> allJudgesValues;
//        try {
//            query = "SELECT RC.IDcomponent, RC.IDjudge, RC.Value\n" +
//                    "FROM  ALL_RESULTS_COMPONENTS as RC, " +
//                    "COMPETITION_PERFORMANCE_ATHLETE_LINK as CPAL \n" +
//                    "WHERE RC.IDcompetitionPerformanceAthleteLink = CPAL.ID AND " +
//                    "CPAL.IDathlete = " + athleteId + " AND " +
//                    "CPAL.IDcompetition = " + competition.getId() + ";";
//            
//            prst = getDBC().prepareStatement(query);
//            rs = prst.executeQuery();
//            
//            queryComp = "SELECT  Distinct RC.IDcomponent\n" +
//                        "FROM  ALL_RESULTS_COMPONENTS as RC, " +
//                        "COMPETITION_PERFORMANCE_ATHLETE_LINK as CPAL \n" +
//                        "WHERE RC.IDcompetitionPerformanceAthleteLink = CPAL.ID " +
//                        "AND CPAL.IDcompetition = " + competition.getId() + ";";
//            
//            prstComp = getDBC().prepareStatement(queryComp);
//            rsComp = prstComp.executeQuery();
//            
//            allJudgesValues = new HashMap<>();
//            
//            //by all components value
//            while(rs.next()) {
//                HashMap<Integer, ComponentValue> judgesValues = new HashMap<>();
//                //by every component
//                while(rsComp.next()) {                    
//                    ComponentValue compVal = new ComponentValue();
//                    compVal.setComponentId(rs.getInt(1));
//                    compVal.setJudgeId(rs.getInt(2));
//                    compVal.setValue(rs.getFloat(3));
//                    judgesValues.put(compVal.getComponentId(), compVal);
//                }
//                allJudgesValues.put(judgesValues.keySet().hashCode(), judgesValues);                
//            }           
//        } catch (SQLException ex) {
//            Logger.getLogger(IsuComModel.class.getName()).
//                   log(Level.SEVERE, null, ex);
//        }
//        return allJudgesValues;        
//    }
    
    
    
    public Competition getCompetition() {
        return competition;
    }

    public ArrayList<Component> getComponentsList() {
        return components;
    }

    public float getFactor() {
        return factor;
    }

    public void setFactor(float factor) {
        this.factor = factor;
    }    

    public HashMap<Integer, ElementData> getAllElements() {
        return allElements;
    }

    public HashMap<Integer, IsuElementType> getAllTypes() {
        return allTypes;
    }

    public HashMap<Integer, CompetitionIsuAthleteResult> getAthletesResultsByComp() {
        return athletesByComp;
    }

    public CompetitionIsuAthleteResult getCIAR() {
        return CIAR;
    }

    public void setCIAR(CompetitionIsuAthleteResult CIAR) {
        this.CIAR = CIAR;
    }

    public Rank getRank() {
        return rank;
    }

    public void setRank(Rank rank) {
        this.rank = rank;
    }

    public int getMode() {
        return mode;
    }

    public void setMode(int mode) {
        this.mode = mode;
    }

    public boolean isFinished() {
        return isFinished;
    }

    public void setFinished(boolean isFinished) {
        this.isFinished = isFinished;
    }   
}
