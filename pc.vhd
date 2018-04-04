----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:02 04/04/2018 
-- Design Name: 
-- Module Name:    pc - pc_sparcv8 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end pc;

architecture pc_sparcv8 of pc is

begin
 process(CLK,Reset)
 begin
	if (Reset = '1') then
			if (rising_edge(CLK)) then
				PC_OUT <= "00000000000000000000000000000000";
				end if;
	else
			if(rising_edge(CLK)) then
						PC_OUT <= Address; 
						end if;
					end if;
					end process;
			end pc_sparcv8;

