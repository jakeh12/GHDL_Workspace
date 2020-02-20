library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end counter_tb;

architecture tb of counter_tb is

  signal i_clk  : std_logic;
  signal i_rstn : std_logic;
  signal i_ena  : std_logic;
  signal o_cnt  : std_logic_vector(3 downto 0);

  signal tb_done : boolean := false;

begin

  inst_dut: entity work.counter
  port map (
    i_clk  => i_clk,
    i_rstn => i_rstn,
    i_ena  => i_ena,
    o_cnt  => o_cnt
  );

  proc_clk: process
  begin
    while tb_done = false loop
      i_clk <= '1';
      wait for 5 ns;
      i_clk <= '0';
      wait for 5 ns;
    end loop;
    wait;
  end process;


  proc_stimulus: process
  begin
    
    i_rstn <= '0';
    i_ena  <= '0';
    wait for 20 ns;
    
    i_rstn <= '1';
    wait for 10 ns;
    
    i_ena  <= '1';
    wait for 200 ns;
    
    i_ena  <= '0';
    wait for 40 ns;

    tb_done <= true;
    assert false report "end of test" severity note;
    wait;

  end process;


end tb;

