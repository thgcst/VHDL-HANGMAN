LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY disp7seg IS PORT (
  current_step : IN INTEGER RANGE 0 TO 6;
  disp_step : IN INTEGER RANGE 0 TO 5;
  dec_digit : IN INTEGER RANGE 0 TO 9;
  segment_7dis : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END disp7seg;

ARCHITECTURE hardware OF disp7seg IS
  SIGNAL segment_data : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
  PROCESS (dec_digit)
  BEGIN

    IF (current_step < disp_step + 1) THEN
      segment_data <= "0111111";
    ELSE
      CASE dec_digit IS
        WHEN 0 => segment_data <= "1000000";
        WHEN 1 => segment_data <= "1111001";
        WHEN 2 => segment_data <= "0100100";
        WHEN 3 => segment_data <= "0110000";
        WHEN 4 => segment_data <= "0011001";
        WHEN 5 => segment_data <= "0010010";
        WHEN 6 => segment_data <= "0000010";
        WHEN 7 => segment_data <= "1111000";
        WHEN 8 => segment_data <= "0000000";
        WHEN 9 => segment_data <= "1111000";
      END CASE;
    END IF;

  END PROCESS;
  segment_7dis <= segment_data;
END hardware;