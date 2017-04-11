package views.Performance;

import data.Athlete;
import dataBase.DataBaseConnection;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ComboBoxModel;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import models.Performance.PerformanceModel;
import views.CommonSettings;

public class PerformanceEditPage extends JPanel { 
    
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                                      getDBconnection(); 
    private PerformanceModel perModel = PerformanceModel.
                                        getPerformanceModelInstance();

    //edit row of performance
    private int editingRow;
 
    //panel's components
    private JList list = null;
    private JScrollPane scrl = null;
    private JComboBox athleteComboBox = null;
    
    //performance_athletes with id
    private ArrayList<Athlete> athletes = new ArrayList<>();
    //performance_athletes without id for show
//    private ArrayList showList = new ArrayList();
    
    //all athletes with id
    private ArrayList<Athlete> allAthletesWithID = new ArrayList<>();
    //all athletes without id
//    private ArrayList allAthletes = new ArrayList();
    
    private DefaultListModel listModel;
    
    private String season = "";
    
    public PerformanceEditPage() {
        //panel settings
        CommonSettings.panelSettings(this);
        
        //ATHLETE***************************************************************            
        //label
        JLabel athleteLbl = new JLabel("Список спортсменов-участников");
        athleteLbl.setSize(800, 100);
        athleteLbl.setLocation(400, 200);
        CommonSettings.settingFont30(athleteLbl);
        CommonSettings.settingGrayBorder(athleteLbl);
        athleteLbl.setOpaque(true);
        athleteLbl.setBackground(Color.LIGHT_GRAY);
        this.add(athleteLbl);

        //list
        listModel = new DefaultListModel();
        list = new JList();        
        CommonSettings.settingFont30(list);
        list.setVisible(true);        
        list.setBackground(Color.WHITE);
        list.setSelectedIndex(0);
        list.setFocusable(false);
        
        //scroll for list
        scrl = new JScrollPane(list);
        scrl.setSize(800, 950);
        scrl.setLocation(400, 310);
        this.add(scrl);

        //combobox for choise athlete
        athleteComboBox = new JComboBox();
        CommonSettings.settingFont30(athleteComboBox);
        athleteComboBox.setEditable(true);
        athleteComboBox.setSize(690, 100);
        athleteComboBox.setLocation(400, 1270);
        this.add(athleteComboBox);

        //button: add athlete to performance
        JButton addAthleteBtn = new JButton("+");
        addAthleteBtn.setFocusable(false);
        addAthleteBtn.setSize(100, 100);
        addAthleteBtn.setLocation(1100, 1270);
        CommonSettings.settingFont30(addAthleteBtn);
        addAthleteBtn.setBackground(Color.LIGHT_GRAY);
        addAthleteBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String element = (String)athleteComboBox.getSelectedItem();
                listModel.addElement(element);
                int index = listModel.size() - 1;
                list.setSelectedIndex(index);
                list.ensureIndexIsVisible(index);
            }
        });
        this.add(addAthleteBtn);

        //button: delete athlete from performance
        JButton delAthleteBtn = new JButton("-");
        CommonSettings.settingFont30(delAthleteBtn);
        delAthleteBtn.setFocusable(false);
        delAthleteBtn.setSize(100, 100);
        delAthleteBtn.setLocation(1100, 1380);
        delAthleteBtn.setBackground(Color.LIGHT_GRAY);
        delAthleteBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                listModel.remove(list.getSelectedIndex());
            }
        });
        this.add(delAthleteBtn);
        //if athlete not chosen, not enable btn del
        list.addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent e) {
                if (list.getSelectedIndex() >= 0) {
                    delAthleteBtn.setEnabled(true);
                } else {
                    delAthleteBtn.setEnabled(false);
                }
            }
        });


        //SEASON****************************************************************

        JLabel seasonLbl = new JLabel("Настройка сезона постановки");
        seasonLbl.setSize(800, 100);
        seasonLbl.setLocation(1300, 200);
        CommonSettings.settingFont30(seasonLbl);
        CommonSettings.settingGrayBorder(seasonLbl);
        seasonLbl.setOpaque(true);
        seasonLbl.setBackground(Color.LIGHT_GRAY);
        this.add(seasonLbl);

        String[] seasons = {
            "2015/2016",
            "2016/2017",
        };
        JComboBox seasonComboBox = new JComboBox(seasons);
        CommonSettings.settingFont30(seasonComboBox);
        seasonComboBox.setEditable(true);
        seasonComboBox.setSize(690, 100);
        seasonComboBox.setLocation(1300, 310);
        this.add(seasonComboBox);

        JButton setSeasonBtn = new JButton("✔");
        setSeasonBtn.setFocusable(false);
        setSeasonBtn.setSize(100, 100);
        setSeasonBtn.setLocation(2000, 310);
        CommonSettings.settingFont30(setSeasonBtn);
        setSeasonBtn.setBackground(Color.LIGHT_GRAY);
        setSeasonBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
