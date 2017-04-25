package models.TestCom;

import data.Athlete;
import data.Judge;
import dataBase.DataBaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import views.Manager;
import views.TestCom.GlasialEditPage;

public class GlasialEditModel {    
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                   getDBconnection(); 
    
    private TestComModel tcModel;
    private GlasialEditPage glasialEditPage;
    
    /*athlets take part in selected performance
    for view at list*/
    private ArrayList<Athlete> athletesByComp = new ArrayList<>();    
    //athletes without which are in a list 
    private ArrayList<Athlete> athlets = new ArrayList<>();
    
    /*judges take part in selected performance
    for view at list*/
    private ArrayList<Judge> judgeByComp = new ArrayList<>();
    //judges without which are in a list 
    private ArrayList<Judge> judges = new ArrayList<>();
        
    private static GlasialEditModel glasialEditModelInstace = null;
    private GlasialEditModel() {}    
    public static GlasialEditModel getGlasialEditModelInstance() {
        if (glasialEditModelInstace == null) {
            glasialEditModelInstace = new GlasialEditModel();
        }
        return glasialEditModelInstace;
    } 
    
    //*****************************ATHLETES*************************************
    //ADD ATHLETE***************************************************************
    public void addAthlete() {
        glasialEditPage = Manager.getGlasialEdtiPage();
        tcModel = TestComModel.getTestComModelInstance();
        
        //selected athlete
        Athlete newAthl = (Athlete)glasialEditPage.getAthlCombo().
                                                getSelectedItem();        
        
        //add to list
        glasialEditPage.getAthlLstModel().addElement(newAthl);
        //insert to array data
        athletesByComp.add(newAthl);
        
        //del from combo
        glasialEditPage.getAthlCombo().removeItem(newAthl);        
        //del from array data of combo
        athlets.remove(newAthl);       
        
        //insert into db
        try {
           String query = "INSERT INTO COMPETITION_ATHLETE_LINK " +
                   "VALUES (" + newAthl.getId() + ", " + 
                                tcModel.getValueAt(tcModel.selRow(), 1) + ");" ;
           
           System.out.println(query);
           PreparedStatement pstmt = DBC.prepareStatement(query);
           pstmt.execute();
           pstmt.close();
        } catch (SQLException ex) {
           Logger.getLogger(SfpEditModel.class.getName()).
                  log(Level.SEVERE, null, ex);        
        } catch (NullPointerException ex) {           
            JOptionPane.showMessageDialog(Manager.getGlasialEdtiPage(),
                        "Список спортсменов, доступных для добавления пуст!",
                        "Ошибка", JOptionPane.WARNING_MESSAGE);
            return;
        } 
    }
    
