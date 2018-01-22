package views.TestCom.StartCom;

import javax.swing.JTextField;
import data.MarkCellData;
import java.awt.Color;
import views.CommonSettings;
import views.Manager;

public class MarkTextField extends JTextField{
      
    private MarkCellData data;
    private boolean savedDB;
    private int resultId;

    private int w = Manager.getWidthWithInsets();
    private int h = Manager.getHeightWithInsets();
    
    
    public MarkTextField(MarkCellData data) {
        this.savedDB = false;
        this.data = data;
        this.setSize(w/16, h/18);
        this.setVisible(true);
        this.setOpaque(true);
        this.setBackground(Color.LIGHT_GRAY);
        CommonSettings.settingFont30(this);
        CommonSettings.settingLightGrayBorder(this);
        this.setBackground(Color.WHITE);        
    }
    
    public MarkCellData getData() {
        return data;
    }
    public boolean isSaved() {
        return savedDB;
    }
    public int getResultId() {
        return resultId;
    }

    public void setData(MarkCellData data) {
        this.data = data;
    }
    public void saveToDB() {
        savedDB = true;
    } 
    public void setResultId(int resultId) {
        this.resultId = resultId;
    }
}
