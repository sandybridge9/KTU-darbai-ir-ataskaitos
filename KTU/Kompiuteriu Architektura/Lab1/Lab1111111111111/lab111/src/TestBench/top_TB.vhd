library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity top_tb is
end top_tb;

architecture TB_ARCHITECTURE of top_tb is
	-- Component declaration of the tested unit
	component top
	port(
		CLK : in STD_LOGIC;
		RST : in STD_LOGIC;
		Din : in STD_LOGIC_VECTOR(15 downto 0);
		MAIN_Dout : out STD_LOGIC_VECTOR(15 downto 0);
		S_Done : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLK : STD_LOGIC;
	signal RST : STD_LOGIC;
	signal Din : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal MAIN_Dout : STD_LOGIC_VECTOR(15 downto 0);
	signal S_Done : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : top
		port map (
			CLK => CLK,
			RST => RST,
			Din => Din,
			MAIN_Dout => MAIN_Dout,
			S_Done => S_Done
		);

	-- Add your stimulus here ...
	
		
	
	
	
	
					resetas: process
	begin
		RST <='1'; 
		wait for 2ns;
		RST <='0'; 
		wait;
	end process;
	
	sinchronizacija: process
	begin
		CLK <= '0';	
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;
	end process;	
	
	
	Daugyba: process 
	begin 
		Din <= "0000000000000111"; -- N1 teigiamas skaicius
		wait for 16ns;
		Din <= "1111101111111111"; -- N2 neigiamas skaicius
		wait for 400ns;
		Din <= "0000000000000000"; -- N3 skaicius dalybai kurios nera
				
		wait until S_Done = '1';
		wait for 60 ns;
		assert 1=0 report "Modeliavimas baigtas" severity   failure;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_top of top_tb is
	for TB_ARCHITECTURE
		for UUT : top
			use entity work.top(struct);
		end for;
	end for;
end TESTBENCH_FOR_top;

