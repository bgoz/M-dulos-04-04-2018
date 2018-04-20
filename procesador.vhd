
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity procesador is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador;

architecture Behavioral of procesador is

COMPONENT ALU
	PORT(
		crs1 : IN std_logic_vector(31 downto 0);
		c : IN std_logic_vector(31 downto 0);
		aluop : IN std_logic_vector(5 downto 0);          
		result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT RegisterFile
	PORT(
		rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
      rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
      rd : in  STD_LOGIC_VECTOR (4 downto 0);
      reset : in  STD_LOGIC;
      dwr : in  STD_LOGIC_VECTOR (31 downto 0);
      crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
      crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;
	
COMPONENT UC
	PORT(
		op : in  STD_LOGIC_VECTOR (1 downto 0);
      op3 : in  STD_LOGIC_VECTOR (5 downto 0);
      aluop : out  STD_LOGIC_VECTOR (5 downto 0));
	END COMPONENT;
	
COMPONENT extensiona32 
	PORT(
		a : in STD_LOGIC_VECTOR (12 DOWNTO 0);
      salida : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
	END COMPONENT;
	
COMPONENT mux2a1 
	PORT(
		a : in STD_LOGIC_VECTOR (31 DOWNTO 0);
      b : in STD_LOGIC_VECTOR (31 DOWNTO 0);
      sel : in  STD_LOGIC;
      c : out STD_LOGIC_VECTOR (31 DOWNTO 0));
	END COMPONENT;

COMPONENT pc 
	PORT(
		Address : in  STD_LOGIC_VECTOR (31 downto 0);
      Reset : in  STD_LOGIC;
      CLK : in  STD_LOGIC;
      PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;

COMPONENT sumador 
	PORT(
		a : in  std_logic_vector(31 DOWNTO 0);
      b : in  std_logic_vector(31 DOWNTO 0);
      salida : out std_logic_vector(31 DOWNTO 0));
	END COMPONENT;
	
COMPONENT instructionMemory 
	PORT(
		address : in  STD_LOGIC_VECTOR (5 downto 0);
      reset : in  STD_LOGIC;
      outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;

signal sumadornpc: std_logic_vector (31 downto 0):=(others => '0');
signal npcapc: std_logic_vector (31 downto 0):=(others => '0');
signal pcaim: std_logic_vector (31 downto 0):=(others => '0');
signal im_out: STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
signal seuamux: STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
signal resultado_final: std_logic_vector(31 downto 0):=(others=>'0');
signal crs1aalu: std_logic_vector(31 downto 0):=(others=>'0');
signal crs2amux: std_logic_vector(31 downto 0):=(others=>'0');
signal ucaalu: std_logic_vector(5 downto 0):=(others=>'0');
signal muxaalu: std_logic_vector(31 downto 0):=(others=>'0');
	
begin
Inst_sumador :sumador PORT MAP(
		a => "00000000000000000000000000000001",
		b => npcapc,
		salida => sumadornpc
);

Inst_npc : pc PORT MAP(
		Address => sumadornpc,
		Reset => reset,
		CLK => clk,
		PC_OUT => npcapc
);

Inst_pc : pc PORT MAP(
		Address => npcapc,
		Reset => reset,
		CLK => clk,
		PC_OUT => pcaim
);

Inst_IM : instructionMemory PORT MAP(
address => pcaim(5 downto 0),
reset => reset,
outInstruction => im_out
);

Inst_SEU : extensiona32 PORT MAP(
a => im_out(12 downto 0),
salida => seuamux
);

Inst_Register_File : RegisterFile PORT MAP(
rs1 => im_out(18 downto 14),
rs2 => im_out(4 downto 0),
rd => im_out(29 downto 25),
dwr => resultado_final,
reset => reset,
crs1 => crs1aalu, 
crs2 => crs2amux  
);

inst_UC: UC PORT MAP(
op => im_out(31 downto 30),
op3 => im_out(24 downto 19),
aluop => ucaalu
); 

inst_mux: mux2a1 PORT MAP(
a => crs2amux,
b => seuamux,
sel => im_out(13),
c => muxaalu
);

inst_alu: ALU PORT MAP(
crs1 => crs1aalu,
c => muxaalu,
aluop => ucaalu,
result => resultado_final
);


resultado <= resultado_final;
end Behavioral;

