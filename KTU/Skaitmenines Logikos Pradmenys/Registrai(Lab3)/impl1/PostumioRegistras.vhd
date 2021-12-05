-- VHDL model created from schematic PostumioRegistras.sch -- May 23 01:25:22 2017

library IEEE;
use IEEE.std_logic_1164.all;
library xp2;
use xp2.components.all;

entity POSTUMIOREGISTRAS is
      Port (      Q0 : Out   std_logic;
                  Q1 : Out   std_logic;
                  DL : In    std_logic;
                  D0 : In    std_logic;
                  A0 : In    std_logic;
                  A1 : In    std_logic;
                  Q2 : Out   std_logic;
                  D1 : In    std_logic;
                  Q3 : Out   std_logic;
                  D2 : In    std_logic;
                 CLK : In    std_logic;
                  D3 : In    std_logic;
                  Q4 : Out   std_logic;
                  Q5 : Out   std_logic;
                  Q6 : Out   std_logic;
                  D4 : In    std_logic;
                  D5 : In    std_logic;
                  DR : In    std_logic;
                  D6 : In    std_logic;
               reset : In    std_logic );

end POSTUMIOREGISTRAS;

architecture SCHEMATIC of POSTUMIOREGISTRAS is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal     N_14 : std_logic;
   signal      N_1 : std_logic;
   signal Q6_DUMMY : std_logic;
   signal Q5_DUMMY : std_logic;
   signal Q4_DUMMY : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal      N_4 : std_logic;
   signal      N_5 : std_logic;
   signal      N_6 : std_logic;
   signal Q3_DUMMY : std_logic;
   signal      N_7 : std_logic;
   signal Q2_DUMMY : std_logic;
   signal      N_8 : std_logic;
   signal      N_9 : std_logic;
   signal     N_10 : std_logic;
   signal     N_11 : std_logic;
   signal Q1_DUMMY : std_logic;
   signal Q0_DUMMY : std_logic;
   signal     N_12 : std_logic;
   signal     N_13 : std_logic;

   component fd1s3ax
      Port (      CK : In    std_logic;
                   D : In    std_logic;
                   Q : Out   std_logic );
   end component;

   component and2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component mux41
      Port (      D0 : In    std_logic;
                  D1 : In    std_logic;
                  D2 : In    std_logic;
                  D3 : In    std_logic;
                 SD1 : In    std_logic;
                 SD2 : In    std_logic;
                   Z : Out   std_logic );
   end component;

begin

   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   Q3 <= Q3_DUMMY;
   Q4 <= Q4_DUMMY;
   Q5 <= Q5_DUMMY;
   Q6 <= Q6_DUMMY;

   I1 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_2, Q=>Q6_DUMMY );
   I2 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_4, Q=>Q5_DUMMY );
   I3 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_6, Q=>Q4_DUMMY );
   I4 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_7, Q=>Q3_DUMMY );
   I5 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_8, Q=>Q2_DUMMY );
   I6 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_10, Q=>Q1_DUMMY );
   I7 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_12, Q=>Q0_DUMMY );
   I8 : and2
      Port Map ( A=>N_1, B=>reset, Z=>N_2 );
   I9 : and2
      Port Map ( A=>N_3, B=>reset, Z=>N_4 );
   I10 : and2
      Port Map ( A=>N_5, B=>reset, Z=>N_6 );
   I11 : and2
      Port Map ( A=>N_14, B=>reset, Z=>N_7 );
   I12 : and2
      Port Map ( A=>N_9, B=>reset, Z=>N_8 );
   I13 : and2
      Port Map ( A=>N_11, B=>reset, Z=>N_10 );
   I14 : and2
      Port Map ( A=>N_13, B=>reset, Z=>N_12 );
   I15 : mux41
      Port Map ( D0=>Q6_DUMMY, D1=>DR, D2=>Q5_DUMMY, D3=>D6, SD1=>A0,
                 SD2=>A1, Z=>N_1 );
   I16 : mux41
      Port Map ( D0=>Q5_DUMMY, D1=>Q6_DUMMY, D2=>Q4_DUMMY, D3=>D5,
                 SD1=>A0, SD2=>A1, Z=>N_3 );
   I17 : mux41
      Port Map ( D0=>Q4_DUMMY, D1=>Q5_DUMMY, D2=>Q3_DUMMY, D3=>D4,
                 SD1=>A0, SD2=>A1, Z=>N_5 );
   I18 : mux41
      Port Map ( D0=>Q3_DUMMY, D1=>Q4_DUMMY, D2=>Q2_DUMMY, D3=>D3,
                 SD1=>A0, SD2=>A1, Z=>N_14 );
   I19 : mux41
      Port Map ( D0=>Q2_DUMMY, D1=>Q3_DUMMY, D2=>Q1_DUMMY, D3=>D2,
                 SD1=>A0, SD2=>A1, Z=>N_9 );
   I20 : mux41
      Port Map ( D0=>Q1_DUMMY, D1=>Q2_DUMMY, D2=>Q0_DUMMY, D3=>D1,
                 SD1=>A0, SD2=>A1, Z=>N_11 );
   I21 : mux41
      Port Map ( D0=>Q0_DUMMY, D1=>Q1_DUMMY, D2=>DL, D3=>D0, SD1=>A0,
                 SD2=>A1, Z=>N_13 );

end SCHEMATIC;
