//list.setToolTipText("bbliblbiu"); set text by Pointing


package models.Performance;

import data.Athlete;
import data.Season;
import dataBase.DataBaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.*;
import views.Manager;
import views.Performance.PerformanceEditPage;

public class PerformanceEditModel {
    ///this
    private static PerformanceEditModel performanceEditModelInstance = null;
    
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                   getDBconnection(); 
    private PerformanceModel perModel = PerformanceModel.
                                        getPerformanceModelInstance();  
    private PerformanceEditPage perEditPage;
    
    //athlets take part in selected performance
    private ArrayList<Athlete> athletesByPerf = new ArrayList<>();
    
    //athletes without which are in a list 
    private ArrayList<Athlete> athlets = new ArrayList<>();
    
    //edit row of performance
    private int editingRow;
    
    //singletone, get an object link
    public static PerformanceEditModel getPerformanceEditModelInstance() {
        if (performanceEditModelInstance == null)
            performanceEditModelInstance = new PerformanceEditModel();
        return performanceEditModelInstance;
    } 

    private PerformanceEditModel() {}

    //update all fields
     public void updateInfo() {
        //list
        setDatatoList();
        //combobox
        getAllAthletes();
    }   
    
    /*set values for list and arrays
    pick athlets, season*/
    public void setDatatoList() { 
        //a big bad crutch
        perEditPage = Manager.getManagerInstance().getPerEditPage();
        //for geting a query
        PreparedStatement pstmtAthletes = null;
        ResultSet rsAthletes = null;
        String perfAthlets;
        
        //get selected row
        editingRow = perModel.selRow();  
        
        //clear all arrays and variables         
        athletesByPerf.clear();
        perEditPage.getListModel().clear();
        perEditPage.setSeason("");
        perEditPage.getAthletesComboBox().removeAllItems();
        
        /*select performance by selected-row id
        which row-settings to afford
        see at the edit panel*/
        perfAthlets =   "SELECT SEASON_PERFORMANCE.IDathlete, " +
                            "ATHLETE.Surname, ATHLETE.Name, " +
                            "ATHLETE.Middlename, " +
                            "SEASON.ID, " +
                            "SEASON.Period " +
                        "FROM SEASON_PERFORMANCE, ATHLETE, SEASON " +
                        "WHERE SEASON_PERFORMANCE.IDperformance = " +
                               perModel.getValueAt(editingRow, 0) + " " +
                               "AND " +
                               "SEASON_PERFORMANCE.IDathlete = ATHLETE.ID " +
                               "AND " + 
                               "SEASON_PERFORMANCE.IDseason = SEASON.ID;";                                
        try {           
            pstmtAthletes = DBC.prepareStatement(perfAthlets);
            rsAthletes = pstmtAthletes.executeQuery();
            
            //temp for get season once 
            int cicleTemp = 0;
            
            //get athletes from selected performance
            while (rsAthletes.next()) {
                //get data of athletes
                Athlete athlete = new Athlete();
                athlete.setId(rsAthletes.getInt(1));
                athlete.setName(rsAthletes.getString(3));
                athlete.setSurname(rsAthletes.getString(2));
                athlete.setMiddlename(rsAthletes.getString(4));

                //get a season of performance
                if(cicleTemp == 0)  {
                    Season season = new Season();
                    season.setId(rsAthletes.getInt(5));
                    season.setPeriod(rsAthletes.getString(6));                    
                    //add it selected performance-season  to field                                        
                    perEditPage.setSeason(season.getPeriod());
                }
                //not get season later
                cicleTemp++;
                
                //add athles by performance to array
                athletesByPerf.add(athlete);                 
            }
            
            //set athletes to a list view
            for (int i = 0; i < athletesByPerf.size(); i++) {                               
                perEditPage.getListModel().addElement(athletesByPerf.get(i));
            }            
            perEditPage.getList().setModel(perEditPage.getListModel());           
            
        } catch (SQLException ex) {
        Logger.getLogger(PerformanceEditPage.class.getName()).log(Level.SEVERE, 
                "no  create list because of wrong query", ex);
        }
        //close connection to DB
        finally{
            try {
                pstmtAthletes.close();
                rsAthletes.close();
            } catch (SQLException ex) {
                Logger.getLogger(PerformanceEditPage.class.getName()).
                        log(Level.SEVERE, 
                        "no close connection to DB setDatatoList()", ex);
            }
        }
    }    
    
    /*set values for combobox
    athlets which are not at a performance list
    performance athlet's list + athletes in combobox = all athlets*/
    public void getAllAthletes() {
        Statement stmtAllAthletes = null;
        ResultSet rsAllAthletes = null;
        String allAthletes;
        try {
            allAthletes = "SELECT DISTINCT " +
                                  "ATHLETE.ID, " +
                                  "ATHLETE.Surname, ATHLETE.Name, " +
                                  "ATHLETE.Middlename " +
                          "FROM	ATHLETE, SEASON_PERFORMANCE " +
                          "WHERE NOT (ATHLETE.ID = ANY(" +
                                     "SELECT SEASON_PERFORMANCE.IDathlete " +
                                     "FROM SEASON_PERFORMANCE, ATHLETE " +
                                     "WHERE SEASON_PERFORMANCE.IDperformance = " +
                                      perModel.getValueAt(editingRow, 0) + " " +
                                     "AND " +
                                     "SEASON_PERFORMANCE.IDathlete = ATHLETE.ID)) " +
                          "ORDER BY ATHLETE.Surname;";
            
            stmtAllAthletes = DBC.createStatement();
            rsAllAthletes = stmtAllAthletes.executeQuery(allAthletes);
            
            //get all needed athlets
            while (rsAllAthletes.next()) {                 
                Athlete athlete = new Athlete();
                athlete.setId(rsAllAthletes.getInt(1));
                athlete.setName(rsAllAthletes.getString(3));
                athlete.setSurname(rsAllAthletes.getString(2));
                athlete.setMiddlename(rsAllAthletes.getString(4));
                
                //push them by one into combobox
                perEditPage.getAthletesComboBox().addItem(athlete);
                //push them by one into array                                
                athlets.add(athlete); 
            }                            
        } catch (SQLException ex) {
            Logger.getLogger(PerformanceEditPage.class.getName()).log(Level.SEVERE, 
                             "no get all athletes, to show in combobox", ex);
        }
        //close connection to DB
        finally{
            try {
                stmtAllAthletes.close();
                rsAllAthletes.close();
            } catch (SQLException ex) {
                Logger.getLogger(PerformanceEditPage.class.getName()).
                        log(Level.SEVERE, 
                        "no close connection to DB getAllAthletes()", ex);
            }
        }
    }  
}