    //DEL ATHLETE***************************************************************
    public void delAthlete() { 
        glasialEditPage = Manager.getGlasialEdtiPage();
        tcModel = TestComModel.getTestComModelInstance(); 
        
        //if athlete is not selected
        if (glasialEditPage.getAthlLst().getSelectedValue() == null) {
            JOptionPane.showMessageDialog(Manager.getPerPage(),
                        "Перед удалением необходимо выделить спортсмена!",
                        "Ошибка", JOptionPane.WARNING_MESSAGE);
            return;
        }        
        //selected athlete
        Athlete newAthl = (Athlete)glasialEditPage.getAthlLst().
                                             getSelectedValue();        
        //del from list
        glasialEditPage.getAthlLstModel().removeElement(newAthl);
        athletesByComp.remove(newAthl);
        
        //add to combobox
        glasialEditPage.getAthlCombo().addItem(newAthl);
        athlets.add(newAthl);
        
        //del from database         
        try {
           String query = "DELETE FROM COMPETITION_ATHLETE_LINK " +
                          "WHERE IDathlete = " + newAthl.getId() + " AND " + 
                                "IDcompetition = " + 
                                tcModel.getValueAt(tcModel.selRow(), 1) + ";" ;           
           System.out.println(query);
           PreparedStatement pstmt = DBC.prepareStatement(query);
           pstmt.execute();
           pstmt.close();
        } catch (SQLException ex) {
           Logger.getLogger(SfpEditModel.class.getName()).
                  log(Level.SEVERE, 
                  "Not del athlete from combobox", ex);
        }
    }
    //*********************************JUDGES***********************************
    //GET JUDGES 
    /*get judges, TAKING PART IN COMPETITION from DB
    save to array as data
    view it at list*/
    public void setJudgesList () {
        tcModel = TestComModel.getTestComModelInstance();
        int selRow = tcModel.selRow();
        
        String queryLst;        
        PreparedStatement prstLst = null;        
        ResultSet rsLst = null; 
                        
        //database lst  
        try {           
            queryLst = "SELECT JUDGE.ID, JUDGE.Surname, JUDGE.Name, " +
                              "JUDGE.Middlename " +
                        "FROM JUDGE, COMPETITION_JUDGE_LINK " +
                        "WHERE COMPETITION_JUDGE_LINK.IDjudge = JUDGE.id " +
                              "AND COMPETITION_JUDGE_LINK.IDcompetition = " + 
                              tcModel.getValueAt(selRow, 1) + ";";
                         
            prstLst = DBC.prepareStatement(queryLst);
            rsLst = prstLst.executeQuery(); 
            
        } catch (SQLException ex) {
            Logger.getLogger(GlasialEditModel.class.getName()).
                   log(Level.SEVERE, 
                   "", ex);
        }      
        
        //data lst        
        try { 
            /*get links, clear the array of lst, 
            clear view of lst*/
            glasialEditPage = Manager.getGlasialEdtiPage();                                    
            judgeByComp.clear();            
            glasialEditPage.getJudLstModel().clear();                 
            
            //lst        
            while (rsLst.next()) {            
                Judge judge = new Judge();
                judge.setId(rsLst.getInt(1));
                judge.setSurname(rsLst.getString(2));
                judge.setName(rsLst.getString(3));
                judge.setMiddlename(rsLst.getString(4));                
                //do it for save data in dif arrays 
                //in dif models
                judgeByComp.add(judge);
                glasialEditPage.getJudLstModel().addElement(judge);
            }
            prstLst.close();
            rsLst.close();
        } catch (SQLException ex) {
                Logger.getLogger(GlasialEditModel.class.getName()).
                       log(Level.SEVERE, null, ex);
        }        
    }
    
    /*get judges, DON'T TAKING PART IN COMPETITION from DB
    save to array as data
    view it at combobox*/
    public void setJudgesCombo() {
        tcModel = TestComModel.getTestComModelInstance();
        int selRow = tcModel.selRow();
        
        String queryCmb;
        PreparedStatement prstCmb = null;
        ResultSet rsCmb = null;
                
        //database cmb 
        try {            
            queryCmb =  "SELECT JUDGE.ID, JUDGE.Surname, " +
                               "JUDGE.Name, JUDGE.Middlename " +
                        "FROM JUDGE " +
                        "WHERE NOT JUDGE.ID = ANY (SELECT JUDGE.ID " +
                        "FROM JUDGE, COMPETITION_JUDGE_LINK " +
                        "WHERE COMPETITION_JUDGE_LINK.IDjudge = JUDGE.id " +
                        "AND COMPETITION_JUDGE_LINK.IDcompetition = " +
                        tcModel.getValueAt(selRow, 1) + ");";
            
            prstCmb = DBC.prepareStatement(queryCmb);
            rsCmb = prstCmb.executeQuery();             
        } catch (SQLException ex) {
            Logger.getLogger(TestComModel.class.getName()).
                   log(Level.SEVERE, null, ex);
        }
        try { 
            /*get links, clear the array of cmb, 
            clear view of cmb*/
            glasialEditPage = Manager.getGlasialEdtiPage();                                    
            glasialEditPage.getJudCombo().removeAllItems();  
            judges.clear();            
            //cmb
            while (rsCmb.next()) {            
                Judge judge = new Judge();
                judge.setId(rsCmb.getInt(1));
                judge.setSurname(rsCmb.getString(2));
                judge.setName(rsCmb.getString(3));
                judge.setMiddlename(rsCmb.getString(4));                               
                //do it for save data in dif arrays 
                //in dif models
                judges.add(judge);
                glasialEditPage.getJudCombo().addItem(judge);
            }              
            prstCmb.close();
            rsCmb.close();
        } catch (SQLException ex) {
            Logger.getLogger(SfpEditModel.class.getName()).
                   log(Level.SEVERE, null, ex);
        }
    }
    
