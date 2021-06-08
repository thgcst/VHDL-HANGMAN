LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY main IS PORT (
  CLOCK_50 : IN STD_LOGIC;
  HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
);
END main;

ARCHITECTURE hardware OF main IS

  CONSTANT secret : INTEGER := 122245;
  SIGNAL current_step : INTEGER RANGE 0 TO 5 := 0;
  SIGNAL current_number : INTEGER RANGE 0 TO 9;

  COMPONENT display IS PORT (
    secret_password : IN INTEGER RANGE 0 TO 999999;
    current_step : IN INTEGER RANGE 0 TO 5;
    HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT switches IS PORT (
    clock : IN STD_LOGIC;
    current_number : IN INTEGER RANGE 0 TO 9;
    current_step : IN INTEGER RANGE 0 TO 5;
    output_current_step : OUT INTEGER RANGE 0 TO 5;
    SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
  END COMPONENT;

BEGIN

  WITH current_step SELECT current_number <=
    (secret/100000 MOD 10) WHEN 0,
    (secret/10000 MOD 10) WHEN 1,
    (secret/1000 MOD 10) WHEN 2,
    (secret/100 MOD 10) WHEN 3,
    (secret/10 MOD 10) WHEN 4,
    (secret MOD 10) WHEN 5,
    0 WHEN OTHERS;

  disps : display PORT MAP(secret, current_step, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
  sw0 : switches PORT MAP(CLOCK_50, current_number, current_step, current_step, SW);

END hardware;