-- VHDL model created from schematic SpecializuotasRegistras.sch -- May 23 01:25:22 2017

library IEEE;
use IEEE.std_logic_1164.all;
library xp2;
use xp2.components.all;

entity SPECIALIZUOTASREGISTRAS is
      Port (   reset : In    std_logic;
                 CLK : In    std_logic;
                  A0 : In    std_logic;
                  A1 : In    std_logic;
                  Q0 : Out   std_logic;
                  Q1 : Out   std_logic;
                  Q2 : Out   std_logic;
                  Q3 : Out   std_logic;
                  Q4 : Out   std_logic;
                  Q5 : Out   std_logic;
                  Q6 : Out   std_logic;
                  x0 : In    std_logic;
                  x1 : In    std_logic;
                  x2 : In    std_logic;
                  x3 : In    std_logic;
                  x4 : In    std_logic;
                  x5 : In    std_logic;
                  x6 : In    std_logic );

end SPECIALIZUOTASREGISTRAS;

architecture SCHEMATIC of SPECIALIZUOTASREGISTRAS is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_1 : std_logic;
   signal Q6_DUMMY : std_logic;
   signal Q5_DUMMY : std_logic;
   signal Q4_DUMMY : std_logic;
   signal Q3_DUMMY : std_logic;
   signal Q2_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal Q0_DUMMY : std_logic;
   signal      N_2 : std_logic;
   signal      N_3 : std_logic;
   signal      N_4 : std_logic;
   signal      N_5 : std_logic;
   signal      N_6 : std_logic;
   signal      N_7 : std_logic;
   signal      N_8 : std_logic;
   signal      N_9 : std_logic;
   signal     N_10 : std_logic;
   signal     N_11 : std_logic;
   signal     N_12 : std_logic;
   signal     N_13 : std_logic;
   signal     N_14 : std_logic;
   signal     N_15 : std_logic;

   component vhi
      Port (       Z : Out   std_logic );
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

   component and2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component fd1s3ax
      Port (      CK : In    std_logic;
                   D : In    std_logic;
                   Q : Out   std_logic );
   end component;

begin

   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   Q3 <= Q3_DUMMY;
   Q4 <= Q4_DUMMY;
   Q5 <= Q5_DUMMY;
   Q6 <= Q6_DUMMY;

   I23 : vhi
      Port Map ( Z=>N_1 );
   I2 : mux41
      Port Map ( D0=>x6, D1=>Q5_DUMMY, D2=>Q5_DUMMY, D3=>Q6_DUMMY,
                 SD1=>A0, SD2=>A1, Z=>N_7 );
   I3 : mux41
      Port Map ( D0=>x5, D1=>Q4_DUMMY, D2=>Q4_DUMMY, D3=>Q6_DUMMY,
                 SD1=>A0, SD2=>A1, Z=>N_4 );
   I4 : mux41
      Port Map ( D0=>x4, D1=>Q3_DUMMY, D2=>Q3_DUMMY, D3=>Q6_DUMMY,
                 SD1=>A0, SD2=>A1, Z=>N_2 );
   I5 : mux41
      Port Map ( D0=>x3, D1=>Q2_DUMMY, D2=>Q2_DUMMY, D3=>Q5_DUMMY,
                 SD1=>A0, SD2=>A1, Z=>N_15 );
   I6 : mux41
      Port Map ( D0=>x2, D1=>Q1_DUMMY, D2=>Q1_DUMMY, D3=>Q4_DUMMY,
                 SD1=>A0, SD2=>A1, Z=>N_13 );
   I7 : mux41
      Port Map ( D0=>x1, D1=>Q0_DUMMY, D2=>Q0_DUMMY, D3=>Q3_DUMMY,
                 SD1=>A0, SD2=>A1, Z=>N_11 );
   I8 : mux41
      Port Map ( D0=>x0, D1=>N_1, D2=>Q6_DUMMY, D3=>Q2_DUMMY, SD1=>A0,
                 SD2=>A1, Z=>N_9 );
   I9 : and2
      Port Map ( A=>N_7, B=>reset, Z=>N_6 );
   I10 : and2
      Port Map ( A=>N_4, B=>reset, Z=>N_5 );
   I11 : and2
      Port Map ( A=>N_2, B=>reset, Z=>N_3 );
   I12 : and2
      Port Map ( A=>N_15, B=>reset, Z=>N_14 );
   I13 : and2
      Port Map ( A=>N_13, B=>reset, Z=>N_12 );
   I14 : and2
      Port Map ( A=>N_11, B=>reset, Z=>N_10 );
   I15 : and2
      Port Map ( A=>N_9, B=>reset, Z=>N_8 );
   I16 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_6, Q=>Q6_DUMMY );
   I17 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_5, Q=>Q5_DUMMY );
   I18 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_3, Q=>Q4_DUMMY );
   I19 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_14, Q=>Q3_DUMMY );
   I20 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_12, Q=>Q2_DUMMY );
   I21 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_10, Q=>Q1_DUMMY );
   I22 : fd1s3ax
      Port Map ( CK=>CLK, D=>N_8, Q=>Q0_DUMMY );

end SCHEMATIC;
