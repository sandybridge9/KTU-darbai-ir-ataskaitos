/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javacards;

import java.awt.Color;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import studijosKTU.ScreenKTU;

/**
 *
 * @author Tadas PC
 */
public class JavaCards extends ScreenKTU {
    
    static final private int cardsInLine = 2; 
    static final private int linesNum = 2;
    static private final Color[] colors = {Color.blue, Color.red, Color.green, Color.orange, Color.black, Color.pink};

    List<Card> deck = new ArrayList();

    JavaCards() {
        super(20, 15, linesNum*4 + 30, cardsInLine*4 + 30, ScreenKTU.Fonts.boldB);
    }
    
    public void generateCards(){
        Random r = new Random();
        for (int i = 0; i < cardsInLine; i++) {
            System.out.println("******* 1mas foras");
            for (int x = 0; x < linesNum; x++){
                System.out.println("******* 2as foras");
                int r1 = r.nextInt(6);
                int r2 = r.nextInt(100);
                Card card = new Card(colors[r1], r2);
                deck.add(card);
            } 
        }
    }
    
    public static void gameControl(JavaCards deck){
        deck.generateCards();
        deck.show();
    }
    
    @Override
    public void show() {
        int nr = 0;
        for (Card card : deck) 
            card.show(this, nr / cardsInLine, nr++ % cardsInLine);   // show all cards
        refresh(100);
    }
    
    @Override
    public void mouseClicked(MouseEvent e) {
        int r = e.getY() / (4 * cellH); // kortą sudaro 4x4 simboliai
        int c = e.getX() / (4 * cellW);
        System.out.println("X: " + e.getX());
        System.out.println("Y: " + e.getY());
        Card card = deck.get(r * cardsInLine + c);
        card.reverseFace();
        guessedRight(card);
        show();
        card.printResult(this);
        refresh(80);
    }
    
    @Override
    public void keyPressed(KeyEvent key) {
        if(key.getKeyChar() == 'r'){
            System.out.println("rrrrrrrrrrrrrrrrrrrr");
            this.clearAll(Color.blue);
            refresh();
        }
        else if(key.getKeyChar() == 'n'){
            System.out.println(" nn n n n nn ");
            JavaCards deck = new JavaCards();
            gameControl(deck);
        }
    }
    
    public boolean guessedRight(Card card){
        boolean win = true;
        if(card.getFace() == true){
            for(Card cardd : deck){
                if(win == true){
                   if(cardd.getValue() > card.getValue()){
                    win = false;
                    cardd.reverseFace();
                    }
                    else if(cardd.getValue() == card.getValue()){
                        if(card.getColor() == cardd.getColor()){
                            Random r = new Random();
                            int chance = r.nextInt(100);
                            if(chance > 50){
                            win = true;
                            }
                            else{
                                win = false;
                                cardd.reverseFace();
                            }
                                
                        }
                        else{
                            win = false;
                            cardd.reverseFace();
                        }
                    }
                    else{
                        win = true;
                    } 
                }
            }
        }
        if(win == true){
            card.weWon();
        }
        System.out.println(win);
        System.out.println(card.getStatus());
        return win;
    }
    
    
    public static void main(String[] args) {
        JavaCards deck = new JavaCards();
        gameControl(deck);
    }
    
}
