LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY display IS PORT (
  secret_password : IN INTEGER RANGE 0 TO 999999;
  current_step : IN INTEGER RANGE 0 TO 5;
  HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END display;

ARCHITECTURE arch_dec OF display IS
  COMPONENT disp7seg IS PORT (
    current_step : IN INTEGER RANGE 0 TO 5;
    disp_step : IN INTEGER RANGE 0 TO 5;
    dec_digit : IN INTEGER RANGE 0 TO 9;
    segment_7dis : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT;

BEGIN
  disp0 : disp7seg PORT MAP(current_step, 5, secret_password/1 MOD 10, HEX0);
  disp1 : disp7seg PORT MAP(current_step, 4, secret_password/10 MOD 10, HEX1);
  disp2 : disp7seg PORT MAP(current_step, 3, secret_password/100 MOD 10, HEX2);
  disp3 : disp7seg PORT MAP(current_step, 2, secret_password/1000 MOD 10, HEX3);
  disp4 : disp7seg PORT MAP(current_step, 1, secret_password/10000 MOD 10, HEX4);
  disp5 : disp7seg PORT MAP(current_step, 0, secret_password/100000 MOD 10, HEX5);
END arch_dec;