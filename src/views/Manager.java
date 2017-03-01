/*VALUES OF THE 'CURRENT PANEL':
0  - START PAGE
10 - ORGANIZATION PAGE
20 - EMPLOYEE PAGE
30 - ATHLETE PAGE
40 - PERFORMANE PAGE
50 - COMPETITION PAGE
60 - TESTING PAGE
*/

package views;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;

public class Manager {
    
    private static Manager ManagerInstance = null;
    
    private MainFrame mFrame = null;
    private StartPage stPage = null;
    private OrganizationPage orgPage = null;
    //private EmployeePage empPage = null;
    
    private static int width;
    private static int height;
    private static int insetsBottom;
           
    private Manager() { 
        width = getResolution().width;
        height = getResolution().height;
        mFrame = new MainFrame();
        insetsBottom = mFrame.getInsetBottom();
        createStartPage();     
        mFrame.setManager(this);
    }    
    public static Manager getManagerInstance() {
        if (ManagerInstance == null)
            ManagerInstance = new Manager();
        return ManagerInstance;
    }
      
    //GET_SCREEN_RESOLUTION*****************************************************
    private Dimension getResolution() {
      return Toolkit.getDefaultToolkit().getScreenSize();   
    }
    public static int getWidth() {
        return width;
    }
    public static int getHeight() {
        return height;
    }
    public static int getHeightWithInsets() {
        return (height - insetsBottom);
    }
    
    //START_PAGE****************************************************************
    private void createStartPage(){
        stPage = new StartPage();
        stPage.setManager(this);
        mFrame.getContentPane().add(stPage, BorderLayout.CENTER); 
        mFrame.setVisible(true);
    }
    
    //ORGANIZATION_PAGE*********************************************************
     private void createOrganizationPage(){
        orgPage = new OrganizationPage();
        mFrame.getContentPane().add(orgPage, BorderLayout.CENTER);
    }
    
    //CHOOSE_PANELS*************************************************************
    public void choosePanel(int currentNumber) {
        hideAllPanels();
        switch(currentNumber) {
            case(0):
                stPage.setVisible(true);
                break;  
            case(10):
                if (orgPage == null) {
                    createOrganizationPage();
                }
                orgPage.setVisible(true);
                break;
            case(20):
                break;
        }
    }
    private void hideAllPanels() {
        if (stPage != null) stPage.setVisible(false);
        if (orgPage != null) orgPage.setVisible(false);
    }   
}
