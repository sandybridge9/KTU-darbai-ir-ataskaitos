/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab3Laurinaitis;

import laborai.gui.MyException;
import java.util.Arrays;
import java.util.Collections;
import java.util.stream.Stream;

public class KaciuGamyba {

    private static Kate[] kates;
    private static int pradinisIndeksas = 0, galinisIndeksas = 0;
    private static boolean arPradzia = true;

    public static Kate[] generuoti(int kiekis) {
        kates = new Kate[kiekis];
        for (int i = 0; i < kiekis; i++) {
            kates[i] = new Kate.Builder().buildRandom();
        }
        return kates;
    }

    public static Kate[] generuotiIrIsmaisyti(int aibesDydis,
            double isbarstymoKoeficientas) throws MyException {
        return generuotiIrIsmaisyti(aibesDydis, aibesDydis, isbarstymoKoeficientas);
    }

    /**
     *
     * @param aibesDydis
     * @param aibesImtis
     * @param isbarstymoKoeficientas
     * @return Gražinamas aibesImtis ilgio masyvas
     * @throws MyException
     */
    public static Kate[] generuotiIrIsmaisyti(int aibesDydis,
            int aibesImtis, double isbarstymoKoeficientas) throws MyException {
        kates = generuoti(aibesDydis);
        return ismaisyti(kates, aibesImtis, isbarstymoKoeficientas);
    }

    // Galima paduoti masyvą išmaišymui iš išorės
    public static Kate[] ismaisyti(Kate[] kaciuBaze,
            int kiekis, double isbarstKoef) throws MyException {
        if (kaciuBaze == null) {
            throw new IllegalArgumentException("KaciuBaze yra null");
        }
        if (kiekis <= 0) {
            throw new MyException(String.valueOf(kiekis), 1);
        }
        if (kaciuBaze.length < kiekis) {
            throw new MyException(kaciuBaze.length + " >= " + kiekis, 2);
        }
        if ((isbarstKoef < 0) || (isbarstKoef > 1)) {
            throw new MyException(String.valueOf(isbarstKoef), 3);
        }

        int likusiuKiekis = kaciuBaze.length - kiekis;
        int pradziosIndeksas = (int) (likusiuKiekis * isbarstKoef / 2);

        Kate[] pradineKaciuImtis = Arrays.copyOfRange(kaciuBaze, pradziosIndeksas, pradziosIndeksas + kiekis);
        Kate[] likusiKaciuImtis = Stream
                .concat(Arrays.stream(Arrays.copyOfRange(kaciuBaze, 0, pradziosIndeksas)),
                        Arrays.stream(Arrays.copyOfRange(kaciuBaze, pradziosIndeksas + kiekis, kaciuBaze.length)))
                .toArray(Kate[]::new);

        Collections.shuffle(Arrays.asList(pradineKaciuImtis)
                .subList(0, (int) (pradineKaciuImtis.length * isbarstKoef)));
        Collections.shuffle(Arrays.asList(likusiKaciuImtis)
                .subList(0, (int) (likusiKaciuImtis.length * isbarstKoef)));

        KaciuGamyba.pradinisIndeksas = 0;
        galinisIndeksas = likusiKaciuImtis.length - 1;
        KaciuGamyba.kates = likusiKaciuImtis;
        return pradineKaciuImtis;
    }

    public static Kate gautiIsBazes() throws MyException {
        if ((galinisIndeksas - pradinisIndeksas) < 0) {
            throw new MyException(String.valueOf(galinisIndeksas - pradinisIndeksas), 4);
        }
        // Vieną kartą Kate imamas iš masyvo pradžios, kitą kartą - iš galo.     
        arPradzia = !arPradzia;
        return kates[arPradzia ? pradinisIndeksas++ : galinisIndeksas--];
    }
}
