package views.TestCom.StartCom;

import javax.swing.JTextField;
import data.MarkCellData;
import java.awt.Color;
import java.awt.Dimension;

public class MarkTextField extends JTextField{
      
    private MarkCellData data;
    
    public MarkTextField(MarkCellData data) {
        this.data = data;
        //this.setSize(300, 100);
        this.setPreferredSize(new Dimension(300, 100));
        this.setVisible(true);
        this.setOpaque(true);
        this.setBackground(Color.LIGHT_GRAY);
    }
    
    public MarkCellData getData() {
        return data;
    }

    public void setData(MarkCellData data) {
        this.data = data;
    }    
}
