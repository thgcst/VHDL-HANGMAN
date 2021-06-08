LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY display_result IS PORT (
  current_step : IN INTEGER RANGE 0 TO 6;
  remaining_lives : IN INTEGER RANGE 0 TO 3;
  HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END display_result;

ARCHITECTURE arch_dec OF display_result IS

BEGIN
  PROCESS (current_step, remaining_lives)
  BEGIN

    IF (remaining_lives = 0) THEN
      HEX0 <= "0001100";
    ELSIF (current_step = 6) THEN
      HEX0 <= "1000010";
    ELSE
      HEX0 <= "1111111";
    END IF;

  END PROCESS;
END arch_dec;