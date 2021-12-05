package lab4Laurinaitis;

import laborai.gui.MyException;
import java.util.Arrays;
import java.util.Collections;
import java.util.stream.IntStream;

public class KaciuGamyba{

    private static final String ID_CODE = "Cat";      //  ***** nauja
    private static int serNr = 10000;               //  ***** nauja
    
    
    private Kate[] kates;
    private String[] raktai;
    private int kiekis = 0, idKiekis = 0;
    
    public KaciuGamyba(){
        
    }

    public static Kate[] gamintiKates(int kiekis) {
        Kate[] automobiliai = IntStream.range(0, kiekis)
                .mapToObj(i -> new Kate.Builder().buildRandom())
                .toArray(Kate[]::new);
        Collections.shuffle(Arrays.asList(automobiliai));
        return automobiliai;
    }

    public static String[] gamintiKaciuIds(int kiekis) {
        String[] raktai = IntStream.range(0, kiekis)
                .mapToObj(i -> ID_CODE + (serNr++))
                .toArray(String[]::new);
        Collections.shuffle(Arrays.asList(raktai));
        return raktai;
    }

    public Kate[] gamintiIrParduotiKates(int aibesDydis,
            int aibesImtis) throws MyException {
        if (aibesImtis > aibesDydis) {
            aibesImtis = aibesDydis;
        }
        kates = gamintiKates(aibesDydis);
        raktai = gamintiKaciuIds(aibesDydis);
        this.kiekis = aibesImtis;
        return Arrays.copyOf(kates, aibesImtis);
    }

    // Imamas po vienas elementas iš sugeneruoto masyvo. Kai elementai baigiasi sugeneruojama
    // nuosava situacija ir išmetamas pranešimas.
    public Kate parduotiKate() {
        if (kates == null) {
            throw new MyException("catsNotGenerated");
        }
        if (kiekis < kates.length) {
            return kates[kiekis++];
        } else {
            throw new MyException("allSetStoredToMap");
        }
    }

    public String gautiIsBazesKatesId() {
        if (raktai == null) {
            throw new MyException("catsIdsNotGenerated");
        }
        if (idKiekis >= raktai.length) {
            idKiekis = 0;
        }
        return raktai[idKiekis++];
    }
}
