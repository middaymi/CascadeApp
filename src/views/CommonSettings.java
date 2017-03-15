package views;

import java.awt.Color;
import java.awt.Font;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.border.LineBorder;

public class CommonSettings {
    
    private static LineBorder  lightGrayLineBorder = null; 
    private static LineBorder  grayLineBorder = null;     
    private static Font font30 = null;
    private static Font font50 = null;
        
    //COMMON_SETTINGS_FOR_PANELS
    public static void panelSettings(JPanel pnl) {
        pnl.setLayout(null);
        pnl.setSize(Manager.getWidthWithInsets(), 
                    Manager.getHeightWithInsets());
        pnl.setOpaque(false);       
    }
    
    //FONTS
    public static <T extends JComponent> void settingFont50 (T obj) {
        obj.setFont(font50Instance());
    } 
     public static <T extends JComponent> void settingFont30 (T obj) {
        obj.setFont(font30Instance());
    }
    
    //BORDERS
    public static <T extends JComponent> void settingLightGrayBorder (T obj) {        
        obj.setBorder(lightGrayLineBorderInstance());
    }
    public static <T extends JComponent> void settingGrayBorder (T obj) {        
        obj.setBorder(grayLineBorderInstance());
    }
     
    //PRIVATE_FUNCTIONS
    //set grayLineBoard
    private static LineBorder lightGrayLineBorderInstance() {
        if (lightGrayLineBorder == null)
            lightGrayLineBorder = new LineBorder(Color.LIGHT_GRAY, 
                                      (int)(0.00125 * Manager.getWidth()));
        return lightGrayLineBorder;        
    }
    private static LineBorder grayLineBorderInstance() {
        if (grayLineBorder == null)
            grayLineBorder = new LineBorder(Color.GRAY, 
                                 (int)(0.00125 * Manager.getWidth()));
        return grayLineBorder;        
    }
    
    private static Font font30Instance() {
        if (font30 == null)
            font30 = new Font("TimesNewRoman", Font.PLAIN, 
                             (3*Manager.getWidth()/320));
        return font30;
    }
     private static Font font50Instance() {
        if (font50 == null)
            font50 = new Font("TimesNewRoman", Font.PLAIN, 
                             (Manager.getWidth()/64));
        return font50;
    }
}
