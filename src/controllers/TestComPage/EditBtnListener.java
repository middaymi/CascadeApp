/*
ID:
1 = SFP = 53
2 = OFP = 52
3 = GLASIAL = 51
4 = SINGLE = 54
*/
package controllers.TestComPage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import models.TestCom.TestComModel;
import views.Manager;
import views.TestCom.TestComPage;

public class EditBtnListener implements ActionListener{
    private Manager manager;
    private TestComModel tcModel;
    private TestComPage tcPage;
    int sel;
    int kindId;
    public void actionPerformed(ActionEvent e) {
        manager = Manager.getManagerInstance();
        tcModel = TestComModel.getTestComModelInstance();
        tcPage = manager.getTestCompPage();
        sel = tcModel.selRow();
        kindId = (int)tcModel.getValueAt(sel, 2);
        System.out.println("kindID " + kindId);        
        switch(kindId) {
            case(1):
                manager.choosePanel(53);
                break;
            case(2):
                manager.choosePanel(52);
                break;
            case(3):
                manager.choosePanel(51);
                break;
            case(4): 
                manager.choosePanel(54);
                break;
            case(5):
                JOptionPane.showMessageDialog(Manager.getPerPage(),
                        "Информация по спортивным балтам доступна " +
                        "для редактирования только в таблице!",
                        "Внимание!", JOptionPane.WARNING_MESSAGE);
                break;
        }
    }    
}
