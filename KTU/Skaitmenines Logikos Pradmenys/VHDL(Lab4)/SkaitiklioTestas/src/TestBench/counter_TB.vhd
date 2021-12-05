library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity counter_tb is
end counter_tb;

architecture TB_ARCHITECTURE of counter_tb is
	-- Component declaration of the tested unit
	component counter
	port(
		clock : in STD_LOGIC;
		clear : in STD_LOGIC;
		load : in STD_LOGIC;
		Data : in STD_LOGIC_VECTOR(5 downto 0);
		p : out STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clock : STD_LOGIC;
	signal clear : STD_LOGIC;
	signal load : STD_LOGIC;
	signal Data : STD_LOGIC_VECTOR(5 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal p : STD_LOGIC;
	signal Q : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : counter
		port map (
			clock => clock,
			clear => clear,
			load => load,
			Data => Data,
			p => p,
			Q => Q
		);

	-- Add your stimulus here ...
	clock_procesas : process begin
		clock <= '0';
		wait for 8 ns;
		clock <= '1';
		wait for 8 ns;
	end process;
	
	Data_procesas : process begin
		Data <= "000001";
		wait;
	end process;
	
	clear_procesas : process begin
		clear <= '0';
		wait for 16 ns;
		clear <= '1';
		wait;
	end process;
	
	load_procesas : process begin
		load <= '0';
		wait for 100 ns;
		load <= '1';
		wait for 18 ns;
		load <= '0';
		wait;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_counter of counter_tb is
	for TB_ARCHITECTURE
		for UUT : counter
			use entity work.counter(behv);
		end for;
	end for;
end TESTBENCH_FOR_counter;

