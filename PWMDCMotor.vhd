library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWMDCMotor is
	Port(
		RST		: in  STD_LOGIC;
		CLK100MHZ: in	STD_LOGIC;
		SW			: in  STD_LOGIC_VECTOR(2 downto 0);
		PWM		: out STD_LOGIC;
		LED		: out STD_LOGIC
		);
end PWMDCMotor;

architecture RLT of PWMDCMotor is

component PWMGEN
	Port(
		RST		: in STD_LOGIC;
		CLK100MHZ: in STD_LOGIC;
		THRESHOLD: in integer;	
		PWM_OUT	: out STD_LOGIC
		);
end component;	

signal threshold_in : integer;
signal pwm_in		  : STD_LOGIC;

begin 

threshold_in <= to_integer(unsigned(SW(2 downto 0))) * 7143;

SubUnit: PWMGEN
port map(RST,CLK100MHZ,threshold_in,pwm_in);

PWM <= pwm_in;
LED <= pwm_in;

end RLT;
	
		
		