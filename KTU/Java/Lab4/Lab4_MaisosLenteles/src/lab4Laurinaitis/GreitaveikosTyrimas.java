/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4Laurinaitis;

import java.util.HashMap;
import java.util.HashSet;
import laborai.studijosktu.HashType;
import laborai.studijosktu.MapKTUx;
import laborai.gui.MyException;
import java.util.LinkedList;
import java.util.Queue;
import java.util.ResourceBundle;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.SynchronousQueue;
import laborai.demo.Timekeeper;

public class GreitaveikosTyrimas {

    public static final String FINISH_COMMAND = "finishCommand";
    private static final ResourceBundle MESSAGES = ResourceBundle.getBundle("laborai.gui.messages");

    private final BlockingQueue resultsLogger = new SynchronousQueue();
    private final Semaphore semaphore = new Semaphore(-1);
    private final Timekeeper tk;

    private final String[] TYRIMU_VARDAI = {"put", "contains"};
    private final int[] TIRIAMI_KIEKIAI = {10000, 20000, 40000, 80000};

    private final MapKTUx<String, Kate> kaciuAtvaizdis1KTU = new MapKTUx(new String(), new Kate(), 10, 0.75f, HashType.DIVISION);
    private final MapKTUx<String, Kate> kaciuAtvaizdis2KTU = new MapKTUx(new String(), new Kate(), 10, 0.25f, HashType.DIVISION);
    private final Queue<String> chainsSizes = new LinkedList<>();

    public GreitaveikosTyrimas() {
        semaphore.release();
        tk = new Timekeeper(TIRIAMI_KIEKIAI, resultsLogger, semaphore);
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
            chainsSizes.add(MESSAGES.getString("msg4"));
            chainsSizes.add("   kiekis      " + TYRIMU_VARDAI[0] + "   " + TYRIMU_VARDAI[1]);
            for (int k : TIRIAMI_KIEKIAI) {
                //MapKTUOA<String, Kate> kaciuAtvaizdisOA = new MapKTUOA(k);
                Kate[] autoArray = KaciuGamyba.gamintiKates(k);
                String[] autoIdArray = KaciuGamyba.gamintiKaciuIds(k);
                HashMap<String, Kate> kaciuAtvaizdis1Hash = new HashMap();
                kaciuAtvaizdis1KTU.clear();
                kaciuAtvaizdis2KTU.clear();
                tk.startAfterPause();
                tk.start();

                for (int i = 0; i < k; i++) {
                    kaciuAtvaizdis1KTU.put(autoIdArray[i], autoArray[i]);
                }
                tk.finish(TYRIMU_VARDAI[0]);

                //String str = "   " + k + "          " + kaciuAtvaizdis1KTU.getMaxChainSize();
                for (int i = 0; i < k; i++) {
                    kaciuAtvaizdis1Hash.put(autoIdArray[i], autoArray[i]);
                }
                tk.finish(TYRIMU_VARDAI[0]);

                //str += "         " + kaciuAtvaizdis1Hash.getMaxChainSize();
                //chainsSizes.add(str);
                /*
                for (int i = 0; i < k/10000; i++) {
                    kaciuAtvaizdisOA.put(autoIdArray[i], autoArray[i]);
                }
                tk.finish(TYRIMU_VARDAI[1]);

                for (int i = 0; i < k/10000; i++) {
                    kaciuAtvaizdis2KTU.put(autoIdArray[i], autoArray[i]);
                }

                tk.finish(TYRIMU_VARDAI[1]);
*/
                tk.seriesFinish();
            }

            //StringBuilder sb = new StringBuilder();
            //chainsSizes.stream().forEach(p -> sb.append(p).append(System.lineSeparator()));
            //tk.logResult(sb.toString());
            tk.logResult(FINISH_COMMAND);
        } catch (MyException e) {
            tk.logResult(e.getMessage());
        }
    }

    public BlockingQueue<String> getResultsLogger() {
        return resultsLogger;
    }

    public Semaphore getSemaphore() {
        return semaphore;
    }
}
