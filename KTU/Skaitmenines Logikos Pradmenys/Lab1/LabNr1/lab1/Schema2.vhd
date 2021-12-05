-- VHDL model created from schematic Schema2.sch -- Mar 05 23:04:43 2017

library IEEE;
use IEEE.std_logic_1164.all;
library xp2;
use xp2.components.all;

entity SCHEMA2 is
      Port (       a : In    std_logic;
                   b : In    std_logic;
                   c : In    std_logic;
                   d : In    std_logic;
                   e : In    std_logic;
                   f : In    std_logic;
                  op : Out   std_logic );

end SCHEMA2;

architecture SCHEMATIC of SCHEMA2 is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal     N_20 : std_logic;
   signal     N_21 : std_logic;
   signal     N_22 : std_logic;
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
   signal     N_16 : std_logic;
   signal     N_17 : std_logic;
   signal     N_18 : std_logic;
   signal     N_19 : std_logic;

   component mux41
      Port (      D0 : In    std_logic;
                  D1 : In    std_logic;
                  D2 : In    std_logic;
                  D3 : In    std_logic;
                 SD1 : In    std_logic;
                 SD2 : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component or2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component and4
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   D : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component or3
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component and3
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component and2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component inv
      Port (       A : In    std_logic;
                   Z : Out   std_logic );
   end component;

begin

   I1 : mux41
      Port Map ( D0=>N_4, D1=>N_20, D2=>N_21, D3=>N_22, SD1=>d, SD2=>a,
                 Z=>op );
   I2 : or2
      Port Map ( A=>N_6, B=>N_5, Z=>N_22 );
   I3 : or2
      Port Map ( A=>N_8, B=>N_7, Z=>N_21 );
   I4 : or2
      Port Map ( A=>N_10, B=>N_9, Z=>N_20 );
   I5 : and4
      Port Map ( A=>b, B=>c, C=>N_15, D=>f, Z=>N_5 );
   I6 : and4
      Port Map ( A=>b, B=>N_17, C=>N_15, D=>f, Z=>N_6 );
   I7 : and4
      Port Map ( A=>b, B=>c, C=>e, D=>f, Z=>N_7 );
   I8 : and4
      Port Map ( A=>b, B=>N_17, C=>e, D=>f, Z=>N_8 );
   I9 : and4
      Port Map ( A=>b, B=>N_17, C=>e, D=>N_14, Z=>N_9 );
   I10 : or3
      Port Map ( A=>N_13, B=>N_12, C=>N_11, Z=>N_4 );
   I11 : and3
      Port Map ( A=>b, B=>N_17, C=>f, Z=>N_11 );
   I12 : and2
      Port Map ( A=>N_15, B=>f, Z=>N_10 );
   I13 : and2
      Port Map ( A=>N_15, B=>f, Z=>N_12 );
   I14 : and2
      Port Map ( A=>e, B=>N_14, Z=>N_13 );
   I15 : inv
      Port Map ( A=>f, Z=>N_14 );
   I16 : inv
      Port Map ( A=>e, Z=>N_15 );
   I17 : inv
      Port Map ( A=>d, Z=>N_16 );
   I18 : inv
      Port Map ( A=>c, Z=>N_17 );
   I19 : inv
      Port Map ( A=>b, Z=>N_18 );
   I20 : inv
      Port Map ( A=>a, Z=>N_19 );

end SCHEMATIC;
