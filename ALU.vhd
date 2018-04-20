
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           c : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process (crs1,c,aluop)
	begin
		case (aluop) is
			when "000000" => 
			result <= crs1 + c;
			
			when "000001" =>
			result <= crs1 - c;
			
			when "000010" =>
			result <= crs1 and c;
				
			when "000011" =>
			result <= crs1 or c;
			
			when "000100" =>
			result <= crs1 nand c;
			
			when "000101" =>
			result <= crs1 nor c;
			
			when "000110" =>
			result <= crs1 xor c;
			
			when "000111" =>
			result <= crs1 xnor c;
			
			when others => result<= "11111111111111111111111111111111";
		
		end case;
	end process;
			

end Behavioral;

