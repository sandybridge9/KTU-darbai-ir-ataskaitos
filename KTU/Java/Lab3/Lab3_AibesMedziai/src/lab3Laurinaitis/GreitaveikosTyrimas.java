/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab3Laurinaitis;

/**
 *
 * @author Tadas PC
 */
import java.util.HashSet;
import laborai.studijosktu.BstSetKTUx2;
import laborai.studijosktu.AvlSetKTUx;
import laborai.studijosktu.SortedSetADTx;
import laborai.studijosktu.BstSetKTUx;
import laborai.gui.MyException;
import java.util.ResourceBundle;
import java.util.TreeSet;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.SynchronousQueue;
import laborai.demo.Timekeeper;

public class GreitaveikosTyrimas {

    public static final String FINISH_COMMAND = "finish";
    private static final ResourceBundle MESSAGES = ResourceBundle.getBundle("laborai.gui.messages");

    private static final String[] TYRIMU_VARDAI = {"remove", "containsAll"};
    private static final int[] TIRIAMI_KIEKIAI = {10000, 20000, 40000, 80000};

    private final BlockingQueue resultsLogger = new SynchronousQueue();
    private final Semaphore semaphore = new Semaphore(-1);
    private final Timekeeper tk;
    private final String[] errors;
/*
    private final SortedSetADTx<Automobilis> aSeries = new BstSetKTUx(new Automobilis(), Automobilis.pagalKaina);
    private final SortedSetADTx<Automobilis> aSeries2 = new BstSetKTUx2(new Automobilis());
    private final SortedSetADTx<Automobilis> aSeries3 = new AvlSetKTUx(new Automobilis());
*/
    private final TreeSet<Integer> pirmasTestas1 = new TreeSet<>();
    private final HashSet<Integer> pirmasTestas2 = new HashSet<>();
    private final TreeSet<Integer> antrasTestas1 = new TreeSet<>();
    private final HashSet<Integer> antrasTestas2 = new HashSet<>();
    
    public GreitaveikosTyrimas() {
        semaphore.release();
        tk = new Timekeeper(TIRIAMI_KIEKIAI, resultsLogger, semaphore);
        errors = new String[]{
            MESSAGES.getString("error1"),
            MESSAGES.getString("error2"),
            MESSAGES.getString("error3"),
            MESSAGES.getString("error4")
        };
    }

    public void pradetiTyrima() {
        try {
            SisteminisTyrimas();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    public void SisteminisTyrimas() throws InterruptedException {
        try {
            for (int k : TIRIAMI_KIEKIAI) {
                pirmasTestas1.clear();
                pirmasTestas2.clear();
                antrasTestas1.clear();
                antrasTestas2.clear();
                for(int i = 0; i < k; i++){
                   pirmasTestas1.add(i);
                   pirmasTestas2.add(i);
                   antrasTestas1.add(i);
                   antrasTestas2.add(i);
                }
                TreeSet<Integer> antras1 =  antrasTestas1;
                HashSet<Integer> antras2 = antrasTestas2;
                tk.startAfterPause();
                tk.start();
                for (int a : antras1) {
                    pirmasTestas1.remove(a);
                }
                tk.finish(TYRIMU_VARDAI[0]);
                for (int a : antras2) {
                    pirmasTestas2.remove(a);
                }
                tk.finish(TYRIMU_VARDAI[0]);
                
                antrasTestas1.containsAll(antras1);
                tk.finish(TYRIMU_VARDAI[1]);
                antrasTestas2.containsAll(antras2);
                tk.finish(TYRIMU_VARDAI[1]);
                tk.seriesFinish();
            }
            tk.logResult(FINISH_COMMAND);
        } catch (MyException e) {
            if (e.getCode() >= 0 && e.getCode() <= 3) {
                tk.logResult(errors[e.getCode()] + ": " + e.getMessage());
            } else if (e.getCode() == 4) {
                tk.logResult(MESSAGES.getString("msg3"));
            } else {
                tk.logResult(e.getMessage());
            }
        }
    }

    public BlockingQueue<String> getResultsLogger() {
        return resultsLogger;
    }

    public Semaphore getSemaphore() {
        return semaphore;
    }
}
