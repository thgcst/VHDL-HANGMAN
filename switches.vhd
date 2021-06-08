LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY switches IS PORT (
  clock : IN STD_LOGIC;
  current_number : IN INTEGER RANGE 0 TO 9;
  current_step : IN INTEGER RANGE 0 TO 5;
  output_current_step : OUT INTEGER RANGE 0 TO 5;
  SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
);
END switches;

ARCHITECTURE hardware OF switches IS

  SIGNAL output : INTEGER RANGE 0 TO 5 := 0;
  SIGNAL last_SW : STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN
  PROCESS (clock, current_number, current_step, SW)
  BEGIN
    IF rising_edge(clock) THEN

      last_SW <= SW;

      IF ((last_SW = "000000000") AND (SW /= "000000000")) THEN

        IF (SW = 2 ** 0) THEN
          IF (current_number = 0) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 1) THEN
          IF (current_number = 1) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 2) THEN
          IF (current_number = 2) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 3) THEN
          IF (current_number = 3) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 4) THEN
          IF (current_number = 4) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 5) THEN
          IF (current_number = 5) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 6) THEN
          IF (current_number = 6) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 7) THEN
          IF (current_number = 7) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 8) THEN
          IF (current_number = 8) THEN
            output <= current_step + 1;
          END IF;
        END IF;

        IF (SW = 2 ** 9) THEN
          IF (current_number = 9) THEN
            output <= current_step + 1;
          END IF;
        END IF;

      END IF;
    END IF;

  END PROCESS;

  output_current_step <= output;
END hardware;