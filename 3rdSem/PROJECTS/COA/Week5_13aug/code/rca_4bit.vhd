library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_4bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC
    );
end rca_4bit;

architecture Structural of rca_4bit is

    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal C : STD_LOGIC_VECTOR(3 downto 0);    -- internal carry chain

begin

    -- four full adders chained: carry-out of each feeds carry-in of next
    FA0: full_adder port map(A(0), B(0), Cin, Sum(0), C(0));
    FA1: full_adder port map(A(1), B(1), C(0), Sum(1), C(1));
    FA2: full_adder port map(A(2), B(2), C(1), Sum(2), C(2));
    FA3: full_adder port map(A(3), B(3), C(2), Sum(3), Cout);

end Structural;
