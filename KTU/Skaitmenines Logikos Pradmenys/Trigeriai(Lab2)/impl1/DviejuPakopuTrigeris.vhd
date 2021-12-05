-- VHDL model created from schematic DviejuPakopuTrigeris.sch -- May 21 19:09:46 2017

library IEEE;
use IEEE.std_logic_1164.all;
library xp2;
use xp2.components.all;

entity DVIEJUPAKOPUTRIGERIS is
      Port (     CLK : In    std_logic;
                  x2 : In    std_logic;
                  x3 : In    std_logic;
                  x4 : In    std_logic;
               RESET : In    std_logic;
                  Q2 : Out   std_logic;
                 nQ2 : Out   std_logic;
                  Q1 : Out   std_logic;
                   D : Out   std_logic );

end DVIEJUPAKOPUTRIGERIS;

architecture SCHEMATIC of DVIEJUPAKOPUTRIGERIS is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal  D_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal nQ2_DUMMY : std_logic;
   signal Q2_DUMMY : std_logic;
   signal      N_1 : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal      N_4 : std_logic;
   signal      N_5 : std_logic;
   signal      N_6 : std_logic;
   signal      N_8 : std_logic;
   signal      N_9 : std_logic;
   signal     N_10 : std_logic;

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

   Q2 <= Q2_DUMMY;
   nQ2 <= nQ2_DUMMY;
   Q1 <= Q1_DUMMY;
   D <= D_DUMMY;

   I1 : nd3
      Port Map ( A=>Q1_DUMMY, B=>N_5, C=>RESET, Z=>N_4 );
   I2 : nd2
      Port Map ( A=>Q2_DUMMY, B=>N_1, Z=>nQ2_DUMMY );
   I3 : nd2
      Port Map ( A=>N_2, B=>nQ2_DUMMY, Z=>Q2_DUMMY );
   I4 : nd2
      Port Map ( A=>N_3, B=>N_4, Z=>N_1 );
   I5 : nd2
      Port Map ( A=>Q1_DUMMY, B=>N_3, Z=>N_2 );
   I6 : nd2
      Port Map ( A=>N_6, B=>N_4, Z=>Q1_DUMMY );
   I7 : nd2
      Port Map ( A=>CLK, B=>N_8, Z=>N_5 );
   I8 : nd2
      Port Map ( A=>D_DUMMY, B=>CLK, Z=>N_6 );
   I9 : inv
      Port Map ( A=>CLK, Z=>N_3 );
   I10 : inv
      Port Map ( A=>D_DUMMY, Z=>N_8 );
   I11 : inv
      Port Map ( A=>x4, Z=>N_9 );
   I12 : xor2
      Port Map ( A=>N_10, B=>N_9, Z=>D_DUMMY );
   I13 : or2
      Port Map ( A=>x2, B=>x3, Z=>N_10 );

end SCHEMATIC;
