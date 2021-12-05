library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL;

entity spec_register is
port 
(
	clk , rst : in std_logic ;
	A0 , A1 : in std_logic ;
	Data : in std_logic_vector (6 downto 0);
	Q : out std_logic_vector (6 downto 0)
);
end spec_register ;

architecture beh2 of spec_register is
signal Qreg : std_logic_vector (6 downto 0);

begin
Q <= not Qreg ;

process ( clk , rst )
begin

		if rst = '0' then 						--reset
			Qreg <= "0000000" ;
		elsif clk ' event and clk = '1' then	
			if A0 = '0' and A1 = '0' then  		--iraso
				Qreg <= Data ;
			elsif A0 = '0' and A1 = '1' then	--LL1
				Qreg <= Qreg (5 downto 0) & "0" ;
			elsif A0 = '1' and A1 = '0' then	--CL1
				Qreg <= Qreg (5 downto 0) & Qreg (6);
			elsif A0 = '1' and A1 = '1' then	--AR2
				Qreg <= Qreg (6) & Qreg (6)  & Qreg (6 downto 2) ;
		end if;
	end if;	
end process ;
end beh2 ;