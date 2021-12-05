/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javacards;



import java.awt.Color;
import studijosKTU.ScreenKTU;

/**
 *
 * @author Tadas PC
 */
public class Card {
    
    private final Color color;
    private final int value;
    private boolean faceUp;
    private boolean weWon;

    Card(Color color, int value) {
        this.color = color;
        this.value = value;
        this.faceUp = false;
        this.weWon = false;
    }
    
    public void show(ScreenKTU scr, int row, int col) {
        int r = row * 4 + 1;  // kortą sudaro 4x4 simboliai (kartu su tarpu)
        int c = col * 4 + 1;
        scr.setColors(Color.white, Color.black);
        scr.fillRect(1, 9, 5, 28);      // pagrindas bus baltas
        scr.lineBorder(1, 9, 5, 28, 3); // pakraščio linija
        scr.print(2, 10, "Pasirinkite viena is kortu");
        scr.print(3, 10, "esanciu kaireje puseje,kad");
        scr.print(4, 10, "pradetumete zaidima.");
        scr.print(11, 2, "Zaidimo rezultatas: ");
        scr.print(12, 2, "Nepradetas");
        
        if (faceUp) {   // jei korta atversta
            scr.setColors(Color.white, color);
            scr.fillRect(r, c, 3, 3);      // pagrindas bus baltas
            scr.lineBorder(r, c, 3, 3, 2); // pakraščio linija
            scr.print(r, c, value);
            if(value >= 10){
              scr.print(r + 2, c + 1, value);  
            }
            else
                scr.print(r + 2, c + 2, value);
            
        } else {           // jei korta užversta
            scr.setColors(Color.gray, Color.blue);
            scr.fillRect(r, c, 3, 3, '\u2593');
        }
    }
    
    public void printResult(ScreenKTU scr) {
        if (weWon == true) {
            scr.setColors(Color.green, Color.black);
            scr.print(12, 2, "*Laimejote!*");            
        } 
        else if(weWon == false){
            scr.setColors(Color.red, Color.black);
            scr.print(12, 2, "Pralaimejote");
        }
        scr.print(14, 1, "Paspauskite 'r', o po to ");
        scr.print(15, 1, "'n' kad pradetumete nauja zaidima. ");
        
    }
    
    public int getValue() {
        return value;
    }
    
    public Color getColor() {
        return color;
    }
    
    public boolean getFace() {
        return faceUp;
    }
    
    public boolean getStatus(){
        return weWon;
    }
    
    public void reverseFace() {
        faceUp = !faceUp;
    }
    
    public void weWon(){
        weWon = true;
    } 
    
}
