package views;

import lombok.extern.slf4j.Slf4j;

import java.awt.BorderLayout;
import java.awt.Toolkit;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.JFrame;

@Slf4j
public class MainFrame extends JFrame {  
    
    private ImagePanel imgPanel; 
    
    public MainFrame() {         
        super("CascadeApp");         
        setMainFrame(imgPanel); 
    }
    
    //main frame settings
    private void setMainFrame (ImagePanel imgPnl) {
        this.setContentPane(setImagePanel(imgPnl));         
        this.setSize(Manager.getWidth(), 
                    (Manager.getHeight() - getInsetBottom()));
        this.setLocation(0, 0);
        this.setVisible(true);
        this.setLocationRelativeTo(null);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);       
    }
    //imagePanel settings
    private ImagePanel setImagePanel(ImagePanel imgPnl) {
        imgPnl = new ImagePanel();        
        try(InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("images/13.jpg")) {
            imgPnl.setImage(ImageIO.read(inputStream));
        } catch (IOException ex) {
            log.debug("no image", ex);
        }
        imgPnl.setLayout(new BorderLayout());
        imgPnl.setOpaque(true);
        imgPnl.setVisible(true);
        return imgPnl;
    }
        
    //get frame inserts
    //frame border + taskBar
    public int getInsetBottom() {
        return (Toolkit.getDefaultToolkit().
                getScreenInsets(getGraphicsConfiguration()).bottom
                + getInsets().bottom 
                + getInsets().top);
    } 
    //left + right
    public int getInsetLeftRight() {
        return (this.getInsets().left*2);
    }    
}
