package views.TestCom.StartCom;

import java.awt.Color;
import java.awt.Dimension;
import javax.swing.JLabel;

public class HeaderLabel extends JLabel {  
    
    private Dimension sizeRow = new Dimension(300, 100);
    private Dimension sizeCol = new Dimension(400, 100);
    private int top = 0;
    private boolean rowOrCol;
    private int serial;
    private String text;
    
    //row = elements = false, column = FIOs = true
    //count start one
    public HeaderLabel(boolean rowOrCol, int serial, String text) {        
        this.rowOrCol = rowOrCol;
        this.serial = serial;     
        this.text = text;
        calculate();
    }   
    
    public HeaderLabel(boolean rowOrCol, int serial, String text, Dimension sizeRow) {        
        this(rowOrCol, serial, text);
        this.sizeRow = sizeRow;
        calculate();
    } 
    
    public HeaderLabel(boolean rowOrCol, int serial, String text, int top) {        
        this(rowOrCol, serial, text);
        this.top = top;
        calculate();
    } 

    private void calculate() {        
        //FIOs
        if (rowOrCol == true) {
            this.setSize(sizeCol);
            this.setLocation(0, sizeCol.height * serial);
        } 
        //elements
        else if (rowOrCol == false) {
            this.setSize(sizeRow);
            this.setLocation(400 + sizeRow.width * serial, top);
        }
        this.setText(text);
        this.setVisible(true);
        this.setOpaque(true);
        this.setBackground(Color.LIGHT_GRAY);
    }

}