    //add athlete chosen from combobox        
    public void addJudge() {
        glasialEditPage = Manager.getGlasialEdtiPage();
        tcModel = TestComModel.getTestComModelInstance(); 
        
        //selected athlete
        Judge newJudge = (Judge)glasialEditPage.getJudCombo().getSelectedItem();        
        
        //add to list
        glasialEditPage.getJudLstModel().addElement(newJudge);
        //insert to array data
        judgeByComp.add(newJudge);
        
        //del from combo
        glasialEditPage.getJudCombo().removeItem(newJudge);        
        //del from array data of combo
        judges.remove(newJudge);       
        
        //insert into db
        try {
           String query = "INSERT INTO COMPETITION_JUDGE_LINK " +
                   "VALUES (" + tcModel.getValueAt(tcModel.selRow(), 1) + ", " + 
                                newJudge.getId() + ");" ;
           System.out.println(query);
           PreparedStatement pstmt = DBC.prepareStatement(query);
           pstmt.execute();
        } catch (SQLException ex) {
           Logger.getLogger(SfpEditModel.class.getName()).
                  log(Level.SEVERE, null, ex);
        } catch (NullPointerException ex) {           
            JOptionPane.showMessageDialog(Manager.getGlasialEdtiPage(),
                        "Список судей, доступных для добавления пуст!",
                        "Ошибка", JOptionPane.WARNING_MESSAGE);
            return;
        }   
    }
    
    public void delJudge() { 
        glasialEditPage = Manager.getGlasialEdtiPage();
        tcModel = TestComModel.getTestComModelInstance(); 
        
          if (glasialEditPage.getJudLst().getSelectedValue() == null) {
            JOptionPane.showMessageDialog(Manager.getPerPage(),
                        "Перед удалением необходимо выделить судью!",
                        "Ошибка", JOptionPane.WARNING_MESSAGE);
            return;
        }
        
        //selected athlete
        Judge newJudge = (Judge)glasialEditPage.getJudLst().getSelectedValue();
        
        //del from list
        glasialEditPage.getJudLstModel().removeElement(newJudge);
        judgeByComp.remove(newJudge);
        
        //add to combobox
        glasialEditPage.getJudCombo().addItem(newJudge);
        judges.add(newJudge);
        
        //del from database         
        try {
           String query = "DELETE FROM COMPETITION_JUDGE_LINK " +
                          "WHERE IDjudge = " + newJudge.getId() + " AND " + 
                                "IDcompetition = " + 
                                tcModel.getValueAt(tcModel.selRow(), 1) + ";" ;           
           System.out.println(query);
           PreparedStatement pstmt = DBC.prepareStatement(query);
           pstmt.execute();
        } catch (SQLException ex) {
           Logger.getLogger(SfpEditModel.class.getName()).
                  log(Level.SEVERE, null, ex);
        }
    }
    
    
    //GETTERS*******************************************************************
    public ArrayList<Athlete> getAthletesByComp() {
        return athletesByComp;
    }

    public ArrayList<Athlete> getAthlets() {
        return athlets;
    }
    
}
