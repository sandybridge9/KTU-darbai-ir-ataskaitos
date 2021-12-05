/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab1laurinaitis;

/**
 *
 * @author Tadas PC
 */
public class Lab1Laurinaitis {

    /**
     * @param args the command line arguments
     */
    static int playerCount = 10; //zaidime dalyvauja 10 zaideju (2 komandos po 5 zaidejus)
    
    //Pagrindinis metodas vykdantis visas kitas funkcijas
    public static void main(String[] args) {
        // TODO code application logic here
        Player[] players = getPlayers();
        Player[] junglers = getJunglers(players);
        Player bestJungler = mostActiveJungler(junglers);
        System.out.println("Aktyviausias jungle pozicijos zaidejas: " + bestJungler.getName());
        String[] champions = championsList(players);
        System.out.println("Championu Sarasas: ");
        for(String champ : champions){
            System.out.println(champ);
        }
        String bestTeam = bestTeam(players);
        System.out.println("Geriausia komanda " + bestTeam);
        
    }
    
    //Sudaro zaideju sarasa
    public static Player[] getPlayers(){
        
        Player[] players = new Player[playerCount];
        for(int i = 0; i < playerCount; i++){
          String name = String.valueOf(i+1);
          if(i <= 4){
              String team = "TSM";
              Player p = new Player(name, team, "Jungle", "Champion No. " + name, (i+1)*2, (i+1)*3);
              players[i] = p;
          }
          if(i > 4){
              String team = "CLG";
              Player p = new Player(name, team, "Mid", "Champion No. " + name, (i-2)*3, (i-1)*2);
              players[i] = p;
          }
        }
        return players;
    }
    
    //Gauna visus junglerius is players masyvo
    static Player[] getJunglers(Player[] players){
        
        Player[] junglers = new Player[playerCount];
        int count = 0;
        for(Player player : players){
            if("Jungle".equals(player.getPosition())){
                junglers[count] = player;
                count++;
            }
        }
        return junglers;
    }
    
    //Randa geriausia jungle pozicijos zaideja
    static Player mostActiveJungler(Player[] junglers){
        
        int maxKA = 0;
        Player bestJungler = null;
        
        for (Player jungler : junglers) {
            if(jungler != null){
                if ((jungler.getKills() + jungler.getAssists()) >= maxKA) {
                maxKA = jungler.getKills() + jungler.getAssists();
                bestJungler = jungler;
                }
            }
            
        }
        return bestJungler;
    }
    
    //Championu sarasas
    static String[] championsList(Player[] players){
        String[] champions = new String[playerCount];
        int count = 0;
        for(Player player : players){
            if(player != null){
                champions[count] = player.getChampion();
                count++;
            }
        }
        return champions;
    }
    
    //Randa geriausia komanda
    static String bestTeam(Player[] players){
        String team1 = players[0].getTeam();
        String team2 = "";
        String bestTeam = "";
        int team1KA = 0;
        int team2KA = 0;
        for(Player player : players){
            if(player.getTeam() == team1){
                team1KA = team1KA + player.getAssists() + player.getKills();
            }
            else{
                team2KA = team2KA + player.getAssists() + player.getKills();
                team2 = player.getTeam();
            }   
        }
        System.out.println("Pirmos komandos " + team1 +" visu Kills/Assists suma: " + team1KA);
        System.out.println("Antros komandos " + team2 +" visu Kills/Assists suma: " + team2KA);
        if(team1KA > team2KA){
            bestTeam = team1;
        }
        else
            bestTeam = team2;
        return bestTeam;
    }
    
}
