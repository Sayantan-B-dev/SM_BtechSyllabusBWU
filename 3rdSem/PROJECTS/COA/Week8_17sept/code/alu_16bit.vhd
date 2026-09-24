library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_16bit is
    Port (
        A      : in  STD_LOGIC_VECTOR(15 downto 0);
        B      : in  STD_LOGIC_VECTOR(15 downto 0);
        sel    : in  STD_LOGIC_VECTOR(1 downto 0);
        Result : out STD_LOGIC_VECTOR(15 downto 0);
        Cout   : out STD_LOGIC
    );
end alu_16bit;

architecture Structural of alu_16bit is

    component rca_16bit
        Port (
            A    : in  STD_LOGIC_VECTOR(15 downto 0);
            B    : in  STD_LOGIC_VECTOR(15 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR(15 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    signal B_modified : STD_LOGIC_VECTOR(15 downto 0);
    signal Add_Result  : STD_LOGIC_VECTOR(15 downto 0);
    signal Add_Cout    : STD_LOGIC;

begin

    -- For subtraction, complement B
    B_modified <= B when sel = "00" else
                  not B when sel = "01" else
                  (others => '0');

    -- RCA performs addition or subtraction
    RCA1: rca_16bit
        port map (
            A    => A,
            B    => B_modified,
            Cin  => '1' when sel = "01" else '0',
            Sum  => Add_Result,
            Cout => Add_Cout
        );

    -- Select the ALU operation
    process(A, B, sel, Add_Result, Add_Cout)
    begin

        case sel is

            when "00" =>              -- ADD
                Result <= Add_Result;
                Cout   <= Add_Cout;

            when "01" =>              -- SUB
                Result <= Add_Result;
                Cout   <= Add_Cout;

            when "10" =>              -- AND
                Result <= A and B;
                Cout   <= '0';

            when "11" =>              -- OR
                Result <= A or B;
                Cout   <= '0';

            when others =>
                Result <= (others => '0');
                Cout   <= '0';

        end case;

    end process;

end Structural;