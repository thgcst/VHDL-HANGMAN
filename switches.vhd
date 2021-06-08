LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY switches IS PORT (
  switch_number : IN INTEGER RANGE 0 TO 9;
  current_number : IN INTEGER RANGE 0 TO 9;
  current_step : IN INTEGER RANGE 0 TO 5;
  output_current_step : OUT INTEGER RANGE 0 TO 5;
  SW : IN STD_LOGIC
);
END switches;

ARCHITECTURE hardware OF switches IS
BEGIN
  PROCESS (switch_number, current_number, current_step, SW)
  BEGIN

    IF rising_edge(SW) THEN
      IF (current_number = switch_number) THEN
        output_current_step <= current_step + 1;
      END IF;
    END IF;

  END PROCESS;
END hardware;