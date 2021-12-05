library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL;

entity decoder is
port 
(
	a , b , c , d , e , f : in std_logic ;
	y : out std_logic
);
end decoder ;

architecture beh of decoder is
signal xBus : std_logic_vector (5 downto 0);

begin
xBus <= a & b & c & d & e & f ;

with xBus select y <= '1' when "000001" ,
					  '1' when "000010" ,
					  '1' when "000101" ,
					  '1' when "001001" ,
					  '1' when "001010" ,
					  '1' when "001101" ,
					  '1' when "010001" ,
					  '1' when "010010" ,
					  '1' when "010011" ,
					  '1' when "010101" ,
					  '1' when "010110" ,
					  '1' when "011001" ,
					  '1' when "011010" ,
					  '1' when "011101" ,
					  '1' when "110011" ,
					  '1' when "110101" ,
					  '1' when "111011" ,
					  '1' when "111101" ,
					  '0' when others ;
end beh ;