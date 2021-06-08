LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY switches IS PORT (
  clock : IN STD_LOGIC;
  current_number : IN INTEGER RANGE 0 TO 9;
  current_step : IN INTEGER RANGE 0 TO 6;
  output_current_step : OUT INTEGER RANGE 0 TO 6;
  remaining_lives : IN INTEGER RANGE 0 TO 3;
  output_remaining_lives : OUT INTEGER RANGE 0 TO 3;
  SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
);
END switches;

ARCHITECTURE hardware OF switches IS

  SIGNAL output_cs : INTEGER RANGE 0 TO 6 := 0;
  SIGNAL output_rl : INTEGER RANGE 0 TO 3 := 3;
  SIGNAL last_SW : STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN
  PROCESS (clock, current_number, current_step, SW)
  BEGIN
    IF (remaining_lives > 0) THEN
      IF rising_edge(clock) THEN

        last_SW <= SW;

        IF ((last_SW = "000000000") AND (SW /= "000000000")) THEN

          IF (SW = 2 ** 0) THEN
            IF (current_number = 0) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 1) THEN
            IF (current_number = 1) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 2) THEN
            IF (current_number = 2) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 3) THEN
            IF (current_number = 3) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 4) THEN
            IF (current_number = 4) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 5) THEN
            IF (current_number = 5) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 6) THEN
            IF (current_number = 6) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 7) THEN
            IF (current_number = 7) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 8) THEN
            IF (current_number = 8) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

          IF (SW = 2 ** 9) THEN
            IF (current_number = 9) THEN
              output_cs <= current_step + 1;
            ELSE
              output_rl <= remaining_lives - 1;
            END IF;
          END IF;

        END IF;
      END IF;
    END IF;

  END PROCESS;

  output_current_step <= output_cs;
  output_remaining_lives <= output_rl;
END hardware;