package views;

import java.awt.BorderLayout;
import java.awt.Toolkit;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.JButton;
import javax.swing.JFrame;

public class MainFrame extends JFrame {  
    
    private ImagePanel imgPanel; 
    private JButton settingBtn;
    private JButton jumpToMainFrameBtn;
    private Manager manager;
    
    public MainFrame() {         
        super("CascadeApp");         
        setMainFrame(imgPanel);       
        setSettingBtn(settingBtn); 
        setJumpBtn(jumpToMainFrameBtn);
    }
    
    //main frame settings
    private void setMainFrame (ImagePanel imgPnl) {
        this.setContentPane(setImagePanel(imgPnl));         
        this.setSize(Manager.getWidth(), 
                    (Manager.getHeight() - getInsetBottom()));
        this.setLocation(0, 0);
        this.setLocationRelativeTo(null);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);       
    }
    //imagePanel settings
    private ImagePanel setImagePanel(ImagePanel imgPnl) {
        imgPnl = new ImagePanel();        
        try {   
            imgPnl.setImage(ImageIO.read
                           (new File("images\\5.jpg")));
        } catch (IOException ex) {
            Logger.getLogger(MainFrame.class.getName()).
                             log(Level.SEVERE, null, ex);
        }
        imgPnl.setLayout(new BorderLayout());
        imgPnl.setOpaque(true);
        imgPnl.setVisible(true);
        return imgPnl;
    }
    //setting button
    private void setSettingBtn (JButton btn) {
        btn = new JButton();
        btn.setSize(Manager.getWidth()/32, 
                    Manager.getHeightWithInsets()/18);
        btn.setLocation(303*Manager.getWidth()/320, 
                        302*(Manager.getHeight() - getInsetBottom())/349);
        this.add(btn);
    } 
    //setting button for jump to mainFrame
     private void setJumpBtn (JButton btn) {
        btn = new JButton();
        btn.setSize(Manager.getWidth()/32, 
                    Manager.getHeightWithInsets()/18);
        btn.setLocation(303*Manager.getWidth()/320, 
                        272*(Manager.getHeight() - getInsetBottom())/349);
        btn.addActionListener(new controllers.CommonButtons.JumpToMainFrameBtnListener());
        this.add(btn);
    }
     
    //get the bottom insert for real height of screen
    public int getInsetBottom() {
        return (Toolkit.getDefaultToolkit().
                getScreenInsets(getGraphicsConfiguration()).bottom); 
    }
    
    public void setManager(Manager manager) {
        this.manager = manager;
    }
}





