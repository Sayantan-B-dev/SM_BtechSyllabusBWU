library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_16bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(15 downto 0);
        B    : in  STD_LOGIC_VECTOR(15 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(15 downto 0);
        Cout : out STD_LOGIC
    );
end rca_16bit;

architecture Structural of rca_16bit is

    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal C : STD_LOGIC_VECTOR(16 downto 0);

begin

    C(0) <= Cin;

    FA0: full_adder port map(A(0),  B(0),  C(0),  Sum(0),  C(1));
    FA1: full_adder port map(A(1),  B(1),  C(1),  Sum(1),  C(2));
    FA2: full_adder port map(A(2),  B(2),  C(2),  Sum(2),  C(3));
    FA3: full_adder port map(A(3),  B(3),  C(3),  Sum(3),  C(4));
    FA4: full_adder port map(A(4),  B(4),  C(4),  Sum(4),  C(5));
    FA5: full_adder port map(A(5),  B(5),  C(5),  Sum(5),  C(6));
    FA6: full_adder port map(A(6),  B(6),  C(6),  Sum(6),  C(7));
    FA7: full_adder port map(A(7),  B(7),  C(7),  Sum(7),  C(8));
    FA8: full_adder port map(A(8),  B(8),  C(8),  Sum(8),  C(9));
    FA9: full_adder port map(A(9),  B(9),  C(9),  Sum(9),  C(10));
    FA10: full_adder port map(A(10), B(10), C(10), Sum(10), C(11));
    FA11: full_adder port map(A(11), B(11), C(11), Sum(11), C(12));
    FA12: full_adder port map(A(12), B(12), C(12), Sum(12), C(13));
    FA13: full_adder port map(A(13), B(13), C(13), Sum(13), C(14));
    FA14: full_adder port map(A(14), B(14), C(14), Sum(14), C(15));
    FA15: full_adder port map(A(15), B(15), C(15), Sum(15), C(16));

    Cout <= C(16);

end Structural;