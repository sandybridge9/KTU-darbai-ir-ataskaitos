package lab4Laurinaitis;

import laborai.studijosktu.MapKTUx;
import laborai.studijosktu.Ks;
import java.util.Locale;
import laborai.studijosktu.HashType;

public class KaciuTestai {

    public static void main(String[] args) {
        Locale.setDefault(Locale.US); // suvienodiname skaičių formatus
        atvaizdzioTestas();
        //greitaveikosTestas();
    }

    public static void atvaizdzioTestas() {
        Kate a1 = new Kate("Melga", "Abisinija", "Mot", 4, 500);
        Kate a2 = new Kate("Mole", "Sfinksas", "Mot", 5, 2500);
        Kate a3 = new Kate("Juode Abisinija Mot 6 7800");
        Kate a4 = new Kate("Prisma Sfinksas Mot 10 3600");
        Kate a5 = new Kate.Builder().buildRandom();
        Kate a6 = new Kate("Julia Abisinija Mot 4 500");
        Kate a7 = new Kate("Mole Sfinksas Mot 5 2500");

        // Raktų masyvas
        String[] kaciuId = {"TA156", "TA102", "TA178", "TA171", "TA105", "TA106", "TA107", "TA108"};
        int id = 0;
        MapKTUx<String, Kate> atvaizdis
                = new MapKTUx(new String(), new Kate(), HashType.DIVISION);
        // Reikšmių masyvas
        Kate[] auto = {a1, a2, a3, a4, a5, a6, a7};
        for (Kate a : auto) {
            atvaizdis.put(kaciuId[id++], a);
        }
        atvaizdis.println("Porų išsidėstymas atvaizdyje pagal raktus");
        Ks.oun("Ar egzistuoja pora atvaizdyje?");
        Ks.oun(atvaizdis.contains(kaciuId[6]));
        Ks.oun(atvaizdis.contains(kaciuId[7]));
        Ks.oun("Pašalinamos poros iš atvaizdžio:");
        Ks.oun(atvaizdis.remove(kaciuId[1]));
        Ks.oun(atvaizdis.remove(kaciuId[7]));
        atvaizdis.println("Porų išsidėstymas atvaizdyje pagal raktus");
        Ks.oun("Atliekame porų paiešką atvaizdyje:");
        Ks.oun(atvaizdis.get(kaciuId[2]));
        Ks.oun(atvaizdis.get(kaciuId[7]));
        Ks.oun("Išspausdiname atvaizdžio poras String eilute:");
        Ks.ounn(atvaizdis);
    }
    /*
    //Konsoliniame režime
    private static void greitaveikosTestas() {
        System.out.println("Greitaveikos tyrimas:\n");
        GreitaveikosTyrimas gt = new GreitaveikosTyrimas();
        //Šioje gijoje atliekamas greitaveikos tyrimas
        new Thread(() -> gt.pradetiTyrima(),
                "Greitaveikos_tyrimo_gija").start();
        try {
            String result;
            while (!(result = gt.getResultsLogger().take())
                    .equals(GreitaveikosTyrimas.FINISH_COMMAND)) {
                System.out.println(result);
                gt.getSemaphore().release();
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        gt.getSemaphore().release();
    }
    */
}
