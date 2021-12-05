/** @author Eimutis Karčiauskas, KTU IF Programų inžinerijos katedra, 2013 09 02
 *
 * Tai yra demonstracinė klasė, atitinkanti elementarią C ar PASCAL programą.
 * Ji turi tik statinius metodus, kurių vykdymas pradedamas nuo main metodo.
   *  IŠBANDYKITE pirmąją Java programą.
   *  NUSTATYKITE klaidingus variantus, pataisykite klaidas.
   *  PAPILDYKITE pasisveikinimo metodą kitomis kalbomis.
   *
   ****************************************************************************/

public class A_Labas {
    static void sveikintis(){
        System.out.println("LABAS pasauli ");
    }
    static void sveikintis(String kalba){
        String atsakymas = "Atsiprašau - nesupratau";
        switch(kalba){
            case "LTU": atsakymas = "Labas pasauli"; break;
            case "USA": atsakymas = "Hello WORLD";   break;
            case "SWE": atsakymas = "Hallå världen"; break;
            case "GRE": atsakymas = "Γεια κόσμος";   break;
            case "FRA": atsakymas = "Bonjour tout le monde"; break;  //<---- Truko break
            case "RUS": atsakymas = "привет мир"; break;
            case "ESP": atsakymas = "¡Buenos días!";
        }   
        System.out.println(atsakymas);
    }
    public static void main(String[] args) {
        sveikintis();
        sveikintis("GRE");
        sveikintis("ESP"); //nera tokio varianto
        sveikintis("FRA");   // kodėl ne taip, kur klaida? Nera "break;".
    }    
}
