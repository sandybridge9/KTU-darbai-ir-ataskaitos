-- VHDL model created from schematic StatinisTrigeris.sch -- May 21 19:09:46 2017

library IEEE;
use IEEE.std_logic_1164.all;
library xp2;
use xp2.components.all;

entity STATINISTRIGERIS is
      Port (     CLK : In    std_logic;
                  x2 : In    std_logic;
                  x3 : In    std_logic;
                  x4 : In    std_logic;
                   D : Out   std_logic;
                   Q : Out   std_logic;
                  nQ : Out   std_logic;
               RESET : In    std_logic );

end STATINISTRIGERIS;

architecture SCHEMATIC of STATINISTRIGERIS is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_1 : std_logic;
   signal nQ_DUMMY : std_logic;
   signal  Q_DUMMY : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal      N_4 : std_logic;
   signal  D_DUMMY : std_logic;
   signal      N_5 : std_logic;

   component nd3
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component nd2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component inv
      Port (       A : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component xor2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component or2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

begin

   D <= D_DUMMY;
   Q <= Q_DUMMY;
   nQ <= nQ_DUMMY;

   I1 : nd3
      Port Map ( A=>Q_DUMMY, B=>N_2, C=>RESET, Z=>nQ_DUMMY );
   I2 : nd2
      Port Map ( A=>N_3, B=>nQ_DUMMY, Z=>Q_DUMMY );
   I3 : nd2
      Port Map ( A=>CLK, B=>N_4, Z=>N_2 );
   I4 : nd2
      Port Map ( A=>D_DUMMY, B=>CLK, Z=>N_3 );
   I5 : inv
      Port Map ( A=>x4, Z=>N_1 );
   I6 : inv
      Port Map ( A=>D_DUMMY, Z=>N_4 );
   I7 : xor2
      Port Map ( A=>N_5, B=>N_1, Z=>D_DUMMY );
   I8 : or2
      Port Map ( A=>x2, B=>x3, Z=>N_5 );

end SCHEMATIC;
