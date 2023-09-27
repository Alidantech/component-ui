//Exam3_1.java
//A simple JLabel in a JPanel container
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
public class Exam3_1 extends JPanel {
private JLabel l = new JLabel("A simple JLabel with raised
border");
private int width=200, height=100;
public Exam3_1() {
setSize(width, height);
setBackground(Color.green);
l.setFont(new Font("TimesNewRoman", Font.BOLD, 20));
l.setForeground(Color.red);
l.setBorder(BorderFactory.createRaisedBevelBorder());
add(l);
}
public static void main(String args[]) {
Exam3_1 ex = new Exam3_1();
JFrame jf = new JFrame("Testing JLabel ... ");
jf.getContentPane().add(ex, BorderLayout.CENTER);
jf.addWindowListener(
new WindowAdapter() {
public void windowClosing(WindowEvent e) {
System.exit(0);
}
});
jf.setSize(ex.getPreferredSize().width + 20,
ex.getPreferredSize().height + 40);
jf.setVisible(true);
}
}