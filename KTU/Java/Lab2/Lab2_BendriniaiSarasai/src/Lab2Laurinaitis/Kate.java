/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Lab2Laurinaitis;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.InputMismatchException;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.Scanner;
import studijosKTU.*;

public class Kate implements KTUable<Kate> {
        
    // bendri duomenys visoms katems (visai klasei)
    final static private double minAmzius = 0.5;
    final static private double maxAmzius = 5;
    final static private double minKaina = 50;
    final static private double maxKaina = 32000;

    // kiekvieno automobilio individualūs duomenys
    private String vardas;
    private String veisle;
    private String lytis;
    private double amzius;
    private double kaina; 

    
    public Kate() { 
    }
    
    public Kate(String vardas, String veisle, String lytis, double amzius, double kaina){
        this.vardas = vardas;
        this.veisle = veisle;
        this.lytis = lytis;
        this.amzius = amzius;
        this.kaina = kaina;
    }
    public Kate(String dataString){
        this.parse(dataString);
    }
    @Override
    public Kate create(String dataString) {
        Kate a = new Kate();
        a.parse(dataString);
        return a;
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
        } catch (InputMismatchException  e) {
            Ks.ern("Blogas duomenų formatas apie kates -> " + dataString);
        } catch (NoSuchElementException e) {
            Ks.ern("Trūksta duomenų apie kates -> " + dataString);
        }
    }
    @Override
    public String validate() {
        String klaidosTipas = "";
        if (amzius < minAmzius || amzius > maxAmzius)
           klaidosTipas = "Netinkamas kates amzius, turi būti [" +
                   minAmzius + ":" + maxAmzius + "]";
        if (kaina < minKaina || kaina > maxKaina )
            klaidosTipas += " Kaina už leistinų ribų [" + minKaina +
                            ":" + maxKaina  + "]";
        return klaidosTipas;
    }
    
    @Override
    public String toString(){  // surenkama visa reikalinga informacija
        return String.format("%-10s| %-16s| %5s| %5s| %8s|",
               vardas, veisle, lytis, amzius, kaina, validate());
    };
    
    
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
    public void setKaina(double kaina) {
        this.kaina = kaina;
    }
    
    @Override
    public int compareTo(Kate a) { 
        // lyginame pagal svarbiausią požymį - kainą
        double kainaKita = a.getKaina();
        if (kaina < kainaKita) return -1;
        if (kaina > kainaKita) return +1;
        return 0;
    }
    
    // sarankiškai priderinkite prie Lambda funkcijų
    public final static Comparator<Kate> pagalVeisleVarda =
              new Comparator<Kate>() {
       @Override
       public int compare(Kate k1, Kate k2) {
          // pradžioje pagal veisles, o po to pagal vardus
          int cmp = k1.getVardas().compareTo(k2.getVardas());
          if(cmp != 0) return cmp;
          return k1.getVeisle().compareTo(k2.getVeisle());
       }
    };
    public final static Comparator pagalKainą = new Comparator() {
       // sarankiškai priderinkite prie generic interfeiso ir Lambda funkcijų
       @Override
       public int compare(Object o1, Object o2) {
          double k1 = ((Kate) o1).getKaina();
          double k2 = ((Kate) o2).getKaina();
          // didėjanti tvarka, pradedant nuo mažiausios
          if(k1<k2) return -1;
          if(k1>k2) return 1;
          return 0;
       }
    };
    public final static Comparator pagalMetusKainą = new Comparator() {
       // sarankiškai priderinkite prie generic interfeiso ir Lambda funkcijų
       @Override
       public int compare(Object o1, Object o2) {
          Kate a1 = (Kate) o1;
          Kate a2 = (Kate) o2;
          // metai mažėjančia tvarka, esant vienodiems lyginama kaina
          if(a1.getAmzius() < a2.getAmzius()) return 1;
          if(a1.getAmzius() > a2.getAmzius()) return -1;
          if(a1.getKaina() < a2.getKaina()) return 1;
          if(a1.getKaina() > a2.getKaina()) return -1;
          return 0;
       }
    };

    // metodas main = tiesiog paprastas pirminis automobilių išbandymas
    public static void main(String... args){
          // suvienodiname skaičių formatus pagal LT lokalę (10-ainis kablelis)
        Locale.setDefault(new Locale("LT")); 
        Kate a1 = new Kate("Smikis","Meskenas", "Vyr", 3.3,  477);
        Kate a2 = new Kate("Etiopija", "Trumpauodegis", "Mot", 2.3, 360);
        Kate a3 = new Kate();
        Kate a4 = new Kate();
        a3.parse("Morka Egzotas Mot 0.2 6500");
        a4.parse("Flopas Trumpauodegis Mot 2.3 36000");
        Ks.oun(a1);
        Ks.oun(a2);
        Ks.oun(a3);
        Ks.oun(a4);
    }    
}
