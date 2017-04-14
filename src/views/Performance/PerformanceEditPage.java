package views.Performance;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import views.CommonSettings;

public class PerformanceEditPage extends JPanel { 
   
    //panel's components
    //scrl for a list
    private DefaultListModel listModel;
    private JList list = null;    
    private JScrollPane scrl = null;
    private JComboBox athletesComboBox;
    private String season;
    
    //athletes
    private JLabel athleteLbl;
    private JButton delAthleteBtn;
    private JButton addAthleteBtn;    
    
    //season
    private JLabel seasonLbl;
    private JButton setSeasonBtn;
    private JComboBox seasonComboBox;
    private JButton addSeasonBtn;
    private JButton delSeasonBtn; 
    
    //edit row of performance
    private int editingRow;
       
    public PerformanceEditPage() {        
        //panel settings
        CommonSettings.panelSettings(this);
        listModel = new DefaultListModel();        
        
        //athletes
        labelAthletes();
        listAthletes();
        scrollAthletes();
        comboAthletes();
        addBtnAthletes();
        delBtnAthletes();
        
        //season
        labelSeason();
        comboSeason(); 
        chooseBtnSeason();
        addBtnSeason();
        delBtnSeason();
    }
        
    //ATHLETE*******************************************************************
    private void labelAthletes() {
        setAthleteLbl(new JLabel("Список спортсменов-участников"));
        getAthleteLbl().setSize(800, 100);
        getAthleteLbl().setLocation(400, 200);
        CommonSettings.settingFont30(getAthleteLbl());
        CommonSettings.settingGrayBorder(getAthleteLbl());
        getAthleteLbl().setOpaque(true);
        getAthleteLbl().setBackground(Color.LIGHT_GRAY);
        this.add(getAthleteLbl());
    } 
    
    private void listAthletes() {
        setListModel(new DefaultListModel());
        setList(new JList());        
        CommonSettings.settingFont30(getList());
        getList().setVisible(true);        
        getList().setBackground(Color.WHITE);
        getList().setSelectedIndex(0);
        getList().setFocusable(false);    
    }
    
    //scroll for a list
    private void scrollAthletes() {
        setScrl(new JScrollPane(getList()));
        getScrl().setSize(800, 950);
        getScrl().setLocation(400, 310);
        this.add(getScrl());    
    }
    
    private void comboAthletes() {
        //combobox for choise athlete
        setAthletesComboBox(new JComboBox());
        CommonSettings.settingFont30(getAthletesComboBox());
        getAthletesComboBox().setEditable(true);
        getAthletesComboBox().setSize(690, 100);
        getAthletesComboBox().setLocation(400, 1270);
        this.add(getAthletesComboBox());
    }
    
