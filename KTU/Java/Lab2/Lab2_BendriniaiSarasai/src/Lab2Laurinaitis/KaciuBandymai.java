/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Lab2Laurinaitis;

import java.util.Comparator;
import java.util.Locale;
import studijosKTU.Ks;
import studijosKTU.ListKTUx;

/**
 *
 * @author Tadas PC
 */
public class KaciuBandymai {
    ListKTUx<Kate> bandomieji = new ListKTUx<>(new Kate());

    void metodoParinkimas(){
        //tikrintiAtskirasKates();
        //formuotiKaciuSąrašą();
        //peržiūrėtiSąrašą();
        //papildytiSąrašą();
        //patikrintiTurgausApskaitą();
        patikrintiRikiavimą();
    }

    void tikrintiAtskirasKates() {
        Kate a1 = new Kate("Smikis","Meskenas", "Vyr", 3.3,  477);
        Kate a2 = new Kate("Etiopija", "Trumpauodegis", "Mot", 2.3, 360);
        Kate a3 = new Kate();
        Kate a4 = new Kate();
        Kate a5 = new Kate();
        a3.parse("Zogas Egzotas Vyr 1,8 496");
        a4.parse("Morka Egzotas Mot 0,6 700");
        a5.parse("Finas Sfinksas Vyr 3,2 1200");

        Ks.oun(a1);
        Ks.oun(a2);
        Ks.oun(a3);
        Ks.oun("Pirmų 3 kaciu amziaus vidurkis= "+
                (a1.getAmzius()+a2.getAmzius()+a3.getAmzius())/3);
        Ks.oun(a4);
        Ks.oun(a5);
        Ks.oun("Pirmu 5 kaciu kainų suma= "+
                (a1.getKaina() + a2.getKaina()+ a3.getKaina()+ a4.getKaina()+a5.getKaina()));
    }
    void formuotiKaciuSąrašą() {
        Kate a1 = new Kate("Cypas","Meskenas", "Vyr", 1.3,  477);
        Kate a2 = new Kate("Elnis","Meskenas", "Vyr", 2.3,  597);
        Kate a3 = new Kate("Nora","Meskenas", "Mot", 3.3,  702);
        bandomieji.add(a1);
        bandomieji.add(a2);
        bandomieji.add(a3);
        bandomieji.println("Pirmos 3 kates. ");
        bandomieji.add("Zogas Egzotas Vyr 1,8 496");
        bandomieji.add("Morka Egzotas Mot 0,6 700");
        bandomieji.add("Finas Sfinksas Vyr 3,2 1200");

        bandomieji.println("Visos 6 kates. ");
        bandomieji.forEach(System.out::println);
        Ks.oun("Pirmų 3 kaciu amziaus vidurkis= "+
                (bandomieji.get(0).getAmzius()+bandomieji.get(1).getAmzius()+
                 bandomieji.get(2).getAmzius())/3);

        Ks.oun("Kitų 3 kaciu kainų suma= "+
                (bandomieji.get(3).getKaina()+bandomieji.get(4).getKaina()+
                 bandomieji.get(5).getKaina()));
        // palaipsniui atidenkite sekančias eilutes ir išbandykite
//        bandomieji.add(0, new Kate("Mazda","6",2007,50000,27000));
//        bandomieji.add(6, new Kate("Hyundai","Lantra",1998,9500,777));
//        bandomieji.set(4, a3);
//        bandomieji.println("Po įterpimų");
//        bandomieji.remove(7);
//        bandomieji.remove(0);
//        bandomieji.println("Po išmetimų");
//        bandomieji.remove(0); bandomieji.remove(0); bandomieji.remove(0);
//        bandomieji.remove(0); bandomieji.remove(0); bandomieji.remove(0);
//        bandomieji.println("Po visų išmetimų");
//        bandomieji.remove(0);
//        bandomieji.println("Po visų išmetimų");
   }
    void peržiūrėtiSąrašą(){
        int sk=0;
        for (Kate a: bandomieji){
            if (a.getVeisle().compareTo("Meskenas")==0)
                sk++;
        }
        Ks.oun("Meino Meskeno veisles kaciu yra = "+sk);
    }
    void papildytiSąrašą(){
        for (int i=0; i<8; i++){
            bandomieji.add(new Kate("Santa", "Sfinksas",
                    "Vyr", (0.5 + 0.5*i), (100 + 200*i)));
        }
        bandomieji.add("Pilkis Egzotas Vyr 1.7 4964");
        bandomieji.add("Smikis Egzotas Vyr 1.9 492");
        bandomieji.add("Sigis Egzotas Vyr 1.4 497");
        bandomieji.add("Vikis Egzotas Vyr 1.6 959");
        bandomieji.println("Testuojamų Kaciu sąrašas");
        bandomieji.save("ban.txt");
    }
    void patikrintiTurgausApskaitą(){
        KaciuTurgus kTurgus = new KaciuTurgus();
        
        kTurgus.visosKates.load("kates.txt");
        kTurgus.visosKates.println("Bandomasis rinkinys");

        bandomieji = kTurgus.atrinktiTinkamasKates(1,2);
        bandomieji.println("Pradedant nuo 1m amziaus iki 2m amziaus");

        bandomieji = kTurgus.atrinktiPagalKainą(200, 20000);
        bandomieji.println("Kaina tarp 3000 ir 10000");

        bandomieji = kTurgus.maksimaliosKainosKates();
        bandomieji.println("Patys brangiausi");

        int sk=0;
        for (Kate a: bandomieji){
                sk++;    // testuojame ciklo veikimą
        }
        Ks.oun("Atitinkanciu kaciu kiekis = "+sk);
    }
    void patikrintiRikiavimą(){
        KaciuTurgus aps = new KaciuTurgus();

        aps.visosKates.load("kates.txt");
        Ks.oun("========"+aps.visosKates.get(0));
        aps.visosKates.println("Bandomasis rinkinys");
        aps.visosKates.sortBuble(Kate.pagalVeisleVarda);
        aps.visosKates.println("Rūšiavimas pagal varda ir veisle");
        aps.visosKates.sortBuble(Kate.pagalKainą);
        aps.visosKates.println("Rūšiavimas pagal kainą");
        aps.visosKates.sortBuble(Kate.pagalMetusKainą);
        aps.visosKates.println("Rūšiavimas pagal Metus ir Kainą");
        aps.visosKates.sortBuble();
        aps.visosKates.println("Rūšiavimas pagal compareTo - Kainą");
    }
    static Comparator tvarkaPagalAmziu = new Comparator() {
        @Override
        public int compare(Object o1, Object o2) {
            double r1 = ((Kate) o1).getAmzius();
            double r2 = ((Kate) o2).getAmzius();
            if(r1<r2) return 1;
            if(r1>r2) return -1;
            return 0;
        }
    };
    public static void main(String... args) {
          // suvienodiname skaičių formatus pagal LT lokalę (10-ainis kablelis)
        Locale.setDefault(new Locale("LT"));
        new KaciuBandymai().metodoParinkimas();
    }
}
