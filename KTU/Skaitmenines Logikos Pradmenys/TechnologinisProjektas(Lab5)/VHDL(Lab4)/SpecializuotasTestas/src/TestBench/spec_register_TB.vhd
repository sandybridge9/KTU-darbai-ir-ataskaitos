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
	ResetProcesas: process begin
    rst <= '0';
	wait for 3 ns; -- Reset signalas
    rst <= '1';
	wait;
    end process;
	
    Sinchroninis: process begin
    clk <= '0';
	wait for 5 ns;
    clk <= '1';
	wait for 5 ns;
    end process;

	Postumiai: process begin
	Data <= "1101011";
	--------------------------------------------------------------
	A0 <= '0'; A1 <= '0'; wait for 10 ns;		-- saugome
	A0 <= '0'; A1 <= '1'; wait for 10 ns; 		-- LL1
	A0 <= '0'; A1 <= '0'; wait for 10 ns;		-- saugome
	A0 <= '1'; A1 <= '0'; wait for 10 ns; 		-- CL1
	A0 <= '0'; A1 <= '0'; wait for 10 ns;		-- saugome
	A0 <= '1'; A1 <= '1'; wait for 10 ns; 		-- AR2	
	A0 <= '0'; A1 <= '0'; wait for 10 ns;		-- saugome
	wait;
	-- assert false report "Pabaiga" severity failure;
	 end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_spec_register of spec_register_tb is
	for TB_ARCHITECTURE
		for UUT : spec_register
			use entity work.spec_register(beh2);
		end for;
	end for;
end TESTBENCH_FOR_spec_register;