    private void addBtnAthletes() {
        //button: add athlete to performance
        setAddAthleteBtn(new JButton("+"));
        getAddAthleteBtn().setFocusable(false);
        getAddAthleteBtn().setSize(100, 100);
        getAddAthleteBtn().setLocation(1100, 1270);
        CommonSettings.settingFont30(getAddAthleteBtn());
        getAddAthleteBtn().setBackground(Color.LIGHT_GRAY);
        getAddAthleteBtn().addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String element = (String)getAthletesComboBox().getSelectedItem();
                getListModel().addElement(element);
                int index = getListModel().size() - 1;
                getList().setSelectedIndex(index);
                getList().ensureIndexIsVisible(index);
            }
        });
        this.add(getAddAthleteBtn());   
    }
    
    private void delBtnAthletes() {
        //button: delete athlete from performance
        setDelAthleteBtn(new JButton("-"));
        CommonSettings.settingFont30(getDelAthleteBtn());
        getDelAthleteBtn().setFocusable(false);
        getDelAthleteBtn().setSize(100, 100);
        getDelAthleteBtn().setLocation(1100, 1380);
        getDelAthleteBtn().setBackground(Color.LIGHT_GRAY);
        getDelAthleteBtn().addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                getListModel().remove(getList().getSelectedIndex());
            }
        });
        this.add(getDelAthleteBtn());
        //if athlete not chosen, not enable btn del
        getList().addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent e) {
                if (getList().getSelectedIndex() >= 0) {
                    getDelAthleteBtn().setEnabled(true);
                } else {
                    getDelAthleteBtn().setEnabled(false);
                }
            }
        });
    }
    
    //SEASON********************************************************************    
    private String[] seasons = {
            "2015/2016",
            "2016/2017",
        };
    
    private void labelSeason() {
        setSeasonLbl(new JLabel("Настройка сезона постановки"));
        getSeasonLbl().setSize(800, 100);
        getSeasonLbl().setLocation(1300, 200);
        CommonSettings.settingFont30(getSeasonLbl());
        CommonSettings.settingGrayBorder(getSeasonLbl());
        getSeasonLbl().setOpaque(true);
        getSeasonLbl().setBackground(Color.LIGHT_GRAY);
        this.add(getSeasonLbl());
    }
    
    private void comboSeason() {
        setSeasonComboBox(new JComboBox(seasons));
        CommonSettings.settingFont30(getSeasonComboBox());
        getSeasonComboBox().setEditable(true);
        getSeasonComboBox().setSize(690, 100);
        getSeasonComboBox().setLocation(1300, 310);
        this.add(getSeasonComboBox());
    }
    
    private void chooseBtnSeason() {
        setSetSeasonBtn(new JButton("✔"));
        getSetSeasonBtn().setFocusable(false);
        getSetSeasonBtn().setSize(100, 100);
        getSetSeasonBtn().setLocation(2000, 310);
        CommonSettings.settingFont30(getSetSeasonBtn());
        getSetSeasonBtn().setBackground(Color.LIGHT_GRAY);
        getSetSeasonBtn().addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {               
            }
        });
        this.add(getSetSeasonBtn());
    }
    
    private void addBtnSeason() {
        setAddSeasonBtn(new JButton("Добавить сезон"));
        getAddSeasonBtn().setFocusable(false);
        getAddSeasonBtn().setSize(340, 100);
        getAddSeasonBtn().setLocation(1300, 420);
        CommonSettings.settingFont30(getAddSeasonBtn());
        getAddSeasonBtn().setBackground(Color.LIGHT_GRAY);
        getAddSeasonBtn().addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
            }
        });
        this.add(getAddSeasonBtn());
    }
    
    private void delBtnSeason() {
        setDelSeasonBtn(new JButton("Удалить сезон"));
        CommonSettings.settingFont30(getDelSeasonBtn());
        getDelSeasonBtn().setFocusable(false);
        getDelSeasonBtn().setSize(340, 100);
        getDelSeasonBtn().setLocation(1650, 420);
        getDelSeasonBtn().setBackground(Color.LIGHT_GRAY);
        getDelSeasonBtn().addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //listModel.remove(list.getSelectedIndex());
            }
        });
        this.add(getDelSeasonBtn());   
    }   

    public JList getList() {
        return list;
    }
    public DefaultListModel getListModel() {
        return listModel;
    }
    public JScrollPane getScrl() {
        return scrl;
    }
    public JComboBox getAthletesComboBox() {
        return athletesComboBox;
    }
    public String getSeason() {
        return season;
    }
    public JLabel getAthleteLbl() {
        return athleteLbl;
    }
    public JButton getDelAthleteBtn() {
        return delAthleteBtn;
    }
    public JButton getAddAthleteBtn() {
        return addAthleteBtn;
    }
    public JLabel getSeasonLbl() {
        return seasonLbl;
    }
    public JButton getSetSeasonBtn() {
        return setSeasonBtn;
    }
    public JComboBox getSeasonComboBox() {
        return seasonComboBox;
    }
    public JButton getAddSeasonBtn() {
        return addSeasonBtn;
    }
    public JButton getDelSeasonBtn() {
        return delSeasonBtn;
    }
    public int getEditingRow() {
        return editingRow;
    }
    public String getSeasons() {
        return season;
    }

    public void setList(JList list) {
        this.list = list;
    }
    public void setListModel(DefaultListModel listModel) {
        this.listModel = listModel;
    }
    public void setScrl(JScrollPane scrl) {
        this.scrl = scrl;
    }
    public void setAthletesComboBox(JComboBox athletesComboBox) {
        this.athletesComboBox = athletesComboBox;
    }
    public void setSeason(String season) {
        this.season = season;
    }
    public void setAthleteLbl(JLabel athleteLbl) {
        this.athleteLbl = athleteLbl;
    }
    public void setDelAthleteBtn(JButton delAthleteBtn) {
        this.delAthleteBtn = delAthleteBtn;
    }
    public void setAddAthleteBtn(JButton addAthleteBtn) {
        this.addAthleteBtn = addAthleteBtn;
    }
    public void setSeasonLbl(JLabel seasonLbl) {
        this.seasonLbl = seasonLbl;
    }
    public void setSetSeasonBtn(JButton setSeasonBtn) {
        this.setSeasonBtn = setSeasonBtn;
    }
    public void setSeasonComboBox(JComboBox seasonComboBox) {
        this.seasonComboBox = seasonComboBox;
    }
    public void setAddSeasonBtn(JButton addSeasonBtn) {
        this.addSeasonBtn = addSeasonBtn;
    }
    public void setDelSeasonBtn(JButton delSeasonBtn) {
        this.delSeasonBtn = delSeasonBtn;
    }
    public void setEditingRow(int editingRow) {
        this.editingRow = editingRow;
    }
    public void setSeasons(String season) {
        this.season = season;
    }
}
