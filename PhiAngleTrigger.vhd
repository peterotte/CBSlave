library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PhiAngleTrigger is
    Port ( trig_in : in  STD_LOGIC_VECTOR (127 downto 0);
           PhiAngleSectionOut : out  STD_LOGIC_VECTOR (15 downto 0);
           VN2andVN1 : in  STD_LOGIC_VECTOR (7 downto 0)
			);
end PhiAngleTrigger;

architecture Behavioral of PhiAngleTrigger is
	constant CrystalsQuantAzimutNrOfBins : integer := 48;
	signal CrystalsQuantAzimutIfModule1, CrystalsQuantAzimutIfModule2,
			CrystalsQuantAzimutIfModule3, CrystalsQuantAzimutIfModule4,
			CrystalsQuantAzimutIfModule5, CrystalsQuantAzimutIfModule6: std_logic_vector(CrystalsQuantAzimutNrOfBins-1 downto 0);

begin
	------------------------------------------------------------------------------------------------
	-- Selection of the correct CrystalsQuantAzimutIfModule???
	-- and send only parts of it out to 
	------------------------------------------------------------------------------------------------
	PhiAngleSectionOut <= 
		CrystalsQuantAzimutIfModule1(47)&CrystalsQuantAzimutIfModule1(14 downto 0) when VN2andVN1 = x"e1" else --Module 1
	   CrystalsQuantAzimutIfModule2(21 downto 6) when VN2andVN1 = x"e2" else --Module 2
	   CrystalsQuantAzimutIfModule3(32 downto 17) when VN2andVN1 = x"e3" else --Module 3
	   CrystalsQuantAzimutIfModule4(38 downto 23) when VN2andVN1 = x"e4" else --Module 3
	   CrystalsQuantAzimutIfModule5(47 downto 38)&CrystalsQuantAzimutIfModule5(5 downto 0) when VN2andVN1 = x"e5" else --Module 5
	   CrystalsQuantAzimutIfModule6(42 downto 32)&CrystalsQuantAzimutIfModule6(13)&"0000" when VN2andVN1 = x"e6" else --Module 6
	   (others => '0'); --if wrong VMEAddress

	------------------------------------------------------------------------------------------------
	-- Selection, if module 1
	------------------------------------------------------------------------------------------------

	CrystalsQuantAzimutIfModule1(0) <= trig_in(12) or trig_in(14) or trig_in(28) or trig_in(29) or trig_in(30) or trig_in(46);
	CrystalsQuantAzimutIfModule1(1) <= trig_in(60) or trig_in(11) or trig_in(13) or trig_in(26) or trig_in(27) or trig_in(44) or trig_in(45) or trig_in(77);
	CrystalsQuantAzimutIfModule1(2) <= trig_in(95) or trig_in(7) or trig_in(9) or trig_in(10) or trig_in(23) or trig_in(24) or trig_in(25) or trig_in(111) or trig_in(42) or trig_in(43);
	CrystalsQuantAzimutIfModule1(3) <= trig_in(55) or trig_in(59) or trig_in(94) or trig_in(4) or trig_in(5) or trig_in(6) or trig_in(8) or trig_in(20) or trig_in(21) or trig_in(22) or trig_in(110) or trig_in(39) or trig_in(41) or trig_in(74);
	CrystalsQuantAzimutIfModule1(4) <= trig_in(92) or trig_in(93) or trig_in(1) or trig_in(2) or trig_in(3) or trig_in(17) or trig_in(18) or trig_in(19) or trig_in(108) or trig_in(109) or trig_in(40);
	CrystalsQuantAzimutIfModule1(5) <= trig_in(52) or trig_in(54) or trig_in(57) or trig_in(87) or trig_in(89) or trig_in(90) or trig_in(91) or trig_in(0) or trig_in(127) or trig_in(16) or trig_in(105) or trig_in(106) or trig_in(107) or trig_in(37) or trig_in(38) or trig_in(73);
	CrystalsQuantAzimutIfModule1(6) <= trig_in(51) or trig_in(53) or trig_in(56) or trig_in(84) or trig_in(85) or trig_in(86) or trig_in(88) or trig_in(124) or trig_in(125) or trig_in(126) or trig_in(103) or trig_in(104) or trig_in(34) or trig_in(36) or trig_in(72);
	CrystalsQuantAzimutIfModule1(7) <= trig_in(49) or trig_in(50) or trig_in(81) or trig_in(82) or trig_in(83) or trig_in(121) or trig_in(122) or trig_in(123) or trig_in(101) or trig_in(102) or trig_in(33) or trig_in(35);
	CrystalsQuantAzimutIfModule1(8) <= trig_in(48) or trig_in(80) or trig_in(119) or trig_in(120) or trig_in(98) or trig_in(100) or trig_in(32) or trig_in(69);
	CrystalsQuantAzimutIfModule1(9) <= trig_in(114) or trig_in(117) or trig_in(118) or trig_in(97) or trig_in(99) or trig_in(66);
	CrystalsQuantAzimutIfModule1(10) <= trig_in(113) or trig_in(115) or trig_in(116) or trig_in(96) or trig_in(64) or trig_in(65) or trig_in(70);
	CrystalsQuantAzimutIfModule1(11) <= trig_in(112) or trig_in(67) or trig_in(68);
	CrystalsQuantAzimutIfModule1(12) <= '0';
	CrystalsQuantAzimutIfModule1(13) <= '0';
	CrystalsQuantAzimutIfModule1(14) <= '0';
	CrystalsQuantAzimutIfModule1(15) <= '0';
	CrystalsQuantAzimutIfModule1(16) <= '0';
	CrystalsQuantAzimutIfModule1(17) <= '0';
	CrystalsQuantAzimutIfModule1(18) <= '0';
	CrystalsQuantAzimutIfModule1(19) <= '0';
	CrystalsQuantAzimutIfModule1(20) <= '0';
	CrystalsQuantAzimutIfModule1(21) <= '0';
	CrystalsQuantAzimutIfModule1(22) <= '0';
	CrystalsQuantAzimutIfModule1(23) <= '0';
	CrystalsQuantAzimutIfModule1(24) <= '0';
	CrystalsQuantAzimutIfModule1(25) <= '0';
	CrystalsQuantAzimutIfModule1(26) <= '0';
	CrystalsQuantAzimutIfModule1(27) <= '0';
	CrystalsQuantAzimutIfModule1(28) <= '0';
	CrystalsQuantAzimutIfModule1(29) <= '0';
	CrystalsQuantAzimutIfModule1(30) <= '0';
	CrystalsQuantAzimutIfModule1(31) <= '0';
	CrystalsQuantAzimutIfModule1(32) <= '0';
	CrystalsQuantAzimutIfModule1(33) <= '0';
	CrystalsQuantAzimutIfModule1(34) <= '0';
	CrystalsQuantAzimutIfModule1(35) <= '0';
	CrystalsQuantAzimutIfModule1(36) <= '0';
	CrystalsQuantAzimutIfModule1(37) <= '0';
	CrystalsQuantAzimutIfModule1(38) <= '0';
	CrystalsQuantAzimutIfModule1(39) <= '0';
	CrystalsQuantAzimutIfModule1(40) <= '0';
	CrystalsQuantAzimutIfModule1(41) <= '0';
	CrystalsQuantAzimutIfModule1(42) <= '0';
	CrystalsQuantAzimutIfModule1(43) <= '0';
	CrystalsQuantAzimutIfModule1(44) <= '0';
	CrystalsQuantAzimutIfModule1(45) <= '0';
	CrystalsQuantAzimutIfModule1(46) <= '0';
	CrystalsQuantAzimutIfModule1(47) <= trig_in(15) or trig_in(31) or trig_in(47);


	------------------------------------------------------------------------------------------------
	-- Selection, if module 2
	------------------------------------------------------------------------------------------------

	CrystalsQuantAzimutIfModule2(0) <= '0';
	CrystalsQuantAzimutIfModule2(1) <= '0';
	CrystalsQuantAzimutIfModule2(2) <= '0';
	CrystalsQuantAzimutIfModule2(3) <= '0';
	CrystalsQuantAzimutIfModule2(4) <= '0';
	CrystalsQuantAzimutIfModule2(5) <= '0';
	CrystalsQuantAzimutIfModule2(6) <= trig_in(15);
	CrystalsQuantAzimutIfModule2(7) <= trig_in(12) or trig_in(14);
	CrystalsQuantAzimutIfModule2(8) <= trig_in(7) or trig_in(11) or trig_in(13) or trig_in(20);
	CrystalsQuantAzimutIfModule2(9) <= trig_in(3) or trig_in(4) or trig_in(6) or trig_in(9) or trig_in(10) or trig_in(19);
	CrystalsQuantAzimutIfModule2(10) <= trig_in(1) or trig_in(2) or trig_in(5) or trig_in(8) or trig_in(42) or trig_in(45) or trig_in(51) or trig_in(52) or trig_in(16) or trig_in(17) or trig_in(22);
	CrystalsQuantAzimutIfModule2(11) <= trig_in(0) or trig_in(34) or trig_in(40) or trig_in(41) or trig_in(67) or trig_in(48) or trig_in(49) or trig_in(18) or trig_in(21);
	CrystalsQuantAzimutIfModule2(12) <= trig_in(32) or trig_in(33) or trig_in(37) or trig_in(43) or trig_in(44) or trig_in(46) or trig_in(47) or trig_in(80) or trig_in(64) or trig_in(65) or trig_in(68) or trig_in(50) or trig_in(53) or trig_in(54) or trig_in(55);
	CrystalsQuantAzimutIfModule2(13) <= trig_in(35) or trig_in(36) or trig_in(38) or trig_in(39) or trig_in(81) or trig_in(82) or trig_in(83) or trig_in(66) or trig_in(69) or trig_in(70) or trig_in(71) or trig_in(24);
	CrystalsQuantAzimutIfModule2(14) <= trig_in(112) or trig_in(114) or trig_in(117) or trig_in(120) or trig_in(121) or trig_in(122) or trig_in(125) or trig_in(84) or trig_in(85) or trig_in(72) or trig_in(75) or trig_in(76) or trig_in(56) or trig_in(57) or trig_in(59) or trig_in(60);
	CrystalsQuantAzimutIfModule2(15) <= trig_in(113) or trig_in(115) or trig_in(86) or trig_in(88) or trig_in(96) or trig_in(73) or trig_in(74);
	CrystalsQuantAzimutIfModule2(16) <= trig_in(116) or trig_in(118) or trig_in(119) or trig_in(123) or trig_in(126) or trig_in(87) or trig_in(89) or trig_in(90) or trig_in(91) or trig_in(97) or trig_in(98) or trig_in(99) or trig_in(77) or trig_in(78) or trig_in(79) or trig_in(58) or trig_in(62);
	CrystalsQuantAzimutIfModule2(17) <= trig_in(124) or trig_in(127) or trig_in(92) or trig_in(93) or trig_in(94) or trig_in(100) or trig_in(101) or trig_in(102) or trig_in(104) or trig_in(61) or trig_in(63);
	CrystalsQuantAzimutIfModule2(18) <= trig_in(95) or trig_in(103) or trig_in(105);
	CrystalsQuantAzimutIfModule2(19) <= trig_in(106) or trig_in(107);
	CrystalsQuantAzimutIfModule2(20) <= trig_in(108) or trig_in(109) or trig_in(110);
	CrystalsQuantAzimutIfModule2(21) <= trig_in(111);
	CrystalsQuantAzimutIfModule2(22) <= '0';
	CrystalsQuantAzimutIfModule2(23) <= '0';
	CrystalsQuantAzimutIfModule2(24) <= '0';
	CrystalsQuantAzimutIfModule2(25) <= '0';
	CrystalsQuantAzimutIfModule2(26) <= '0';
	CrystalsQuantAzimutIfModule2(27) <= '0';
	CrystalsQuantAzimutIfModule2(28) <= '0';
	CrystalsQuantAzimutIfModule2(29) <= '0';
	CrystalsQuantAzimutIfModule2(30) <= '0';
	CrystalsQuantAzimutIfModule2(31) <= '0';
	CrystalsQuantAzimutIfModule2(32) <= '0';
	CrystalsQuantAzimutIfModule2(33) <= '0';
	CrystalsQuantAzimutIfModule2(34) <= '0';
	CrystalsQuantAzimutIfModule2(35) <= '0';
	CrystalsQuantAzimutIfModule2(36) <= '0';
	CrystalsQuantAzimutIfModule2(37) <= '0';
	CrystalsQuantAzimutIfModule2(38) <= '0';
	CrystalsQuantAzimutIfModule2(39) <= '0';
	CrystalsQuantAzimutIfModule2(40) <= '0';
	CrystalsQuantAzimutIfModule2(41) <= '0';
	CrystalsQuantAzimutIfModule2(42) <= '0';
	CrystalsQuantAzimutIfModule2(43) <= '0';
	CrystalsQuantAzimutIfModule2(44) <= '0';
	CrystalsQuantAzimutIfModule2(45) <= '0';
	CrystalsQuantAzimutIfModule2(46) <= '0';
	CrystalsQuantAzimutIfModule2(47) <= '0';


	------------------------------------------------------------------------------------------------
	-- Selection, if module 3
	------------------------------------------------------------------------------------------------

	CrystalsQuantAzimutIfModule3(0) <= '0';
	CrystalsQuantAzimutIfModule3(1) <= '0';
	CrystalsQuantAzimutIfModule3(2) <= '0';
	CrystalsQuantAzimutIfModule3(3) <= '0';
	CrystalsQuantAzimutIfModule3(4) <= '0';
	CrystalsQuantAzimutIfModule3(5) <= '0';
	CrystalsQuantAzimutIfModule3(6) <= '0';
	CrystalsQuantAzimutIfModule3(7) <= '0';
	CrystalsQuantAzimutIfModule3(8) <= '0';
	CrystalsQuantAzimutIfModule3(9) <= '0';
	CrystalsQuantAzimutIfModule3(10) <= '0';
	CrystalsQuantAzimutIfModule3(11) <= '0';
	CrystalsQuantAzimutIfModule3(12) <= '0';
	CrystalsQuantAzimutIfModule3(13) <= '0';
	CrystalsQuantAzimutIfModule3(14) <= '0';
	CrystalsQuantAzimutIfModule3(15) <= '0';
	CrystalsQuantAzimutIfModule3(16) <= '0';
	CrystalsQuantAzimutIfModule3(17) <= trig_in(0) or trig_in(1) or trig_in(2) or trig_in(16) or trig_in(32) or trig_in(48) or trig_in(49) or trig_in(51);
	CrystalsQuantAzimutIfModule3(18) <= trig_in(3) or trig_in(5) or trig_in(8) or trig_in(17) or trig_in(33) or trig_in(50) or trig_in(52) or trig_in(64);
	CrystalsQuantAzimutIfModule3(19) <= trig_in(4) or trig_in(6) or trig_in(9) or trig_in(10) or trig_in(18) or trig_in(19) or trig_in(34) or trig_in(35) or trig_in(53) or trig_in(54) or trig_in(65) or trig_in(67);
	CrystalsQuantAzimutIfModule3(20) <= trig_in(7) or trig_in(20) or trig_in(21) or trig_in(22) or trig_in(24) or trig_in(80) or trig_in(36) or trig_in(37) or trig_in(38) or trig_in(40) or trig_in(55) or trig_in(56);
	CrystalsQuantAzimutIfModule3(21) <= trig_in(11) or trig_in(13) or trig_in(23) or trig_in(25) or trig_in(26) or trig_in(81) or trig_in(39) or trig_in(41) or trig_in(57) or trig_in(59) or trig_in(66) or trig_in(68);
	CrystalsQuantAzimutIfModule3(22) <= trig_in(12) or trig_in(27) or trig_in(29) or trig_in(82) or trig_in(83) or trig_in(42) or trig_in(43) or trig_in(58) or trig_in(60) or trig_in(69);
	CrystalsQuantAzimutIfModule3(23) <= trig_in(14) or trig_in(28) or trig_in(30) or trig_in(112) or trig_in(84) or trig_in(85) or trig_in(86) or trig_in(88) or trig_in(44) or trig_in(45) or trig_in(46) or trig_in(96) or trig_in(61) or trig_in(62) or trig_in(70) or trig_in(72);
	CrystalsQuantAzimutIfModule3(24) <= trig_in(15) or trig_in(31) or trig_in(113) or trig_in(87) or trig_in(89) or trig_in(91) or trig_in(47) or trig_in(97) or trig_in(98) or trig_in(99) or trig_in(63) or trig_in(71) or trig_in(73);
	CrystalsQuantAzimutIfModule3(25) <= trig_in(114) or trig_in(115) or trig_in(90) or trig_in(92) or trig_in(100) or trig_in(101) or trig_in(74) or trig_in(75);
	CrystalsQuantAzimutIfModule3(26) <= trig_in(116) or trig_in(117) or trig_in(93) or trig_in(94) or trig_in(102) or trig_in(103) or trig_in(104) or trig_in(76) or trig_in(77);
	CrystalsQuantAzimutIfModule3(27) <= trig_in(118) or trig_in(120) or trig_in(95) or trig_in(105) or trig_in(106) or trig_in(107) or trig_in(78);
	CrystalsQuantAzimutIfModule3(28) <= trig_in(119) or trig_in(108) or trig_in(109) or trig_in(110) or trig_in(79);
	CrystalsQuantAzimutIfModule3(29) <= trig_in(121) or trig_in(123) or trig_in(111);
	CrystalsQuantAzimutIfModule3(30) <= trig_in(122) or trig_in(124);
	CrystalsQuantAzimutIfModule3(31) <= trig_in(125) or trig_in(126);
	CrystalsQuantAzimutIfModule3(32) <= trig_in(127);
	CrystalsQuantAzimutIfModule3(33) <= '0';
	CrystalsQuantAzimutIfModule3(34) <= '0';
	CrystalsQuantAzimutIfModule3(35) <= '0';
	CrystalsQuantAzimutIfModule3(36) <= '0';
	CrystalsQuantAzimutIfModule3(37) <= '0';
	CrystalsQuantAzimutIfModule3(38) <= '0';
	CrystalsQuantAzimutIfModule3(39) <= '0';
	CrystalsQuantAzimutIfModule3(40) <= '0';
	CrystalsQuantAzimutIfModule3(41) <= '0';
	CrystalsQuantAzimutIfModule3(42) <= '0';
	CrystalsQuantAzimutIfModule3(43) <= '0';
	CrystalsQuantAzimutIfModule3(44) <= '0';
	CrystalsQuantAzimutIfModule3(45) <= '0';
	CrystalsQuantAzimutIfModule3(46) <= '0';
	CrystalsQuantAzimutIfModule3(47) <= '0';


	------------------------------------------------------------------------------------------------
	-- Selection, if module 4
	------------------------------------------------------------------------------------------------

	CrystalsQuantAzimutIfModule4(0) <= '0';
	CrystalsQuantAzimutIfModule4(1) <= '0';
	CrystalsQuantAzimutIfModule4(2) <= '0';
	CrystalsQuantAzimutIfModule4(3) <= '0';
	CrystalsQuantAzimutIfModule4(4) <= '0';
	CrystalsQuantAzimutIfModule4(5) <= '0';
	CrystalsQuantAzimutIfModule4(6) <= '0';
	CrystalsQuantAzimutIfModule4(7) <= '0';
	CrystalsQuantAzimutIfModule4(8) <= '0';
	CrystalsQuantAzimutIfModule4(9) <= '0';
	CrystalsQuantAzimutIfModule4(10) <= '0';
	CrystalsQuantAzimutIfModule4(11) <= '0';
	CrystalsQuantAzimutIfModule4(12) <= '0';
	CrystalsQuantAzimutIfModule4(13) <= '0';
	CrystalsQuantAzimutIfModule4(14) <= '0';
	CrystalsQuantAzimutIfModule4(15) <= '0';
	CrystalsQuantAzimutIfModule4(16) <= '0';
	CrystalsQuantAzimutIfModule4(17) <= '0';
	CrystalsQuantAzimutIfModule4(18) <= '0';
	CrystalsQuantAzimutIfModule4(19) <= '0';
	CrystalsQuantAzimutIfModule4(20) <= '0';
	CrystalsQuantAzimutIfModule4(21) <= '0';
	CrystalsQuantAzimutIfModule4(22) <= '0';
	CrystalsQuantAzimutIfModule4(23) <= trig_in(0);
	CrystalsQuantAzimutIfModule4(24) <= trig_in(1) or trig_in(2);
	CrystalsQuantAzimutIfModule4(25) <= trig_in(19) or trig_in(3) or trig_in(5) or trig_in(50);
	CrystalsQuantAzimutIfModule4(26) <= trig_in(32) or trig_in(4) or trig_in(6) or trig_in(8) or trig_in(64);
	CrystalsQuantAzimutIfModule4(27) <= trig_in(20) or trig_in(33) or trig_in(7) or trig_in(9) or trig_in(10) or trig_in(11) or trig_in(65) or trig_in(53) or trig_in(56);
	CrystalsQuantAzimutIfModule4(28) <= trig_in(34) or trig_in(35) or trig_in(12) or trig_in(13) or trig_in(14) or trig_in(66) or trig_in(67);
	CrystalsQuantAzimutIfModule4(29) <= trig_in(22) or trig_in(36) or trig_in(37) or trig_in(38) or trig_in(80) or trig_in(15) or trig_in(68) or trig_in(69) or trig_in(70) or trig_in(72) or trig_in(54) or trig_in(57) or trig_in(58);
	CrystalsQuantAzimutIfModule4(30) <= trig_in(23) or trig_in(39) or trig_in(40) or trig_in(81) or trig_in(82) or trig_in(83) or trig_in(71) or trig_in(73) or trig_in(74) or trig_in(75) or trig_in(55) or trig_in(59) or trig_in(61) or trig_in(96);
	CrystalsQuantAzimutIfModule4(31) <= trig_in(41) or trig_in(43) or trig_in(84) or trig_in(85) or trig_in(86) or trig_in(76) or trig_in(77) or trig_in(78) or trig_in(60) or trig_in(62) or trig_in(97) or trig_in(98);
	CrystalsQuantAzimutIfModule4(32) <= trig_in(27) or trig_in(42) or trig_in(44) or trig_in(87) or trig_in(88) or trig_in(79) or trig_in(63) or trig_in(99) or trig_in(101) or trig_in(104);
	CrystalsQuantAzimutIfModule4(33) <= trig_in(28) or trig_in(45) or trig_in(46) or trig_in(89) or trig_in(91) or trig_in(92) or trig_in(100) or trig_in(102) or trig_in(105) or trig_in(106) or trig_in(109);
	CrystalsQuantAzimutIfModule4(34) <= trig_in(25) or trig_in(30) or trig_in(31) or trig_in(115) or trig_in(116) or trig_in(47) or trig_in(90) or trig_in(93) or trig_in(94) or trig_in(103) or trig_in(107) or trig_in(108) or trig_in(110);
	CrystalsQuantAzimutIfModule4(35) <= trig_in(26) or trig_in(29) or trig_in(118) or trig_in(119) or trig_in(124) or trig_in(95) or trig_in(111);
	CrystalsQuantAzimutIfModule4(36) <= trig_in(112) or trig_in(113) or trig_in(114) or trig_in(117) or trig_in(123) or trig_in(126) or trig_in(127);
	CrystalsQuantAzimutIfModule4(37) <= trig_in(120) or trig_in(121) or trig_in(122) or trig_in(125);
	CrystalsQuantAzimutIfModule4(38) <= '0';
	CrystalsQuantAzimutIfModule4(39) <= '0';
	CrystalsQuantAzimutIfModule4(40) <= '0';
	CrystalsQuantAzimutIfModule4(41) <= '0';
	CrystalsQuantAzimutIfModule4(42) <= '0';
	CrystalsQuantAzimutIfModule4(43) <= '0';
	CrystalsQuantAzimutIfModule4(44) <= '0';
	CrystalsQuantAzimutIfModule4(45) <= '0';
	CrystalsQuantAzimutIfModule4(46) <= '0';
	CrystalsQuantAzimutIfModule4(47) <= '0';

	------------------------------------------------------------------------------------------------
	-- Selection, if module 5
	------------------------------------------------------------------------------------------------

	CrystalsQuantAzimutIfModule5(0) <= trig_in(6) or trig_in(8) or trig_in(16) or trig_in(32) or trig_in(53) or trig_in(54) or trig_in(56) or trig_in(80) or trig_in(96);
	CrystalsQuantAzimutIfModule5(1) <= trig_in(4) or trig_in(5) or trig_in(50) or trig_in(52);
	CrystalsQuantAzimutIfModule5(2) <= trig_in(2) or trig_in(3) or trig_in(49) or trig_in(51);
	CrystalsQuantAzimutIfModule5(3) <= trig_in(1) or trig_in(48);
	CrystalsQuantAzimutIfModule5(4) <= trig_in(0);
	CrystalsQuantAzimutIfModule5(5) <= '0';
	CrystalsQuantAzimutIfModule5(6) <= '0';
	CrystalsQuantAzimutIfModule5(7) <= '0';
	CrystalsQuantAzimutIfModule5(8) <= '0';
	CrystalsQuantAzimutIfModule5(9) <= '0';
	CrystalsQuantAzimutIfModule5(10) <= '0';
	CrystalsQuantAzimutIfModule5(11) <= '0';
	CrystalsQuantAzimutIfModule5(12) <= '0';
	CrystalsQuantAzimutIfModule5(13) <= '0';
	CrystalsQuantAzimutIfModule5(14) <= '0';
	CrystalsQuantAzimutIfModule5(15) <= '0';
	CrystalsQuantAzimutIfModule5(16) <= '0';
	CrystalsQuantAzimutIfModule5(17) <= '0';
	CrystalsQuantAzimutIfModule5(18) <= '0';
	CrystalsQuantAzimutIfModule5(19) <= '0';
	CrystalsQuantAzimutIfModule5(20) <= '0';
	CrystalsQuantAzimutIfModule5(21) <= '0';
	CrystalsQuantAzimutIfModule5(22) <= '0';
	CrystalsQuantAzimutIfModule5(23) <= '0';
	CrystalsQuantAzimutIfModule5(24) <= '0';
	CrystalsQuantAzimutIfModule5(25) <= '0';
	CrystalsQuantAzimutIfModule5(26) <= '0';
	CrystalsQuantAzimutIfModule5(27) <= '0';
	CrystalsQuantAzimutIfModule5(28) <= '0';
	CrystalsQuantAzimutIfModule5(29) <= '0';
	CrystalsQuantAzimutIfModule5(30) <= '0';
	CrystalsQuantAzimutIfModule5(31) <= '0';
	CrystalsQuantAzimutIfModule5(32) <= '0';
	CrystalsQuantAzimutIfModule5(33) <= '0';
	CrystalsQuantAzimutIfModule5(34) <= '0';
	CrystalsQuantAzimutIfModule5(35) <= '0';
	CrystalsQuantAzimutIfModule5(36) <= '0';
	CrystalsQuantAzimutIfModule5(37) <= '0';
	CrystalsQuantAzimutIfModule5(38) <= trig_in(115) or trig_in(116) or trig_in(118) or trig_in(119) or trig_in(123) or trig_in(124) or trig_in(127);
	CrystalsQuantAzimutIfModule5(39) <= trig_in(79) or trig_in(125) or trig_in(126);
	CrystalsQuantAzimutIfModule5(40) <= trig_in(76) or trig_in(77) or trig_in(78) or trig_in(113) or trig_in(117) or trig_in(120) or trig_in(121) or trig_in(122);
	CrystalsQuantAzimutIfModule5(41) <= trig_in(29) or trig_in(30) or trig_in(31) or trig_in(47) or trig_in(71) or trig_in(73) or trig_in(74) or trig_in(75) or trig_in(95) or trig_in(108) or trig_in(110) or trig_in(111) or trig_in(112) or trig_in(114);
	CrystalsQuantAzimutIfModule5(42) <= trig_in(15) or trig_in(26) or trig_in(28) or trig_in(46) or trig_in(70) or trig_in(72) or trig_in(94) or trig_in(103) or trig_in(107) or trig_in(109);
	CrystalsQuantAzimutIfModule5(43) <= trig_in(13) or trig_in(14) or trig_in(25) or trig_in(27) or trig_in(44) or trig_in(45) or trig_in(68) or trig_in(69) or trig_in(92) or trig_in(93) or trig_in(100) or trig_in(102) or trig_in(105) or trig_in(106);
	CrystalsQuantAzimutIfModule5(44) <= trig_in(23) or trig_in(24) or trig_in(39) or trig_in(41) or trig_in(42) or trig_in(43) or trig_in(63) or trig_in(65) or trig_in(66) or trig_in(67) or trig_in(87) or trig_in(89) or trig_in(90) or trig_in(91) or trig_in(104);
	CrystalsQuantAzimutIfModule5(45) <= trig_in(10) or trig_in(12) or trig_in(21) or trig_in(22) or trig_in(38) or trig_in(40) or trig_in(62) or trig_in(64) or trig_in(84) or trig_in(86) or trig_in(88) or trig_in(99) or trig_in(101);
	CrystalsQuantAzimutIfModule5(46) <= trig_in(11) or trig_in(18) or trig_in(20) or trig_in(36) or trig_in(37) or trig_in(60) or trig_in(61) or trig_in(83) or trig_in(85) or trig_in(98);
	CrystalsQuantAzimutIfModule5(47) <= trig_in(7) or trig_in(9) or trig_in(17) or trig_in(19) or trig_in(33) or trig_in(34) or trig_in(35) or trig_in(55) or trig_in(57) or trig_in(58) or trig_in(59) or trig_in(81) or trig_in(82) or trig_in(97);



	------------------------------------------------------------------------------------------------
	-- Selection, if module 6
	------------------------------------------------------------------------------------------------

	CrystalsQuantAzimutIfModule6(0) <= '0';
	CrystalsQuantAzimutIfModule6(1) <= '0';
	CrystalsQuantAzimutIfModule6(2) <= '0';
	CrystalsQuantAzimutIfModule6(3) <= '0';
	CrystalsQuantAzimutIfModule6(4) <= '0';
	CrystalsQuantAzimutIfModule6(5) <= '0';
	CrystalsQuantAzimutIfModule6(6) <= '0';
	CrystalsQuantAzimutIfModule6(7) <= '0';
	CrystalsQuantAzimutIfModule6(8) <= '0';
	CrystalsQuantAzimutIfModule6(9) <= '0';
	CrystalsQuantAzimutIfModule6(10) <= '0';
	CrystalsQuantAzimutIfModule6(11) <= '0';
	CrystalsQuantAzimutIfModule6(12) <= '0';
	CrystalsQuantAzimutIfModule6(13) <= trig_in(0);
	CrystalsQuantAzimutIfModule6(14) <= '0';
	CrystalsQuantAzimutIfModule6(15) <= '0';
	CrystalsQuantAzimutIfModule6(16) <= '0';
	CrystalsQuantAzimutIfModule6(17) <= '0';
	CrystalsQuantAzimutIfModule6(18) <= '0';
	CrystalsQuantAzimutIfModule6(19) <= '0';
	CrystalsQuantAzimutIfModule6(20) <= '0';
	CrystalsQuantAzimutIfModule6(21) <= '0';
	CrystalsQuantAzimutIfModule6(22) <= '0';
	CrystalsQuantAzimutIfModule6(23) <= '0';
	CrystalsQuantAzimutIfModule6(24) <= '0';
	CrystalsQuantAzimutIfModule6(25) <= '0';
	CrystalsQuantAzimutIfModule6(26) <= '0';
	CrystalsQuantAzimutIfModule6(27) <= '0';
	CrystalsQuantAzimutIfModule6(28) <= '0';
	CrystalsQuantAzimutIfModule6(29) <= '0';
	CrystalsQuantAzimutIfModule6(30) <= '0';
	CrystalsQuantAzimutIfModule6(31) <= '0';
	CrystalsQuantAzimutIfModule6(32) <= trig_in(26);
	CrystalsQuantAzimutIfModule6(33) <= trig_in(29);
	CrystalsQuantAzimutIfModule6(34) <= trig_in(25) or trig_in(30) or trig_in(31) or trig_in(58) or trig_in(61);
	CrystalsQuantAzimutIfModule6(35) <= trig_in(27) or trig_in(28) or trig_in(62) or trig_in(63) or trig_in(45);
	CrystalsQuantAzimutIfModule6(36) <= trig_in(56) or trig_in(57) or trig_in(59) or trig_in(60) or trig_in(42) or trig_in(46) or trig_in(47) or trig_in(79);
	CrystalsQuantAzimutIfModule6(37) <= trig_in(23) or trig_in(40) or trig_in(41) or trig_in(43) or trig_in(44) or trig_in(76) or trig_in(77) or trig_in(78) or trig_in(15);
	CrystalsQuantAzimutIfModule6(38) <= trig_in(50) or trig_in(53) or trig_in(54) or trig_in(55) or trig_in(34) or trig_in(37) or trig_in(39) or trig_in(74) or trig_in(75);
	CrystalsQuantAzimutIfModule6(39) <= trig_in(36) or trig_in(38) or trig_in(71) or trig_in(73);
	CrystalsQuantAzimutIfModule6(40) <= trig_in(49) or trig_in(52) or trig_in(32) or trig_in(33) or trig_in(35) or trig_in(68) or trig_in(69) or trig_in(70) or trig_in(72);
	CrystalsQuantAzimutIfModule6(41) <= trig_in(48) or trig_in(51) or trig_in(65) or trig_in(66) or trig_in(67);
	CrystalsQuantAzimutIfModule6(42) <= trig_in(64);
	CrystalsQuantAzimutIfModule6(43) <= '0';
	CrystalsQuantAzimutIfModule6(44) <= '0';
	CrystalsQuantAzimutIfModule6(45) <= '0';
	CrystalsQuantAzimutIfModule6(46) <= '0';
	CrystalsQuantAzimutIfModule6(47) <= '0';


	----------------------------------------------------------------------------------

end Behavioral;
