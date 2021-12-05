package lab4Laurinaitis;

import laborai.studijosktu.Ks;
import laborai.studijosktu.KTUable;
import java.time.LocalDate;
import java.util.InputMismatchException;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Random;
import java.util.Scanner;

public class Kate implements KTUable{
        
    // bendri duomenys visoms katems (visai klasei)
    final static private double minAmzius = 0.3;
    final static private double maxAmzius = 13;
    final static private double minKaina = 15;
    final static private double maxKaina = 32000;

    // kiekvieno automobilio individualūs duomenys
    private String vardas;
    private String veisle;
    private String lytis;
    private double amzius;
    private double kaina;

    
    public Kate(){
    }
    
    public Kate(String vardas, String veisle, String lytis,
            double amzius, double kaina){
        this.vardas = vardas;
        this.veisle = veisle;
        this.lytis = lytis;
        this.amzius = amzius;
        this.kaina = kaina;
        validate();
    }
    public Kate(String dataString){
        this.parse(dataString);
    }
    
    public Kate(Builder builder){
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
        assert (amzius < minAmzius || amzius > maxAmzius) :
                klaidosTipas = "Blogai nurodytas amzius; ";
        assert (kaina < minKaina || kaina > maxKaina) :
                klaidosTipas += "Kaina už leistinų ribų; ";
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
            validate();
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
        return vardas + "_" + veisle + "_" + lytis + ": " + amzius + " " + String.format("%4.1f", kaina);
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
    
    public void setKaina(double kaina) {
        this.kaina = kaina;
    }
    
    @Override
    public int hashCode(){
        return Objects.hash(vardas, veisle, lytis, amzius, kaina);
    }
    
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Kate other = (Kate) obj;
        if (!Objects.equals(this.vardas, other.vardas)) {
            return false;
        }
        if (!Objects.equals(this.veisle, other.veisle)) {
            return false;
        }
        if (!Objects.equals(this.lytis, other.lytis)) {
            return false;
        }
        if (this.amzius != other.amzius) {
            return false;
        }
        if (Double.doubleToLongBits(this.kaina) != Double.doubleToLongBits(other.kaina)) {
            return false;
        }
        return true;
    }
    
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