//                String element = (String)seasonComboBox.getSelectedItem();
//                listModel.addElement(element);
//                int index = listModel.size() - 1;
//                list.setSelectedIndex(index);
//                list.ensureIndexIsVisible(index);
            }
        });
        this.add(setSeasonBtn);

        JButton addSeasonBtn = new JButton("Добавить сезон");
        addSeasonBtn.setFocusable(false);
        addSeasonBtn.setSize(340, 100);
        addSeasonBtn.setLocation(1300, 420);
        CommonSettings.settingFont30(addSeasonBtn);
        addSeasonBtn.setBackground(Color.LIGHT_GRAY);
        addSeasonBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
            }
        });
        this.add(addSeasonBtn);

        JButton delSeasonBtn = new JButton("Удалить сезон");
        CommonSettings.settingFont30(delSeasonBtn);
        delSeasonBtn.setFocusable(false);
        delSeasonBtn.setSize(340, 100);
        delSeasonBtn.setLocation(1650, 420);
        delSeasonBtn.setBackground(Color.LIGHT_GRAY);
        delSeasonBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //listModel.remove(list.getSelectedIndex());
            }
        });
        this.add(delSeasonBtn);        
    } 
    //update all fields
     public void updateInfo() {
        //list
        setDatatoList();
        //combobox
        getAllAthletes();
    }   
    
    //set values for list and arrays for list
    public void setDatatoList() { 
        editingRow = perModel.selRow();
        
        //clear all arrays         
//        showList.clear();
        athletes.clear();
        listModel.clear();
        season = "";        
        
        //query
        String selectAthletes = "SELECT SEASON_PERFORMANCE.IDathlete, " +
                                "ATHLETE.Surname, ATHLETE.Name, " +
                                "ATHLETE.Middlename, " +
                                "SEASON.Period " +
                                "FROM SEASON_PERFORMANCE, ATHLETE, SEASON " +
                                "WHERE SEASON_PERFORMANCE.IDperformance = " +
                                perModel.getValueAt(editingRow, 0) +
                                " AND " +
                                "SEASON_PERFORMANCE.IDathlete = ATHLETE.ID AND " + 
                                "SEASON_PERFORMANCE.IDseason = SEASON.ID;"; 
        
        PreparedStatement pstmtAthletes = null;
        ResultSet rsAthletes = null;
        
        try {           
            pstmtAthletes = DBC.prepareStatement(selectAthletes);
            rsAthletes = pstmtAthletes.executeQuery();
            
            int cicleTemp = 0;
            while (rsAthletes.next()) {
                
//                ArrayList idWithFIO = new ArrayList();                
                
//                idWithFIO.add(rsAthletes.getInt(1));                
                
                Athlete athlete = new Athlete();
                athlete.setId(rsAthletes.getInt(1));
                athlete.setName(rsAthletes.getString(3));
                athlete.setSurname(rsAthletes.getString(2));
                athlete.setMiddlename(rsAthletes.getString(4));
                
//                String fioStr = rsAthletes.getString(2) + " " +
//                                rsAthletes.getString(3) + " " +
//                                rsAthletes.getString(4);
                if(cicleTemp + 1 == 1)  {
                    season = rsAthletes.getString(5);
                }
                
//                idWithFIO.add(fioStr); 
                athletes.add(athlete);
//                showList.add(fioStr);                                 
            }
            for (int i = 0; i < athletes.size(); i++) {
                listModel.addElement(athletes.get(i));
            }        
            list.setModel(listModel);           
            list.setToolTipText("bbliblbiu");
            
        } catch (SQLException ex) {
        Logger.getLogger(PerformanceEditPage.class.getName()).log(Level.SEVERE, 
                "no  create list because of wrong query", ex);
        }
        finally{
            try {
                pstmtAthletes.close();
                rsAthletes.close();
            } catch (SQLException ex) {
                Logger.getLogger(PerformanceEditPage.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    //set values for combobox
    public void getAllAthletes() {
        Statement stmtAllAthletes;
        ResultSet rsAllAthletes;
        try {
            String allFromAthlete = "SELECT ATHLETE.ID, ATHLETE.Surname, " +
                                            "ATHLETE.Name, ATHLETE.Middlename " +
                                    "FROM ATHLETE;";
            stmtAllAthletes = DBC.createStatement();
            rsAllAthletes = stmtAllAthletes.executeQuery(allFromAthlete);
            
            while (rsAllAthletes.next()) {                
//                ArrayList idWithFIO = new ArrayList();  
                
                Athlete athlete = new Athlete();
                athlete.setId(rsAllAthletes.getInt(1));
                athlete.setName(rsAllAthletes.getString(3));
                athlete.setSurname(rsAllAthletes.getString(2));
                athlete.setMiddlename(rsAllAthletes.getString(4));
                  
                athleteComboBox.addItem(athlete);
                                
                
//                idWithFIO.add(fioStr);
                allAthletesWithID.add(athlete);                
//                allAthletes.add(athlete);
            }                            
        } catch (SQLException ex) {
            Logger.getLogger(PerformanceEditPage.class.getName()).log(Level.SEVERE, 
                             "no get all athletes, show in combobox", ex);
        }
        finally{
            // close connection
        }
    }
}
