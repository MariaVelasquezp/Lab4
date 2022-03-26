LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------------------------
ENTITY counter_DE0 IS
	PORT(		puls_clk : IN  STD_LOGIC;
				swit_ena : IN  STD_LOGIC;
				swit_res : IN  STD_LOGIC;
				seg7 		: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END ENTITY counter_DE0;
-------------------------------------------------------------------------------------
ARCHITECTURE functional OF counter_DE0 IS
	SIGNAL q_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
	
-------------------------------------
BEGIN

counterGates_0: ENTITY work.counterGates_des
	PORT MAP( 	clk => puls_clk,
					rst => swit_res,
					ena => swit_ena,
					q	 => q_s);

impresionseg7: ENTITY work.bin_to_sseg
	PORT MAP( 	bin => q_s,
					sseg => seg7);

END ARCHITECTURE;