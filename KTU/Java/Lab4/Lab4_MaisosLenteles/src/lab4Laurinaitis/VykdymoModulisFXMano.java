/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4Laurinaitis;

import java.util.Locale;
import javafx.application.Application;
import javafx.stage.Stage;
//import laborai.gui.fx.Lab4WindowFX;
import laborai.gui.fx.Lab4WindowFX2;

public class VykdymoModulisFXMano extends Application {

    public static void main(String[] args) {
        VykdymoModulisFXMano.launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        Locale.setDefault(Locale.US); // Suvienodiname skaičių formatus 
        KaciuTestai.atvaizdzioTestas();
        setUserAgentStylesheet(STYLESHEET_MODENA);    //Nauja FX išvaizda
        //setUserAgentStylesheet(STYLESHEET_CASPIAN); //Sena FX išvaizda
        Lab4WindowFX2.createAndShowFXGUI(primaryStage);
    }
}
