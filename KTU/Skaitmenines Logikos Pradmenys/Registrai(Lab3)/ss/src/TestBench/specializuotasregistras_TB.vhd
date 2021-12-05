library ieee;
use ieee.std_logic_1164.all;
library xp2;
use xp2.components.all;

	-- Add your library and packages declaration here ...

entity specializuotasregistras_tb is
end specializuotasregistras_tb;

architecture TB_ARCHITECTURE of specializuotasregistras_tb is
	-- Component declaration of the tested unit
	component specializuotasregistras
	port(
		reset : in STD_LOGIC;
		CLK : in STD_LOGIC;
		A0 : in STD_LOGIC;
		A1 : in STD_LOGIC;
		Q0 : out STD_LOGIC;
		Q1 : out STD_LOGIC;
		Q2 : out STD_LOGIC;
		Q3 : out STD_LOGIC;
		Q4 : out STD_LOGIC;
		Q5 : out STD_LOGIC;
		Q6 : out STD_LOGIC;
		x0 : in STD_LOGIC;
		x1 : in STD_LOGIC;
		x2 : in STD_LOGIC;
		x3 : in STD_LOGIC;
		x4 : in STD_LOGIC;
		x5 : in STD_LOGIC;
		x6 : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal reset : STD_LOGIC;
	signal CLK : STD_LOGIC;
	signal A0 : STD_LOGIC;
	signal A1 : STD_LOGIC;
	signal x0 : STD_LOGIC;
	signal x1 : STD_LOGIC;
	signal x2 : STD_LOGIC;
	signal x3 : STD_LOGIC;
	signal x4 : STD_LOGIC;
	signal x5 : STD_LOGIC;
	signal x6 : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Q0 : STD_LOGIC;
	signal Q1 : STD_LOGIC;
	signal Q2 : STD_LOGIC;
	signal Q3 : STD_LOGIC;
	signal Q4 : STD_LOGIC;
	signal Q5 : STD_LOGIC;
	signal Q6 : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : specializuotasregistras
		port map (
			reset => reset,
			CLK => CLK,
			A0 => A0,
			A1 => A1,
			Q0 => Q0,
			Q1 => Q1,
			Q2 => Q2,
			Q3 => Q3,
			Q4 => Q4,
			Q5 => Q5,
			Q6 => Q6,
			x0 => x0,
			x1 => x1,
			x2 => x2,
			x3 => x3,
			x4 => x4,
			x5 => x5,
			x6 => x6
		);

	-- Add your stimulus here ...
	ResetProcesas: process
	
    begin
    reset <= '0';wait for 3 ns; -- Reset signalas
    reset <= '1';wait;
    end process;
	
    Sinchroninis: process
	
    begin
    CLK <= '0'; wait for 5 ns; -- ciklas 5-5 ns
    CLK <= '1'; wait for 5 ns;
    end process;
	
    --PostumiuProcesas: process
--	
--    begin
--    x6 <= '1'; x5 <= '0'; x4 <= '1'; x3 <= '1'; x2 <= '0'; x1 <= '0'; x0 <= '1';
--    --------------------------------------------------------------
--    A0 <= '0'; A1 <= '0'; wait for 10 ns; -- Informacijos irasymas
--    A0 <= '0'; A1 <= '1'; wait for 10 ns; -- LL1, iraso 0
--    A0 <= '1'; A1 <= '0'; wait for 10 ns; -- CL1
--	A0 <= '1'; A1 <= '1'; wait for 10 ns; -- AR2, papild. kodas
--    wait;
--    end process;
	
	Postumiai: process
	begin
	x6 <= '1'; x5 <= '1'; x4 <= '0'; x3 <= '1'; x2 <= '0'; x1 <= '0'; x0 <= '1'; -- stumdomas žodis
	--------------------------------------------------------------
	--A1 <= '1'; A0 <= '1'; wait for 10 ns;		-- irašome
	A1 <= '0'; A0 <= '0'; wait for 10 ns;		-- saugome
	A1 <= '1'; A0 <= '0'; wait for 10 ns; -- LL1
	A1 <= '0'; A0 <= '0'; wait for 10 ns;		-- saugome
	A1 <= '0'; A0 <= '1'; wait for 10 ns; -- CL1
	A1 <= '0'; A0 <= '0'; wait for 10 ns;		-- saugome
	A1 <= '1'; A0 <= '1'; wait for 10 ns; -- AR2	
	A1 <= '0'; A0 <= '0'; wait for 10 ns;		-- saugome
	wait;
	-- assert false report "Pabaiga" severity failure;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_specializuotasregistras of specializuotasregistras_tb is
	for TB_ARCHITECTURE
		for UUT : specializuotasregistras
			use entity work.specializuotasregistras(schematic);
		end for;
	end for;
end TESTBENCH_FOR_specializuotasregistras;

