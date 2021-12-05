/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab1laurinaitis;

/**Kaune vyksta atrankinis kompiuterinio žaidimo „League of Legends“ turnyras.
Žaidime dvi penkių žaidėjų komandos kovoja tarpusavyje valdydamos skirtingus čempionus,
siekdamos sunaikinti priešininkų bazės gilumoje stovintį „Nexus“. Duomenų faile pateikta
informacija apie pirmo rato dalyvius ir jų rezultatus: vardas, pavardė, komanda, pozicija, čempionas,
sunaikinimai(K), dalyvavimai sunaikinimuose(A).
 Raskite aktyviausią „Jungle“ pozicijoje žaidusį žaidėją. Žaidėjo aktyvumui palyginti
naudokite nužudymų ir dalyvavimų nužudymuose sumą (K+A).
 Raskite geriausiai bendradarbiavusią komandą (didžiausia bendra dalyvavimų nužudymuose
suma), komandos pavadinimą atspausdinkite ekrane.
 Sudarykite panaudotų čempionų sąrašą, čempionų pavadinimus surašykite į failą
„Čempionai.csv“.
 *
 * @author Tadas PC
 */
public class Player {
    
    private String name;
    private String team;
    private String position;
    private String champion;
    private int kills;
    private int assists;
    
    public Player(){   
    }
    
    public Player(String name, String team, String position, String champion, int kills, int assists){
        this.name = name;
        this.team = team;
        this.position = position;
        this.champion = champion;
        this.kills = kills;
        this.assists = assists;
    }
    
    public String getName(){
        return name;
    }
    
    public String getTeam(){
        return team;
    }
    
    public String getPosition(){
        return position;
    }
    
    public String getChampion(){
        return champion;
    }
    
    public int getKills(){
        return kills;
    }
    
    public int getAssists(){
        return assists;
    }
    
    
    
    
}
