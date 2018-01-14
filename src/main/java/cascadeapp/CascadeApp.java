package cascadeapp;

/*VALUES OF THE 'CURRENT PANEL':
0 - START PAGE
10 - ORGANIZATION PAGE
20 - EMPLOYEE PAGE
30 - ATHLETE PAGE
40 - PERFORMANE PAGE
50 - COMPETITION PAGE
60 - TESTING PAGE
*/

import views.Manager;
import javax.swing.*;

public class CascadeApp {
    static Manager manager;
    public static void main(String[] args) {
            manager = Manager.getManagerInstance();
            System.out.println("WIDTH: " + Manager.getWidthWithInsets());
            System.out.println("HEIGHT: " + Manager.getHeightWithInsets());
            dataBase.DataBaseConnection.getInstanceDataBase();
    };
}







