LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY lives IS PORT (
  remaining_lives : IN INTEGER RANGE 0 TO 3 := 3;
  LEDR : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END lives;

ARCHITECTURE hardware OF lives IS
BEGIN
  PROCESS (remaining_lives)
  BEGIN

    CASE remaining_lives IS
      WHEN 3 => LEDR <= "111";
      WHEN 2 => LEDR <= "011";
      WHEN 1 => LEDR <= "001";
      WHEN 0 => LEDR <= "000";
    END CASE;

  END PROCESS;
END hardware;