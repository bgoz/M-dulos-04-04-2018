library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is

begin
	process(op,op3)
	
	begin 
		if(op = "10") then 
				case op3 is 
				
				when "000000" =>  --ADD
				aluop <= "000000"; --0
				
				when "000100" =>  --SUB
				aluop <= "000001"; --1
				
				when "000001" =>  --AND
				aluop <= "000010"; --2
				
				when "000010" => --OR
				aluop <= "000011"; --3
				
				when "000101" => --ANDN
				aluop <= "000100"; --4
				
				when "000110" => --ORN
				aluop <= "000101"; --5
				
				when "000011" => --XOR
				aluop <= "000110"; --6
				
				when "000111" =>	--XNOR
				aluop <= "000111"; --7
				
				when others => 
				aluop <= "111111";
				
				end case;
		end if;
	end process;

end Behavioral;

