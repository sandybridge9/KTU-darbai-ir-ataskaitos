using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Lab1Conso
{
    class Program
    {
        static void Main(string[] args)
        {
            string file = @"..\..\U3.txt";
            char[,] map = readMap(file, out int x, out int y, out int[] xDraugu, out int[] yDraugu, out int[] xSusitikimo, out int[] ySusitikimo, out int[] xPicerijos, out int[] yPicerijos);
            visuKeliones(map, xDraugu, yDraugu, xSusitikimo, ySusitikimo, xPicerijos, yPicerijos, out int xSus, out int ySus, out int xPic, out int yPic);
            spausdinimas(map, xDraugu, yDraugu, xSus, ySus, xPic, yPic);
        }

        static void visuKeliones(char[,] map, int[] xDraugu, int[] yDraugu, int[] xSusitikimo, int[] ySusitikimo, int[] xPicerijos, int[] yPicerijos, out int xSus, out int ySus, out int xPic, out int yPic) 
        {
            int shortestPath = 999;
            int currentPath;
            xSus = 0;
            ySus = 0;
            xPic = 0;
            yPic = 0;
            bool changed = false;
            for(int i = 0; i < xSusitikimo.Length; i++)
            {
                currentPath = 0;
                for(int j = 0; j < xDraugu.Length; j++)
                {
                    if (draugoKelione(xDraugu[j], yDraugu[j], xSusitikimo[i], ySusitikimo[i], out currentPath, map) == true)
                    {
                        currentPath += currentPath;
                    }
                    else
                        break;
                }
                if(currentPath < shortestPath && currentPath != 0)
                {
                    shortestPath = currentPath;
                    xSus = xSusitikimo[i];
                    ySus = ySusitikimo[i];
                    changed = true;
                }
            }
            int pizzaPath = 999;
            for (int i = 0; i < xPicerijos.Length; i++)
            {
                currentPath = 0;
                for(int j = 0; j < xDraugu.Length; j++)
                {
                    if(draugoKelione(xSus, ySus, xPicerijos[i], yPicerijos[i], out currentPath, map) == true && changed == true)
                    {
                        currentPath += currentPath;
                    }
                }
                if(currentPath < pizzaPath && currentPath != 0)
                {
                    pizzaPath = currentPath;
                    xPic = xPicerijos[i];
                    yPic = yPicerijos[i];
                }

            }
        }

        static char[,] readMap(string file, out int x, out int y, out int[] xDraugu, out int[] yDraugu, out int[] xSusitikimo, out int[] ySusitikimo, out int[] xPicerijos, out int[] yPicerijos)
        {
            using (StreamReader reader = new StreamReader(@file))
            {
                x = 0;
                y = 0;

                int count = 0;
                int count2 = 0;
                int count3 = 0;
                string line = reader.ReadLine();
                string[] koordinates = line.Split(' ');
                x = int.Parse(koordinates[0]);
                y = int.Parse(koordinates[1]);
                xDraugu = new int[x];
                yDraugu = new int[y];
                xSusitikimo = new int[x];
                ySusitikimo = new int[y];
                xPicerijos = new int[x];
                yPicerijos = new int[y];
                char[,] map = new char[x, y];
                for(int i = 0; i < y; i++)
                {
                    line = reader.ReadLine();
                    char[] ch = line.ToCharArray();
                    for(int j = 0; j < ch.Length; j++)
                    {
                        map[i, j] = ch[j];
                        if (ch[j] == 'D')
                        {
                            xDraugu[count] = j;
                            yDraugu[count] = i;
                            count++;
                        }
                        if (ch[j] == 'S')
                        {
                            xSusitikimo[count2] = j;
                            ySusitikimo[count2] = i;
                            count2++;
                        }
                        if(ch[j] == 'P')
                        {
                            xPicerijos[count3] = j;
                            yPicerijos[count3] = i;
                        }
                    }
                }
                return map;
            }
        }

        static bool draugoKelione(int currentX, int currentY, int goalX, int goalY, out int length, char[,] map)
        {
            length = 0;

            //pasiekia susitikimo vieta----------------------------------------------------------------------------------------------------------------------------
            if (currentX == goalX && currentY == goalY)
            {
                return true;
            }

            //kai vienoje x linijoje kaip ir susitikimo vieta------------------------------------------------------------------------------------------------------
            else if(currentX == goalX)
            {
                if(currentY != goalY)
                {
                    if(currentY < goalY) //kai zemiau negu susitikimo vieta
                    {
                        if(map[currentY + 1,currentX] != 'X' && map[currentY + 1, currentX] != 'P' && map[currentY + 1, currentX] != 0) //eina i virsu
                        {
                            length++;
                            draugoKelione(currentX, currentY + 1, goalX, goalY, out length, map);
                        }
                        else if(map[currentY + 1, currentX] == 'X' || map[currentY + 1, currentX] == 'P' || map[currentY + 1, currentX] == 0)
                        {
                            if(map[currentY, currentX + 1] != 'X' && map[currentY, currentX+1] != 'P' && map[currentY, currentX+1] != 0)
                            {
                                length++;
                                draugoKelione(currentX + 1, currentY, goalX, goalY, out length, map); //paeina i desine
                            }
                            else if(map[currentY, currentX + 1] == 'X' || map[currentY, currentX + 1] == 'P' || map[currentY, currentX + 1] == 0)
                            {
                                if (map[currentY, currentX - 1] != 'X' && map[currentY, currentX - 1] != 'P' && map[currentY, currentX - 1] != 0)
                                {
                                    length++;
                                    draugoKelione(currentX - 1, currentY, goalX, goalY, out length, map); //paeina i kaire
                                }
                                else if(map[currentY, currentX - 1] == 'X' && map[currentY, currentX - 1] == 'P' && map[currentY, currentX - 1] == 0)
                                {
                                    if (map[currentY - 1, currentX] != 'X' && map[currentY, currentX - 1] == 'P' && map[currentY, currentX - 1] == 0)
                                    {
                                        length++;
                                        draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i apacia
                                    }
                                    else
                                        return false; //akligatvis
                                }
                            }
                        }
                    }
                    if(currentY > goalY) //kai auksciau negu susitikimo vieta
                    {
                        if(map[currentY - 1, currentX] != 'X' && map[currentY - 1, currentX] != 'P' && map[currentY - 1, currentX] != 0)
                        {
                            length++;
                            draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i apacia
                        }
                        else if (map[currentY - 1, currentX] == 'X' || map[currentY - 1, currentX] == 'P' || map[currentY - 1, currentX] == 0)
                        {
                            if (map[currentY, currentX + 1] != 'X' && map[currentY, currentX + 1] != 'P' && map[currentY, currentX + 1] != 0)
                            {
                                length++;
                                draugoKelione(currentX + 1, currentY, goalX, goalY, out length, map); //paeina i desine
                            }
                            else if (map[currentY, currentX + 1] == 'X' || map[currentY, currentX + 1] == 'P' || map[currentY, currentX + 1] == 0)
                            {
                                if (map[currentY, currentX - 1] != 'X' && map[currentY, currentX - 1] != 'P' && map[currentY, currentX - 1] != 0)
                                {
                                    length++;
                                    draugoKelione(currentX - 1, currentY, goalX, goalY, out length, map); //paeina i kaire
                                }
                                else if (map[currentY, currentX - 1] == 'X' && map[currentY, currentX - 1] == 'P' && map[currentY, currentX - 1] == 0)
                                {
                                    if (map[currentY + 1, currentX] != 'X' && map[currentY + 1, currentX] == 'P' && map[currentY + 1, currentX] == 0)
                                    {
                                        length++;
                                        draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i virsu
                                    }
                                    else
                                        return false; //akligatvis
                                }
                            }
                        }
                    }
                }
            }

            //kai vienoje y linijoje kaip ir susitikimo vieta------------------------------------------------------------------------------------------------------
            else if (currentY == goalY)
            {
                if (currentX != goalX) //nebutinas
                {
                    if (currentX < goalX) //kai arciau negu susitikimo vieta
                    {
                        if (map[currentY, currentX + 1] != 'X' && map[currentY, currentX + 1] != 'P' && map[currentY, currentX + 1] != 0) //eina i virsu
                        {
                            length++;
                            draugoKelione(currentX + 1, currentY, goalX, goalY, out length, map); //eina i desine
                        }
                        else if (map[currentY, currentX + 1] == 'X' && map[currentY, currentX + 1] == 'P' && map[currentY, currentX + 1] == 0)
                        {
                            if (map[currentY - 1, currentX] != 'X' && map[currentY - 1, currentX] != 'P' && map[currentY - 1, currentX] != 0)
                            {
                                length++;
                                draugoKelione(currentX - 1, currentY, goalX, goalY, out length, map); //paeina i apacia
                            }
                            else if (map[currentY - 1, currentX] == 'X' || map[currentY - 1, currentX] == 'P' || map[currentY - 1, currentX] == 0)
                            {
                                if (map[currentY + 1, currentX] != 'X' && map[currentY + 1, currentX] != 'P' && map[currentY + 1, currentX] != 0)
                                {
                                    length++;
                                    draugoKelione(currentX, currentY + 1, goalX, goalY, out length, map); //paeina i virsu
                                }
                                else if (map[currentY + 1, currentX] == 'X' && map[currentY + 1, currentX] == 'P' && map[currentY + 1, currentX] == 0)
                                {
                                    if (map[currentY, currentX - 1] != 'X' && map[currentY, currentX - 1] == 'P' && map[currentY, currentX - 1] == 0)
                                    {
                                        length++;
                                        draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i kaire
                                    }
                                    else
                                        return false; //akligatvis
                                }
                            }
                        }
                    }
                    if (currentX > goalX) //kai toliau negu susitikimo vieta
                    {
                        if (map[currentY, currentX - 1] != 'X' && map[currentY, currentX - 1] != 'P' && map[currentY, currentX] != 0)
                        {
                            length++;
                            draugoKelione(currentX - 1, currentY, goalX, goalY, out length, map); //eina i kaire
                        }
                        else if (map[currentY, currentX - 1] == 'X' || map[currentY, currentX - 1] == 'P' || map[currentY, currentX - 1] == 0)
                        {
                            if (map[currentY + 1, currentX] != 'X' && map[currentY + 1, currentX] != 'P' && map[currentY + 1, currentX] != 0)
                            {
                                length++;
                                draugoKelione(currentX, currentY + 1, goalX, goalY, out length, map); //paeina i virsu
                            }
                            else if (map[currentY + 1, currentX] == 'X' || map[currentY + 1, currentX] == 'P' || map[currentY + 1, currentX] == 0)
                            {
                                if (map[currentY - 1, currentX] != 'X' && map[currentY - 1, currentX] != 'P' && map[currentY - 1, currentX ] != 0)
                                {
                                    length++;
                                    draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i apacia
                                }
                                else if (map[currentY - 1, currentX] == 'X' && map[currentY - 1, currentX] == 'P' && map[currentY - 1, currentX] == 0)
                                {
                                    if (map[currentY, currentX + 1] != 'X' && map[currentY, currentX + 1] == 'P' && map[currentY, currentX + 1] == 0)
                                    {
                                        length++;
                                        draugoKelione(currentX + 1, currentY, goalX, goalY, out length, map); //eina i virsu
                                    }
                                    else
                                        return false; //akligatvis
                                }
                            }
                        }
                    }
                }
            }

            //kai nei y nei x nelygus susitikimo vietai------------------------------------------------------------------------------------------------------------
            else if(currentX != goalX && currentY != goalY)
            {
                if(Math.Abs(currentX-goalX) >= Math.Abs(currentY-goalY))
                {
                    if((currentX-goalX) > 0)
                    {
                        if (map[currentY, currentX - 1] != 'X' && map[currentY, currentX - 1] != 'P' && map[currentY, currentX] != 0)
                        {
                            length++;
                            draugoKelione(currentX - 1, currentY, goalX, goalY, out length, map); //eina i kaire
                        }
                        else if (map[currentY, currentX - 1] == 'X' || map[currentY, currentX - 1] == 'P' || map[currentY, currentX - 1] == 0)
                        {
                            if (map[currentY + 1, currentX] != 'X' && map[currentY + 1, currentX] != 'P' && map[currentY + 1, currentX] != 0)
                            {
                                length++;
                                draugoKelione(currentX, currentY + 1, goalX, goalY, out length, map); //paeina i virsu
                            }
                            else if (map[currentY + 1, currentX] == 'X' || map[currentY + 1, currentX] == 'P' || map[currentY + 1, currentX] == 0)
                            {
                                if (map[currentY - 1, currentX] != 'X' && map[currentY - 1, currentX] != 'P' && map[currentY - 1, currentX] != 0)
                                {
                                    length++;
                                    draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i apacia
                                }
                                else if (map[currentY - 1, currentX] == 'X' && map[currentY - 1, currentX] == 'P' && map[currentY - 1, currentX] == 0)
                                {
                                    if (map[currentY, currentX + 1] != 'X' && map[currentY, currentX + 1] == 'P' && map[currentY, currentX + 1] == 0)
                                    {
                                        length++;
                                        draugoKelione(currentX + 1, currentY, goalX, goalY, out length, map); //eina i virsu
                                    }
                                    else
                                        return false; //akligatvis
                                }
                            }
                        }
                    }
                    else
                    {
                        if (map[currentY, currentX + 1] != 'X' && map[currentY, currentX + 1] != 'P' && map[currentY, currentX + 1] != 0) //eina i virsu
                        {
                            length++;
                            draugoKelione(currentX + 1, currentY, goalX, goalY, out length, map); //eina i desine
                        }
                        else if (map[currentY, currentX + 1] == 'X' && map[currentY, currentX + 1] == 'P' && map[currentY, currentX + 1] == 0)
                        {
                            if (map[currentY - 1, currentX] != 'X' && map[currentY - 1, currentX] != 'P' && map[currentY - 1, currentX] != 0)
                            {
                                length++;
                                draugoKelione(currentX - 1, currentY, goalX, goalY, out length, map); //paeina i apacia
                            }
                            else if (map[currentY - 1, currentX] == 'X' || map[currentY - 1, currentX] == 'P' || map[currentY - 1, currentX] == 0)
                            {
                                if (map[currentY + 1, currentX] != 'X' && map[currentY + 1, currentX] != 'P' && map[currentY + 1, currentX] != 0)
                                {
                                    length++;
                                    draugoKelione(currentX, currentY + 1, goalX, goalY, out length, map); //paeina i virsu
                                }
                                else if (map[currentY + 1, currentX] == 'X' && map[currentY + 1, currentX] == 'P' && map[currentY + 1, currentX] == 0)
                                {
                                    if (map[currentY, currentX - 1] != 'X' && map[currentY, currentX - 1] == 'P' && map[currentY, currentX - 1] == 0)
                                    {
                                        length++;
                                        draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i kaire
                                    }
                                    else
                                        return false; //akligatvis
                                }
                            }
                        }
                    }
                }
                else
                {
                    if ((currentY - goalY) > 0)
                    {
                        {
                            if (map[currentY - 1, currentX] != 'X' && map[currentY - 1, currentX] != 'P' && map[currentY - 1, currentX] != 0)
                            {
                                length++;
                                draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i apacia
                            }
                            else if (map[currentY - 1, currentX] == 'X' || map[currentY - 1, currentX] == 'P' || map[currentY - 1, currentX] == 0)
                            {
                                if (map[currentY, currentX + 1] != 'X' && map[currentY, currentX + 1] != 'P' && map[currentY, currentX + 1] != 0)
                                {
                                    length++;
                                    draugoKelione(currentX + 1, currentY, goalX, goalY, out length, map); //paeina i desine
                                }
                                else if (map[currentY, currentX + 1] == 'X' || map[currentY, currentX + 1] == 'P' || map[currentY, currentX + 1] == 0)
                                {
                                    if (map[currentY, currentX - 1] != 'X' && map[currentY, currentX - 1] != 'P' && map[currentY, currentX - 1] != 0)
                                    {
                                        length++;
                                        draugoKelione(currentX - 1, currentY, goalX, goalY, out length, map); //paeina i kaire
                                    }
                                    else if (map[currentY, currentX - 1] == 'X' && map[currentY, currentX - 1] == 'P' && map[currentY, currentX - 1] == 0)
                                    {
                                        if (map[currentY + 1, currentX] != 'X' && map[currentY + 1, currentX] == 'P' && map[currentY + 1, currentX] == 0)
                                        {
                                            length++;
                                            draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i virsu
                                        }
                                        else
                                            return false; //akligatvis
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        if (map[currentY + 1, currentX] != 'X' && map[currentY + 1, currentX] != 'P' && map[currentY + 1, currentX] != 0) //eina i virsu
                        {
                            length++;
                            draugoKelione(currentX, currentY + 1, goalX, goalY, out length, map);
                        }
                        else if (map[currentY + 1, currentX] == 'X' || map[currentY + 1, currentX] == 'P' || map[currentY + 1, currentX] == 0)
                        {
                            if (map[currentY, currentX + 1] != 'X' && map[currentY, currentX + 1] != 'P' && map[currentY, currentX + 1] != 0)
                            {
                                length++;
                                draugoKelione(currentX + 1, currentY, goalX, goalY, out length, map); //paeina i desine
                            }
                            else if (map[currentY, currentX + 1] == 'X' || map[currentY, currentX + 1] == 'P' || map[currentY, currentX + 1] == 0)
                            {
                                if (map[currentY, currentX - 1] != 'X' && map[currentY, currentX - 1] != 'P' && map[currentY, currentX - 1] != 0)
                                {
                                    length++;
                                    draugoKelione(currentX - 1, currentY, goalX, goalY, out length, map); //paeina i kaire
                                }
                                else if (map[currentY, currentX - 1] == 'X' && map[currentY, currentX - 1] == 'P' && map[currentY, currentX - 1] == 0)
                                {
                                    if (map[currentY - 1, currentX] != 'X' && map[currentY, currentX - 1] == 'P' && map[currentY, currentX - 1] == 0)
                                    {
                                        length++;
                                        draugoKelione(currentX, currentY - 1, goalX, goalY, out length, map); //eina i apacia
                                    }
                                    else
                                        return false; //akligatvis
                                }
                            }
                        }
                    }
                }
            }

            return false;
        }

        static void spausdinimas(char[,] map, int[] xDraugu, int[] yDraugu, int xSus, int ySus, int xPic, int yPic)
        {
            using (StreamWriter writer = new StreamWriter(@"..\..\Rezultatai.txt"))
            {
                writer.WriteLine("Rezultatai: ");
                writer.WriteLine("");
                writer.WriteLine("Draugu pozicijos (x,y): ");
                for (int i = 0; i < xDraugu.Length; i++)
                {
                    writer.WriteLine("Draugo nr. {0} pozicija - ({1},{2})", i+1, xDraugu[i], yDraugu[i]);
                }
                writer.WriteLine("");
                writer.WriteLine("Artimiausia susitikimo vieta: ({0},{1})", xSus, ySus);
                writer.WriteLine("Pasirinkta picerija: ({0},{1})", xPic, yPic);
                writer.WriteLine("");
                writer.WriteLine("Duomenys: ");
                //for(int i = 0; i < map.GetUpperBound(0); i++)
                //{
                //    for (int j = 0; j < map.GetUpperBound(0); i++)
                //    {
                //        Console.Write("{0}", map[i, j]);
                //    }
                //}
            }
        }
    }
}
