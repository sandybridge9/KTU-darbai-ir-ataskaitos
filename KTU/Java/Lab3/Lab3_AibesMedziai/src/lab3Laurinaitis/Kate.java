/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab3Laurinaitis;

import laborai.studijosktu.KTUable;
import laborai.studijosktu.Ks;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.InputMismatchException;
import java.util.NoSuchElementException;
import java.util.Random;
import java.util.Scanner;

public class Kate implements KTUable<Kate>{
        
    // bendri duomenys visoms katems (visai klasei)
    final static private double minAmzius = 0.3;
    final static private double maxAmzius = 13;
    final static private double minKaina = 15;
    final static private double maxKaina = 32000;
    private static final String idCode = "Kate ";
    private static int serNr = 100;

    // kiekvieno automobilio individualūs duomenys
    private String vardas;
    private String veisle;
    private String lytis;
    private double amzius;
    private double kaina;
    private String katesNr;

    
    public Kate(){
        katesNr = idCode + (serNr++);
    }
    
    public Kate(String vardas, String veisle, String lytis, double amzius, double kaina){
        katesNr = idCode + (serNr++);
        this.vardas = vardas;
        this.veisle = veisle;
        this.lytis = lytis;
        this.amzius = amzius;
        this.kaina = kaina;
        validate();
    }
    public Kate(String dataString){
        katesNr = idCode + (serNr++);
        this.parse(dataString);
    }
    
    public Kate(Builder builder){
        katesNr = idCode + (serNr++);
        this.vardas = builder.vardas;
        this.veisle = builder.veisle;
        this.lytis = builder.lytis;
        this.amzius = builder.amzius;
        this.kaina = builder.kaina;
        validate();
    }
    
    @Override
    public Kate create(String dataString) {
        return new Kate(dataString);
    }
    
    @Override
    public String validate() {
        String klaidosTipas = "";
        if (amzius < minAmzius || amzius > maxAmzius){
           klaidosTipas = "Netinkamas kates amzius, turi būti [" +
                   minAmzius + ":" + maxAmzius + "]";
        }
        if (kaina < minKaina || kaina > maxKaina ){
            klaidosTipas += " Kaina už leistinų ribų [" + minKaina +
                            ":" + maxKaina  + "]";
        }
        return klaidosTipas;
    }
    
    @Override
    public final void parse(String dataString) {
        try {   // ed - tai elementarūs duomenys, atskirti tarpais
            Scanner ed = new Scanner(dataString);
            vardas   = ed.next();
            veisle = ed.next();
            lytis = ed.next();
            amzius = ed.nextDouble();
            kaina = ed.nextDouble();
            //validate();
        } catch (InputMismatchException  e) {
            Ks.ern("Blogas duomenų formatas apie kates -> " + dataString);
        } catch (NoSuchElementException e) {
            Ks.ern("Trūksta duomenų apie kates -> " + dataString);
        }
    }
    
    /*
    @Override
    public String toString(){  // surenkama visa reikalinga informacija
        return String.format("%-10s| %-16s| %5s| %5s| %8s|",
               vardas, veisle, lytis, amzius, kaina, validate());
    };
    */
    @Override
    public String toString() {  // papildyta su autoRegNr
        return getKatesNr() + "=" + vardas + "_" + veisle + "_" + lytis + ":" + amzius + " " + String.format("%4.1f", kaina);
    }
    
    
    public String getVardas() {
        return vardas;
    }
    public String getLytis() {
        return lytis;
    }
    public String getVeisle() {
        return veisle;
    }
    public double getAmzius() {
        return amzius;
    }
    public double getKaina() {
        return kaina;
    }
    public String getKatesNr(){
        return katesNr;
    }
    public void setKaina(double kaina) {
        this.kaina = kaina;
    }
    
    @Override
    public int compareTo(Kate a) { 
        return getKatesNr().compareTo(a.getKatesNr());
    }
    
    
    public static Comparator<Kate> pagalVarda = (Kate a1, Kate a2) -> a1.vardas.compareTo(a2.vardas);
    
    public static Comparator<Kate> pagalVeisle = (Kate a1, Kate a2) -> a1.veisle.compareTo(a2.veisle);

    public static Comparator<Kate> pagalKaina = (Kate a1, Kate a2) -> {
        if(a1.kaina < a2.kaina){
            return -1;
        }
        if(a1.kaina > a2.kaina){
            return 1;
        }
        return 0;
    };
    public static Comparator<Kate> pagalMetusKaina = (Kate a1, Kate a2) ->{
        if(a1.getAmzius() > a2.getAmzius()){
            return 1;
        }
        if(a1.getAmzius() < a2.getAmzius()){
            return -1;
        }
        if(a1.getKaina() > a2.getKaina()){
            return 1;
        }
        if(a1.getKaina() < a2.getKaina()){
            return -1;
        }
        return 0;
    };
    
    public static class Builder {

        private final static Random RANDOM = new Random();  // Atsitiktinių generatorius
        private final static String[] kVyrVardai = {"Sigis", "Morkus", "Bonifacas", "Giedrius", "Juodis", "Softis", "Azuolas"};
        private final static String[] kMotVardai = {"Kore", "Sniege", "Morka", "Selme", "Giedre", "Amelija", "Siva"};
        private final static String[] kVeisles = {"Meskenas", "Sfinksas", "Trumpaplauke", "Egzotas"};
        private final static String[] kLyt = {"Vyr","Mot"};

        private String vardas = "";
        private String veisle = "";
        private String lytis = "";
        private double amzius = -1;
        private double kaina = -1.0;

        public Kate build() {
            return new Kate(this);
        }

        public Kate buildRandom() {
            int pLyt = RANDOM.nextInt(kLyt.length);
            int pVeisle = RANDOM.nextInt(kVeisles.length);
            String vardas = "";
            if(pLyt == 0){
                int pVardas = RANDOM.nextInt(kVyrVardai.length);
                vardas = kVyrVardai[pVardas];
            }
            else{
                int pVardas = RANDOM.nextInt(kVyrVardai.length);
                vardas = kMotVardai[pVardas];
            }
            double kAmzius = RANDOM.nextInt(12-1)+1;
            double kKaina = RANDOM.nextInt(36000);
            return new Kate(vardas, kVeisles[pVeisle], kLyt[pLyt], kAmzius, kKaina);
        }

        public Builder vardas(String vardas) {
            this.vardas = vardas;
            return this;
        }

        public Builder veisle(String veisle) {
            this.veisle = veisle;
            return this;
        }

        public Builder lytis(String lytis) {
            this.lytis = lytis;
            return this;
        }

        public Builder amzius(double amzius) {
            this.amzius = amzius;
            return this;
        }

        public Builder kaina(double kaina) {
            this.kaina = kaina;
            return this;
        }
    }
}
