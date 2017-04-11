package views;

import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JScrollPane;

public class Scroll extends JScrollPane {
			
	@Override
	public void paint(Graphics g) { // Переопределяем метод paint
		Color b = this.getBackground();
		g.setColor(new Color(b.getRed(),b.getGreen(),b.getBlue(), 200)); // ставим полупрозрачный цвет
		g.fillRect(0, 0, getWidth(), getHeight());	//Рисуем поверхность этого цвета
		super.paint(g);	//рисуем всё оставшееся
	}	
}
