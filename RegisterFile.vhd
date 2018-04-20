
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           reset : in  STD_LOGIC;
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
signal registros : ram_type := (others => x"00000000");

begin

process(reset, Rs1, Rs2, Rd, dwr, registros)
		begin
			if reset = '1' then
				crs1 <= (others => '0');
				crs2 <= (others => '0');
				registros <= (others => x"00000000");
			else
				crs1 <= registros(conv_integer(Rs1));
				crs2 <= registros(conv_integer(Rs2));
				if Rd /= "00000" then
					registros(conv_integer(Rd)) <= dwr;
				end if;
			end if;
	end process;


end Behavioral;

