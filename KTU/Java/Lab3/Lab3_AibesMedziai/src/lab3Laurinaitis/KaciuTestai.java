/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab3Laurinaitis;
import laborai.studijosktu.Ks;
import laborai.studijosktu.AvlSetKTUx;
import laborai.studijosktu.SortedSetADTx;
import laborai.studijosktu.SetADT;
import laborai.studijosktu.BstSetKTUx;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.Locale;

public class KaciuTestai {

    static Kate[] katesBaze;
    static SortedSetADTx<Kate> aSerija = new BstSetKTUx(new Kate(), Kate.pagalKaina);

    public static void main(String[] args) throws CloneNotSupportedException {
        Locale.setDefault(Locale.US); // Suvienodiname skaičių formatus
        aibėsTestas();
    }

    static SortedSetADTx generuotiAibe(int kiekis, int generN) {
        katesBaze = new Kate[generN];
        for (int i = 0; i < generN; i++) {
            katesBaze[i] = new Kate.Builder().buildRandom();
        }
        Collections.shuffle(Arrays.asList(katesBaze));
        aSerija.clear();
        for (int i = 0; i < kiekis; i++) {
            aSerija.add(katesBaze[i]);
        }
        return aSerija;
    }

    public static void aibėsTestas() throws CloneNotSupportedException {
        Kate a1 = new Kate("Mikis", "Bengalas", "Vyr", 4, 4500);
        Kate a2 = new Kate.Builder()
                .vardas("Jonas")
                .veisle("Abisinija")
                .lytis("Vyr")
                .kaina(3500)
                .build();
        Kate a3 = new Kate.Builder().buildRandom();
        Kate a4 = new Kate("Angel Sfinksas Mot 2 12500");
        Kate a5 = new Kate("Sniege Sfinksas Mot 3 3500");
        Kate a6 = new Kate("Julia Abisinija Mot 4 500");
        Kate a7 = new Kate("Mole Sfinksas Mot 5 2500");
        Kate a8 = new Kate("Juode Abisinija Mot 6 7800");
        Kate a9 = new Kate("Prisma Sfinksas Mot 10 3600");

        Kate[] kaciuMasyvas = {a9, a7, a8, a5, a1, a6};

        Ks.oun("Kaciu aibe: ");
        SortedSetADTx<Kate> kaciuAibe = new BstSetKTUx(new Kate());

        for (Kate a : kaciuMasyvas) {
            kaciuAibe.add(a);
            Ks.oun("Aibė papildoma: " + a + ". Jos dydis: " + kaciuAibe.size());
        }
        Ks.oun("");
        Ks.oun(kaciuAibe.toVisualizedString(""));

        SortedSetADTx<Kate> kaciuAibeKopija
                = (SortedSetADTx<Kate>) kaciuAibe.clone();

        kaciuAibeKopija.add(a2);
        kaciuAibeKopija.add(a3);
        kaciuAibeKopija.add(a4);
        Ks.oun("Papildyta kaciu aibės kopija:");
        Ks.oun(kaciuAibeKopija.toVisualizedString(""));

        a9.setKaina(10000);

        Ks.oun("Originalas:");
        Ks.ounn(kaciuAibe.toVisualizedString(""));

        Ks.oun("Ar elementai egzistuoja aibėje?");
        for (Kate a : kaciuMasyvas) {
            Ks.oun(a + ": " + kaciuAibe.contains(a));
        }
        Ks.oun(a2 + ": " + kaciuAibe.contains(a2));
        Ks.oun(a3 + ": " + kaciuAibe.contains(a3));
        Ks.oun(a4 + ": " + kaciuAibe.contains(a4));
        Ks.oun("");

        Ks.oun("Ar elementai egzistuoja aibės kopijoje?");
        for (Kate a : kaciuMasyvas) {
            Ks.oun(a + ": " + kaciuAibeKopija.contains(a));
        }
        Ks.oun(a2 + ": " + kaciuAibeKopija.contains(a2));
        Ks.oun(a3 + ": " + kaciuAibeKopija.contains(a3));
        Ks.oun(a4 + ": " + kaciuAibeKopija.contains(a4));
        Ks.oun("");

        Ks.oun("Elementų šalinimas iš kopijos. Aibės dydis prieš šalinimą:  " + kaciuAibeKopija.size());
        for (Kate a : new Kate[]{a2, a1, a9, a8, a5, a3, a4, a2, a7, a6, a7, a9}) {
            kaciuAibeKopija.remove(a);
            Ks.oun("Iš kaciu aibės kopijos pašalinama: " + a + ". Jos dydis: " + kaciuAibeKopija.size());
        }
        Ks.oun("");

        Ks.oun("Kaciu aibė su iteratoriumi:");
        Ks.oun("");
        for (Kate a : kaciuAibe) {
            Ks.oun(a);
        }
        Ks.oun("");
        Ks.oun("Kaciu aibė AVL-medyje:");
        SortedSetADTx<Kate> kaciuAibe3 = new AvlSetKTUx(new Kate());
        for (Kate a : kaciuMasyvas) {
            kaciuAibe3.add(a);
        }
        Ks.ounn(kaciuAibe3.toVisualizedString(""));

        Ks.oun("Kaciu aibė su iteratoriumi:");
        Ks.oun("");
        for (Kate a : kaciuAibe3) {
            Ks.oun(a);
        }

        Ks.oun("");
        Ks.oun("Kaciu aibė su atvirkštiniu iteratoriumi:");
        Ks.oun("");
        Iterator iter = kaciuAibe3.descendingIterator();
        while (iter.hasNext()) {
            Ks.oun(iter.next());
        }

        Ks.oun("");
        Ks.oun("Kaciu aibės toString() metodas:");
        Ks.ounn(kaciuAibe3);

        // Išvalome ir suformuojame aibes skaitydami iš failo
        kaciuAibe.clear();
        kaciuAibe3.clear();

        Ks.oun("");
        Ks.oun("Automobilių aibė DP-medyje:");
        kaciuAibe.load("Duomenys\\kaciuduomenys.txt");
        Ks.ounn(kaciuAibe.toVisualizedString(""));
        Ks.oun("Išsiaiškinkite, kodėl medis augo tik į vieną pusę.");

        Ks.oun("");
        Ks.oun("Automobilių aibė AVL-medyje:");
        kaciuAibe3.load("Duomenys\\kaciuduomenys.txt");
        Ks.ounn(kaciuAibe3.toVisualizedString(""));

        SetADT<String> autoAibe4 = KaciuApskaita.kaciuVeisles(kaciuMasyvas);
        Ks.oun("Pasikartojančios kaciu veisles:\n" + autoAibe4.toString());
    }
}
