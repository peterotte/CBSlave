library IEEE;
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity trigger is
	port (
		clock50 : in STD_LOGIC;
		clock100 : in STD_LOGIC;
		clock200 : in STD_LOGIC;
		clock400 : in STD_LOGIC; 
		trig_in : in STD_LOGIC_VECTOR (6*32-1 downto 0);		
		trig_out : out STD_LOGIC_VECTOR (32*2-1 downto 0);			
		nim_in   : in  STD_LOGIC;
		nim_out  : out STD_LOGIC;
		led	     : out STD_LOGIC_VECTOR(8 downto 1); -- 8 LEDs onboard
		pgxled   : out STD_LOGIC_VECTOR(8 downto 1); -- 8 LEDs on PIG board
		Global_Reset_After_Power_Up : in std_logic;
		VN2andVN1 : in std_logic_vector(7 downto 0);
		-- VME interface ------------------------------------------------------
		u_ad_reg :in std_logic_vector(11 downto 2);
		u_dat_in :in std_logic_vector(31 downto 0);
		u_data_o :out std_logic_vector(31 downto 0);
		oecsr, ckcsr:in std_logic
	);
end trigger;


architecture RTL of trigger is
	--------------------------------------------
	-- Components
	--------------------------------------------
	component InputStretcher 
		Generic (
			Duration : integer := 1
			);
		PORT (
			Clock : in STD_LOGIC;
			Input : in STD_LOGIC;
			Output : out STD_LOGIC
		);
	end component;
	
	component PhiAngleTrigger is
		Port ( 
			trig_in : in  STD_LOGIC_VECTOR (127 downto 0);
			PhiAngleSectionOut : out  STD_LOGIC_VECTOR (15 downto 0);
			VN2andVN1 : in  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;

	--------------------------------------------

	--------------------------------------------
	-- Address reservation for VME
	--------------------------------------------
	subtype sub_Address is std_logic_vector(11 downto 4);
	
	constant BASE_TRIG_EnableInputs0 : sub_Address					:= x"50"; --r/w
	constant BASE_TRIG_EnableInputs1 : sub_Address					:= x"51"; --r/w
	constant BASE_TRIG_EnableInputs2 : sub_Address					:= x"52"; --r/w
	constant BASE_TRIG_EnableInputs3 : sub_Address					:= x"53"; --r/w
	
	constant BASE_TRIG_VN2andVN1Read : sub_Address      			:= x"22"; -- r
	
	constant BASE_TRIG_FIXED : sub_Address 					:= x"f0" ; -- r
	constant TRIG_FIXED : std_logic_vector(31 downto 0) := x"1211210c"; 
	--------------------------------------------
	
	signal EnableInputs : STD_LOGIC_Vector(32*4-1 downto 0) := (others => '1');
	
	constant Trig_In_Number_Start : integer := 0; -- Starting with 0
	constant Trig_In_Number_Stop : integer := 32*4-1; -- Starting with 0
	
	signal trig_in_enlarged : std_logic_vector (Trig_In_Number_Stop downto Trig_In_Number_Start);
	signal post_trig_in : std_logic_vector(Trig_In_Number_Stop downto Trig_In_Number_Start);
	signal trig_in_enlarged_saved, trig_in_enlarged_LastTransfered : std_logic_vector (223 downto 0);
		
	--------------------------------------------
	-- Signals For PhiAngle Trigger
	--------------------------------------------
	signal PhiAngleSectionOut : STD_LOGIC_VECTOR (15 downto 0);
	--------------------------------------------

begin
	------------------------------------------------------------------------------------------
	-- 0. Disable single Inputs
	------------------------------------------------------------------------------------------
	post_trig_in <= trig_in(32*4-1 downto 0) and EnableInputs;
	
	------------------------------------------------------------------------------------------
	-- 1. Strech the input signals
	-- stretch it to minimum 10*10ns
	------------------------------------------------------------------------------------------
	post_trig_in_stretcher:
	for i in Trig_In_Number_Start to Trig_In_Number_Stop generate
		begin
			single_stretcher: InputStretcher generic map (Duration => 6) 
				PORT map(
					Clock => clock100, 
					Input => post_trig_in(i), 
					Output => trig_in_enlarged(i)
				);
		end generate;
	------------------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------
	-- 1b. Instantiate phi angle trigger
	------------------------------------------------------------------------------------------
	MyPhiAngleTrigger: PhiAngleTrigger PORT MAP ( 
			trig_in => trig_in_enlarged(127 downto 0),
			PhiAngleSectionOut => PhiAngleSectionOut,
			VN2andVN1 => VN2andVN1
		);
	trig_out(15+32 downto 0+32) <= PhiAngleSectionOut; --INOUT4
	------------------------------------------------------------------------------------------


	------------------------------------------------------------------------------------------
	-- 2.   4fold ORs
	------------------------------------------------------------------------------------------
	my4foldORs : for i in 0 to 31 generate
		trig_out(i) <= '1' when trig_in_enlarged(3+i*4 downto 0+i*4) /= "0" else '0';  --OUT1
	end generate;
	------------------------------------------------------------------------------------------
	
	

	-----------------------------------------------------------------------------------------
	-- LEDs in front panel
	-----------------------------------------------------------------------------------------
	
	led(1) <= '0';
	led(2) <= '1' when trig_in(31 downto 0) /= "0" else '0';
	led(3) <= '0';
	led(4) <= '1' when trig_in(31+1*32 downto 0+1*32) /= "0" else '0';
	led(5) <= '0';
	led(6) <= '1' when trig_in(31+2*32 downto 0+2*32) /= "0" else '0';
	led(7) <= '0';
	led(8) <= '0';
	pgxled(1) <= '0';
	pgxled(2) <= '1' when trig_in(31+3*32 downto 0+3*32) /= "0" else '0';
	pgxled(8 downto 3) <= "111111";
	
	-----------------------------------------------------------------------------------------
	

	---------------------------------------------------------------------------------------------------------	
	-- Code for VME handling	
	-- handle write commands from vmebus
	---------------------------------------------------------------------------------------------------------	
	process(clock50, ckcsr, u_ad_reg)
	begin
		if (clock50'event and clock50 ='1' and ckcsr='1') then
			case u_ad_reg(11 downto 4) is
				when BASE_TRIG_EnableInputs0 =>
					EnableInputs(31+32*0 downto 0+32*0) <= u_dat_in;
				when BASE_TRIG_EnableInputs1 =>
					EnableInputs(31+32*1 downto 0+32*1) <= u_dat_in;
				when BASE_TRIG_EnableInputs2 =>
					EnableInputs(31+32*2 downto 0+32*2) <= u_dat_in;
				when BASE_TRIG_EnableInputs3 =>
					EnableInputs(31+32*3 downto 0+32*3) <= u_dat_in;
					
				when others =>
					null;
			end case;
		end if;
	end process;
	
	---------------------------------------------------------------------------------------------------------	
	-- handle vme read cycle
	---------------------------------------------------------------------------------------------------------	
	process(clock50, oecsr, u_ad_reg)
	begin
		if (clock50'event and clock50 ='1' and oecsr ='1') then
			u_data_o(31 downto 0) <= (others => '0');
			case u_ad_reg(11 downto 4) is

				when BASE_TRIG_FIXED =>
					u_data_o <= TRIG_FIXED;
				when BASE_TRIG_VN2andVN1Read =>
					u_data_o(7 downto 0) <= VN2andVN1;
				when BASE_TRIG_EnableInputs0 =>
					u_data_o(31 downto 0) <= EnableInputs(31 downto 0);
				when BASE_TRIG_EnableInputs1 =>
					u_data_o(31 downto 0) <= EnableInputs(31+32*1 downto 0+32*1);
				when BASE_TRIG_EnableInputs2 =>
					u_data_o(31 downto 0) <= EnableInputs(31+32*2 downto 0+32*2);
				when BASE_TRIG_EnableInputs3 =>
					u_data_o(31 downto 0) <= EnableInputs(31+32*3 downto 0+32*3);
				when others =>
					null;
			end case;
		end if;
	end process;
	---------------------------------------------------------------------------------------------------------	

end RTL;