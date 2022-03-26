LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY counter_4bits_TB IS
GENERIC (MAX_WIDTH	:	INTEGER	:=	4);
END ENTITY counter_4bits_TB;
-------------------------------------
ARCHITECTURE testbench OF counter_4bits_TB IS
	
	SIGNAL	clk_tb  		:	STD_LOGIC := '0';
	SIGNAL	rst_tb  		:	STD_LOGIC := '1';
	SIGNAL	ena_tb 		:	STD_LOGIC := '0';
	SIGNAL	q_tb  		: 	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);	
	
BEGIN
	--CLOCK GENERATION:------------------------
	clk_tb <= not clk_tb after 10ns; -- 50MHz clock generation
	--RESET GENERATION:------------------------
	rst_tb <= 	'0' after 50ns,
					'1' after 450ns,
					'0' after 500ns;
	
	ena_tb <= 	'1' after 50ns,
					'0' after 400ns,
					'1' after 550ns;

	
	DUT:	ENTITY work.counterGates
	PORT MAP(	clk	=>	clk_tb,
					rst	=>	rst_tb,
					ena 	=> ena_tb,
					q		=> q_tb);
	
END ARCHITECTURE testbench;