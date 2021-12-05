library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity decoder_tb is
end decoder_tb;

architecture TB_ARCHITECTURE of decoder_tb is
	-- Component declaration of the tested unit
	component decoder
	port(
		a : in STD_LOGIC;
		b : in STD_LOGIC;
		c : in STD_LOGIC;
		d : in STD_LOGIC;
		e : in STD_LOGIC;
		f : in STD_LOGIC;
		y : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC;
	signal b : STD_LOGIC;
	signal c : STD_LOGIC;
	signal d : STD_LOGIC;
	signal e : STD_LOGIC;
	signal f : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal y : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : decoder
		port map (
			a => a,
			b => b,
			c => c,
			d => d,
			e => e,
			f => f,
			y => y
		);

	-- Add your stimulus here ...
	testavimas : process
	begin
		a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '0'; f <= '1';	
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '1'; f <= '0';	
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '0'; d <= '1'; e <= '0'; f <= '1';	
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '1'; d <= '0'; e <= '0'; f <= '1';
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '1'; d <= '0'; e <= '1'; f <= '0';
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '1'; d <= '1'; e <= '0'; f <= '1';
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '0'; d <= '0'; e <= '0'; f <= '1';
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '0'; d <= '0'; e <= '1'; f <= '0';
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '0'; d <= '0'; e <= '1'; f <= '1';
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '0'; d <= '1'; e <= '0'; f <= '1';
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '0'; d <= '1'; e <= '1'; f <= '0';
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '0'; f <= '1';
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '1'; f <= '0';
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '1'; d <= '1'; e <= '0'; f <= '1';
		wait for 10 ns ;
		a <= '1'; b <= '1'; c <= '0'; d <= '0'; e <= '1'; f <= '1';
		wait for 10 ns ;
		a <= '1'; b <= '1'; c <= '0'; d <= '1'; e <= '0'; f <= '1';
		wait for 10 ns ;
		a <= '1'; b <= '1'; c <= '1'; d <= '0'; e <= '1'; f <= '1';
		wait for 10 ns ;
		a <= '1'; b <= '1'; c <= '1'; d <= '1'; e <= '0'; f <= '1';
		wait for 10 ns ;
		
		a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '1'; f <= '1';	
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '0'; d <= '1'; e <= '1'; f <= '0';	
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '0'; d <= '1'; e <= '1'; f <= '1';	
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '1'; d <= '1'; e <= '1'; f <= '1';	
		wait for 10 ns ;
		a <= '0'; b <= '0'; c <= '1'; d <= '0'; e <= '1'; f <= '1';	
		wait for 10 ns ;
		a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '1'; f <= '1';	
		wait for 10 ns ;
		wait;
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_decoder of decoder_tb is
	for TB_ARCHITECTURE
		for UUT : decoder
			use entity work.decoder(beh);
		end for;
	end for;
end TESTBENCH_FOR_decoder;

