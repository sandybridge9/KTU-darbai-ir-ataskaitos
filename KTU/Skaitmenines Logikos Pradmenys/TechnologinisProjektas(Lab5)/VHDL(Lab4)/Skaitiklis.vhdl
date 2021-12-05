library ieee ;
use ieee . std_logic_1164 .all;
use ieee . std_logic_unsigned .all;
-----------------------------------------------------
entity counter is

port 
( 
	clock : in std_logic ;
	clear : in std_logic ;
	load : in std_logic ;
	Data : in std_logic_vector (5 downto 0);
	p : out std_logic ;
	Q : out std_logic_vector (5 downto 0)
);
end counter ;

-- --------------------------------------------------

architecture behv of counter is

	signal Qreg : std_logic_vector (5 downto 0);
	
begin

	Q <= not Qreg ;
	p <= '0' when Qreg = "100100" else '1';
	
	-- skaitiklio elgsenos aprasas
	
		process ( clock , clear )
		begin
			if clear = '0' then
				Qreg <= "000000" ;
			elsif ( load = '1') then
					Qreg <= Data ;
			elsif ( clock ='1' and clock ' event ) then
				if Qreg = "100100" then
					Qreg <= "000000" ;
				
				else
					Qreg <= Qreg + 1;
			end if;
		end if;
	end process ;
	
end behv ;