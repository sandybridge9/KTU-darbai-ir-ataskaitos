library ieee;
use ieee.std_logic_1164.all;
library xp2;
use xp2.components.all;

	-- Add your library and packages declaration here ...

entity dviejupakoputrigeris_tb is
end dviejupakoputrigeris_tb;

architecture TB_ARCHITECTURE of dviejupakoputrigeris_tb is
	-- Component declaration of the tested unit
	component dviejupakoputrigeris
	port(
		CLK : in STD_LOGIC;
		x2 : in STD_LOGIC;
		x3 : in STD_LOGIC;
		x4 : in STD_LOGIC;
		RESET : in STD_LOGIC;
		Q2 : out STD_LOGIC;
		nQ2 : out STD_LOGIC;
		Q1 : out STD_LOGIC;
		D : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLK : STD_LOGIC;
	signal x2 : STD_LOGIC;
	signal x3 : STD_LOGIC;
	signal x4 : STD_LOGIC;
	signal RESET : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Q2 : STD_LOGIC;
	signal nQ2 : STD_LOGIC;
	signal Q1 : STD_LOGIC;
	signal D : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : dviejupakoputrigeris
		port map (
			CLK => CLK,
			x2 => x2,
			x3 => x3,
			x4 => x4,
			RESET => RESET,
			Q2 => Q2,
			nQ2 => nQ2,
			Q1 => Q1,
			D => D
		);

	-- Add your stimulus here ...
	clock_proc : process begin -- sinchrosignala valdantis procesas
		CLK <= '0';
		wait for 8 ns ;
		CLK <= '1';
		wait for 8 ns ;
		end process ;
	reset_proc : process begin -- nustatymo i 0 signal a valdantis procesas
		RESET <= '0';
		wait for 2 ns ;
		RESET <= '1';
		wait ;
		end process ;
	test_proc : process begin -- trigerio signalus valdantis procesas
		x2 <= '0'; x3 <= '0'; x4 <= '0'; -- D = 1
		wait for 20 ns ;
		x2 <= '0'; x3 <= '0'; x4 <= '1'; -- D = 0
		wait for 20 ns ;
		x2 <= '0'; x3 <= '0'; x4 <= '0'; -- D = 1
		wait for 20 ns ;
		x2 <= '0'; x3 <= '0'; x4 <= '1'; -- D = 0
		wait for 20 ns ;
		x2 <= '0'; x3 <= '0'; x4 <= '0'; -- D = 1
		wait for 20 ns ;
		x2 <= '0'; x3 <= '0'; x4 <= '1'; -- D = 0
		wait for 20 ns ;
		x2 <= '0'; x3 <= '0'; x4 <= '0'; -- D = 1
		wait for 20 ns ;
		x2 <= '0'; x3 <= '0'; x4 <= '1'; -- D = 0
		wait for 20 ns ;
		end process ;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dviejupakoputrigeris of dviejupakoputrigeris_tb is
	for TB_ARCHITECTURE
		for UUT : dviejupakoputrigeris
			use entity work.dviejupakoputrigeris(schematic);
		end for;
	end for;
end TESTBENCH_FOR_dviejupakoputrigeris;

