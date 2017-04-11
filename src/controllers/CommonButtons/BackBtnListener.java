package controllers.CommonButtons;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import views.Manager;

public class BackBtnListener implements ActionListener{    
    public void actionPerformed(ActionEvent e) { 
       Manager.choosePanel(40);
    }    
}
