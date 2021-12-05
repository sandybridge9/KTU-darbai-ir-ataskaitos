-- VHDL model created from schematic Schema12.sch -- Mar 05 23:04:43 2017

library IEEE;
use IEEE.std_logic_1164.all;
library xp2;
use xp2.components.all;

entity SCHEMA12 is
      Port (       a : In    std_logic;
                   b : In    std_logic;
                   c : In    std_logic;
                   d : In    std_logic;
                   e : In    std_logic;
                   f : In    std_logic;
                  op : Out   std_logic );

end SCHEMA12;

architecture SCHEMATIC of SCHEMA12 is

   SIGNAL gnd : std_logic := '0';
   SIGNAL vcc : std_logic := '1';

   signal      N_1 : std_logic;
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
   signal     N_16 : std_logic;

   component nd4
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   D : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component or2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component and2
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component or4
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   D : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component and5
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   D : In    std_logic;
                   E : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component and3
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component and4
      Port (       A : In    std_logic;
                   B : In    std_logic;
                   C : In    std_logic;
                   D : In    std_logic;
                   Z : Out   std_logic );
   end component;

   component inv
      Port (       A : In    std_logic;
                   Z : Out   std_logic );
   end component;

begin

   I27 : nd4
      Port Map ( A=>N_14, B=>N_13, C=>e, D=>f, Z=>open );
   I1 : or2
      Port Map ( A=>N_2, B=>N_1, Z=>op );
   I2 : or2
      Port Map ( A=>N_5, B=>N_4, Z=>N_3 );
   I3 : and2
      Port Map ( A=>N_16, B=>N_3, Z=>N_1 );
   I4 : and2
      Port Map ( A=>N_12, B=>f, Z=>N_5 );
   I5 : and2
      Port Map ( A=>N_6, B=>b, Z=>N_2 );
   I6 : or4
      Port Map ( A=>N_10, B=>N_9, C=>N_8, D=>N_7, Z=>N_6 );
   I7 : and5
      Port Map ( A=>a, B=>c, C=>N_13, D=>e, E=>f, Z=>N_7 );
   I8 : and3
      Port Map ( A=>N_13, B=>e, C=>N_11, Z=>N_4 );
   I9 : and3
      Port Map ( A=>d, B=>N_12, C=>f, Z=>N_9 );
   I10 : and4
      Port Map ( A=>N_16, B=>N_14, C=>e, D=>N_11, Z=>N_8 );
   I11 : and4
      Port Map ( A=>N_14, B=>N_13, C=>e, D=>f, Z=>N_10 );
   I12 : inv
      Port Map ( A=>a, Z=>N_16 );
   I13 : inv
      Port Map ( A=>b, Z=>N_15 );
   I14 : inv
      Port Map ( A=>c, Z=>N_14 );
   I15 : inv
      Port Map ( A=>d, Z=>N_13 );
   I16 : inv
      Port Map ( A=>e, Z=>N_12 );
   I17 : inv
      Port Map ( A=>f, Z=>N_11 );

end SCHEMATIC;
