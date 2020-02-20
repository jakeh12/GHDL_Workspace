library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  port (
    i_clk  : in  std_logic;
    i_rstn : in  std_logic;
    i_ena  : in  std_logic;
    o_cnt  : out std_logic_vector(3 downto 0)
  );
end counter;

architecture rtl of counter is
  
  signal q_cnt, n_cnt : unsigned(3 downto 0);

begin
  
  n_cnt <= q_cnt + 1 when i_ena = '1' else
           q_cnt;


  proc_ff: process (i_clk, i_rstn) is
  begin
    if i_rstn = '0' then
      q_cnt <= (others => '0');
    elsif rising_edge(i_clk) then
      q_cnt <= n_cnt;
    end if;
  end process;

  o_cnt <= std_logic_vector(q_cnt);

end rtl;

