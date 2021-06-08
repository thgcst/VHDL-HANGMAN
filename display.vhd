LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY display IS PORT (
  secret_password : IN INTEGER RANGE 0 TO 999999;
  current_step : IN INTEGER RANGE 0 TO 6;
  remaining_lives : IN INTEGER RANGE 0 TO 3;
  HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END display;

ARCHITECTURE arch_dec OF display IS
  COMPONENT disp7seg IS PORT (
    current_step : IN INTEGER RANGE 0 TO 6;
    disp_step : IN INTEGER RANGE 0 TO 5;
    dec_digit : IN INTEGER RANGE 0 TO 9;
    segment_7dis : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT;

BEGIN
  disp0 : disp7seg port map(current_step, 5, secret_password/1 MOD 10, HEX2);
  disp1 : disp7seg port map(current_step, 4, secret_password/10 MOD 10, HEX3);
  disp2 : disp7seg port map(current_step, 3, secret_password/100 MOD 10, HEX4);
  disp3 : disp7seg port map(current_step, 2, secret_password/1000 MOD 10, HEX5);
  disp4 : disp7seg port map(current_step, 1, secret_password/10000 MOD 10, HEX6);
  disp5 : disp7seg port map(current_step, 0, secret_password/100000 MOD 10, HEX7);
END arch_dec;