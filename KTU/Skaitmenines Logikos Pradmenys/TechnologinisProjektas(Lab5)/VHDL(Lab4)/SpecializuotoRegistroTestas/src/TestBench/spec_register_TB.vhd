library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity spec_register_tb is
end spec_register_tb;

architecture TB_ARCHITECTURE of spec_register_tb is
	-- Component declaration of the tested unit
	component spec_register
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		A0 : in STD_LOGIC;
		A1 : in STD_LOGIC;
		Data : in STD_LOGIC_VECTOR(6 downto 0);
		Q : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal rst : STD_LOGIC;
	signal A0 : STD_LOGIC;
	signal A1 : STD_LOGIC;
	signal Data : STD_LOGIC_VECTOR(6 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Q : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...
	rssdfsgdt_procesas : process begin
		rst <= '0';
		wait for 3 ns;
		rst <= '1';
		wait;
	end process;

begin

	-- Unit Under Test port map
	UUT : spec_register
		port map (
			clk => clk,
			rst => rst,
			A0 => A0,
			A1 => A1,
			Data => Data,
			Q => Q
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_spec_register of spec_register_tb is
	for TB_ARCHITECTURE
		for UUT : spec_register
			use entity work.spec_register(beh);
		end for;
	end for;
end TESTBENCH_FOR_spec_register;

