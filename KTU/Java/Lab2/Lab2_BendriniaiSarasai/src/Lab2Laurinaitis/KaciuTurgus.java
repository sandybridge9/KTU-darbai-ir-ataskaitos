/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Lab2Laurinaitis;

import studijosKTU.*;

public class KaciuTurgus {

    public ListKTUx<Kate> visosKates = new ListKTUx<>(new Kate());
    private static final Kate bazinisEgz = new Kate();

    // suformuojamas sąrašas kaciu, kuriu amzius yra tarp nustatytu ribu
    public ListKTUx<Kate> atrinktiTinkamasKates(double minRiba, double maxRiba) {
        ListKTUx<Kate> tinkamosKates = new ListKTUx<>(bazinisEgz);
        for (Kate k : visosKates) {
            if (k.getAmzius() >= minRiba && k.getAmzius() <= maxRiba) {
                tinkamosKates.add(k);
            }
        }
        return tinkamosKates;
    }
    
    // suformuojamas sąrašas automobilių, kurių kaina yra tarp ribų
    public ListKTUx<Kate> atrinktiPagalKainą(int riba1, int riba2) {
        ListKTUx<Kate> atitinkanciosKates = new ListKTUx(bazinisEgz);
        for (Kate k : visosKates) {
            if (k.getKaina() >= riba1 && k.getKaina() <= riba2) {
                atitinkanciosKates.add(k);
            }
        }
        return atitinkanciosKates;
    }
    // suformuojamas sąrašas automobilių, turinčių max kainą
    public ListKTUx<Kate> maksimaliosKainosKates() {
        ListKTUx<Kate> brangiausiosKates = new ListKTUx(bazinisEgz);
        // formuojamas sąrašas su maksimalia reikšme vienos peržiūros metu
        double maxKaina = 0;
        for (Kate a : visosKates) {
            double kaina = a.getKaina();
            if (kaina >= maxKaina) {
                if (kaina > maxKaina) {
                    brangiausiosKates.clear();
                    maxKaina = kaina;
                }
                brangiausiosKates.add(a);
            }
        }
        return brangiausiosKates;
    }
    // metodo main nėra -> demo bandymai klasėje AutomobiliuBandymai
}
