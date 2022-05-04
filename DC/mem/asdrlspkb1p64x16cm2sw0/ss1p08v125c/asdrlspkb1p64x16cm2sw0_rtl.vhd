-----------------------------------------------------------------------
--               Copyright(c) Synopsys, Inc.                           
--     All Rights reserved - Unpublished -rights reserved under        
--     the Copyright laws of the United States of America.             
--                                                                     
--  U.S. Patents: 7,093,156 B1 and 7,406,620 B2 (and more pending).    
--                                                                     
--  This file includes the Confidential information of Synopsys, Inc.  
--  and Huali.                                                         
--  The receiver of this Confidential Information shall not disclose   
--  it to any third party and shall protect its confidentiality by     
--  using the same degree of care, but not less than a reasonable      
--  degree of care, as the receiver uses to protect receiver's own     
--  Confidential Information.                                          
--  Licensee acknowledges and agrees that all output generated for     
--  Licensee by Synopsys, Inc. as described in the pertinent Program   
--  Schedule(s), or generated by Licensee through use of any Compiler  
--  licensed hereunder contains information that complies with the     
--  Virtual Component Identification Physical Tagging Standard (VCID)  
--  as maintained by the Virtual Socket Interface Alliance (VSIA).     
--  Such information may be expressed in GDSII Layer 63 or other such  
--  layer designated by the VSIA, hardware definition languages, or    
--  other formats.  Licensee is not authorized to alter or change any  
--  such information.                                                  
-----------------------------------------------------------------------
--                                                                     
--  Built for linux64 and running on linux64.                          
--                                                                     
--  Software           : Rev: S-2021.12                                
--  Library Format     : Rev: 1.05.00                                  
--  Compiler Name      : hu55npkb1p11asdrl32ksa03p1                    
--  Platform           : Linux3.10.0-1160.49.1.el7.x86_64              
--                     : #1 SMP Tue Nov 30 15:51:32 UTC 2021x86_64     
--  Date of Generation : Fri Feb 18 10:17:51 CST 2022                  
--                                                                     
-----------------------------------------------------------------------
--   --------------------------------------------------------------     
--                       Template Revision : 3.7.8                      
--   --------------------------------------------------------------     
--                      * Synchronous, 1-Port SRAM *                  
--     WARNING: Ports with underscores not allowed in VITAL models    
--                THIS IS A SYNCHRONOUS 1-PORT MEMORY MODEL           
--                                                                    
--   Memory Name:asdrlspkb1p64x16cm2sw0                               
--   Memory Size:64 words x 16 bits                                   
--                                                                    
--                               PORT NAME                            
--                               ---------                            
--               Output Ports                                         
--                                   Q[15:0]                          
--               Input Ports:                                         
--                                   ADR[5:0]                         
--                                   D[15:0]                          
--                                   WE                               
--                                   ME                               
--                                   CLK                              
--                                   TEST1                            
--                                   RM[3:0]                          
--                                   RME                              

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.TEXTIO.ALL;

entity generic_vhd_asdrlspkb1p64x16cm2sw0 is
  generic (
        words             : integer                := 64;
        addrbits          : integer                := 6;
        bits              : integer                := 16;
        rmbits            : integer                := 4;
        MES_ALL           : boolean                := true
   );
   port (
  Q : out std_logic_vector (bits-1 downto 0);
  ADR : in std_logic_vector (addrbits-1 downto 0);
  D : in std_logic_vector (bits-1 downto 0);
  WE : in std_logic;
  ME : in std_logic;
  CLK : in std_logic;
  TEST1 : in std_logic;
  RM : in std_logic_vector (rmbits-1 downto 0);
  RME : in std_logic
   );
end generic_vhd_asdrlspkb1p64x16cm2sw0;

architecture behav of generic_vhd_asdrlspkb1p64x16cm2sw0 is
    SIGNAL DataX  : std_logic_vector(bits-1 downto 0) := ( others => 'X' );
    SIGNAL DataZ  : std_logic_vector(bits-1 downto 0) := ( others => 'Z' );
    
   function to_unsigned_integer (oper : STD_LOGIC_VECTOR) return INTEGER is
        variable value : INTEGER := 0;
        variable temp_no : INTEGER := 1;
        variable temp_oper : STD_LOGIC_VECTOR(oper'range) := oper;
        variable INDEX : INTEGER := 1;
    begin
         assert oper'length <= 31
             report "VIRL_MEM_WARNING: argument is too large in TO_INTEGER, only lower 31 bits will be taken"
            severity NOTE;
 
        if (not (Is_X(oper))) then
            for I in temp_oper'reverse_range loop
                case (temp_oper(I)) is
                    when '1' =>
                               value := value + temp_no;
                    when others =>
                               null;
                end case;
                INDEX := INDEX + 1;
                exit when INDEX > 31;
                temp_no := temp_no + temp_no;
           end loop;
        else
            assert FALSE report
            "VIRL_MEM_WARNING: Illegal value detected in the conversion of TO_unsigned_INTEGER"
             severity NOTE;
            --value := integer'LEFT;
            value := 0;
        end if;
        return (value);
    end to_unsigned_integer;


SIGNAL QI : std_logic_vector ( bits-1 downto 0);
SIGNAL CLK_old : std_ulogic;
TYPE  mem_core_array is ARRAY  (0 to words - 1) of std_logic_vector(bits-1 downto 0);
subtype A_WORD is std_logic_vector( bits-1 downto 0 );
signal  RAMDATA : mem_core_array ;
SIGNAL  RM_int : std_logic_vector (3 downto 0);
SIGNAL mes_all_valid :std_logic := '0';

 
BEGIN
RM_int <= "0010" when RME = '0' else RM when RME = '1' else ( others => 'X');

-- Address Calculate
    Q <= QI;
 
port_A_B  :
process( CLK ,WE,ADR,D,ME,TEST1 )
        variable TEST1latched : std_logic;
        variable QI_test1 : std_logic_vector (bits-1 downto 0);
        variable WE_old : std_logic;
        variable WE_lat : std_logic;
        variable ADR_old : std_logic_vector(5 downto 0);
        variable ADR_lat : std_logic_vector(5 downto 0);
        variable D_old : std_logic_vector(15 downto 0);
        variable D_lat : std_logic_vector(15 downto 0);
        variable ME_old : std_logic;
        variable ME_lat : std_logic;
        variable Q_temp : std_logic_vector (bits-1 downto 0);
begin
        if( (CLK'event and CLK'last_value='1' and CLK='0') or WE'event ) then
           if ( CLK = '0') then
               WE_old := WE;
           end if;
        end if;
        if( (CLK'event and CLK'last_value='1' and CLK='0') or ADR'event ) then
           if ( CLK = '0') then
               ADR_old := ADR;
           end if;
        end if;
        if( (CLK'event and CLK'last_value='1' and CLK='0') or D'event ) then
           if ( CLK = '0') then
               D_old := D;
           end if;
        end if;
        if( (CLK'event and CLK'last_value='1' and CLK='0') or ME'event ) then
           if ( CLK = '0') then
               ME_old := ME;
           end if;
        end if;
        if( CLK'event and CLK'last_value='0' and CLK='1' ) then
               WE_lat := WE_old;
               ADR_lat := ADR_old;
               D_lat := D_old;
               ME_lat := ME_old;
       end if;
 -- CLK 0->X
        if ( CLK'event and CLK'last_value = '0' and IS_X(CLK) ) then
                if( MES_ALL and mes_all_valid /= '0'  ) then
                        assert false report "VIRL_MEM_WARNING: <<CLK(0->X) unknown>>" severity note;
                end if;
                for i in 0 to words-1 loop
                        RAMDATA(i) <= DataX;
                end loop;
                QI <= DataX;

  -- CLK X->1
        elsif( CLK'event and CLK'last_value='X' and CLK='1'  ) then
                QI <= DataX;
  -- CLK 1->X
        elsif( CLK'event and CLK'last_value='1' and IS_X(CLK) ) then
                if( MES_ALL and mes_all_valid /= '0'  ) then
                        assert false report
                        "VIRL_MEM_WARNING: <<CLK(1->X) unknown>>"
                        severity note;
                end if;
                for i in 0 to words-1 loop
                        RAMDATA(i) <= DataX;
                end loop;
                QI <= DataX;
  -- CLK 1->0
        elsif( CLK'event and CLK'last_value='1' and CLK='0' ) then
          if ( TEST1latched = '1' and ME_lat= '1' ) then
               QI <= QI_test1;
          end if;

  -- CLK 0->1
        elsif( CLK'event and CLK'last_value='0' and CLK='1' ) then
           TEST1latched := TEST1;
  -- Normal Mode
                    
                        if( IS_X(ME_lat) ) then
                         if ( MES_ALL and mes_all_valid /= '0'  ) then
                           assert false report "VIRL_MEM_WARNING: << ME is unknown >> " severity note;
                         end if;

                                        if( IS_X(ADR_lat) ) then
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                  assert false report "VIRL_MEM_WARNING: <<ADR unknown, memory broken>>" severity note;
                                                end if;
                                                for i in 0 to words-1 loop
                                                        RAMDATA(i) <= DataX;
                                                end loop;
                                        elsif( to_unsigned_integer(ADR_lat) >= words ) then
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                  assert false report "VIRL_MEM_WARNING: <<ADR greater fixed WORD space>>" severity note;
                                                end if;
                                        else
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                  assert false report "VIRL_MEM_WARNING: <<ADR Fix, But memory broken>>" severity note;
                                                end if;
                                                for i in 0 to words-1 loop
                                                        RAMDATA(i) <= DataX;
                                                end loop;
                                        end if;
                                if( WE_lat /= '1' ) then
                                  QI <= DataX;
                                end if;
  -- CLEAR none, ME=1
                        elsif( ME_lat='1' ) then
                                if( WE_lat='0' ) then
                                        if (RM_int /= "0010") then
                                          if (MES_ALL and mes_all_valid /= '0' ) then
                                            assert false report "VIRL_MEM_WARNING: <<RM don't recommended value >>" severity note;
                                          end if;
                                        end if;

                                        if( IS_X(RM_int) ) then
                                                QI <= DataX;
                                        elsif( IS_X(ADR_lat) ) then
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                  assert false report "VIRL_MEM_WARNING: <<ADR unknown>>" severity note;
                                                end if;
                                                        for i in 0 to words-1 loop
                                                                RAMDATA(i) <= DataX;
                                                        end loop;
                                                        QI <= DataX;
                                        elsif( to_unsigned_integer(ADR_lat) >= words ) then
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                  assert false report "VIRL_MEM_WARNING: <<ADR greater fixed WORD space>>" severity note;
                                                end if;
                                                        QI <= DataX;
                                        elsif( TEST1latched = 'X' ) then
                                          if( MES_ALL and mes_all_valid /= '0'  ) then
                                            assert false report "VIRL_MEM_WARNING: <<TEST1 unknown>>" severity note;
                                          end if;
                                          QI <= DataX;
                                        else
                                                if ( TEST1latched = '1' ) then
                                                        QI <= DataX;
                                                        QI_test1 := RAMDATA(to_unsigned_integer(ADR_lat));
                                                else
                                                        QI <= RAMDATA(to_unsigned_integer(ADR_lat));
                                                end if;
                                                        if (mes_all_valid = '0') then
                                                          mes_all_valid <= '1'; 
                                                        end if;
                                        end if;
                                elsif( WE_lat='1' ) then
                                        if( IS_X(ADR_lat) ) then
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                  assert false report "VIRL_MEM_WARNING: <<ADR unknown, memory broken>>" severity note;
                                                end if;
                                                for i in 0 to words-1 loop
                                                        RAMDATA(i) <= DataX;
                                                end loop;
                                        elsif( to_unsigned_integer(ADR_lat) >= words ) then
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                  assert false report "VIRL_MEM_WARNING: <<ADR greater fixed WORD space>>" severity note;
                                                end if;
                                        elsif( TEST1latched = 'X' ) then
                                          if( MES_ALL and mes_all_valid /= '0'  ) then
                                            assert false report "VIRL_MEM_WARNING: <<TEST1 unknown>>" severity note;
                                          end if;
                                           RAMDATA(to_unsigned_integer(ADR_lat)) <= DataX ;
                                          QI <= DataX;
                                        else
                                        if( IS_X(D_lat) ) then
                                            if( MES_ALL and mes_all_valid /= '0'  ) then
                                                   assert false report "VIRL_MEM_WARNING: <<D unknown>>" severity note;
                                            end if;
                                         end if;
                                                RAMDATA(to_unsigned_integer(ADR_lat)) <=  D_lat ;

                                              if (mes_all_valid = '0') then
                                                mes_all_valid <= '1'; 
                                              end if;
                                        end if;
                                elsif( IS_X(WE_lat) ) then
                                        if( MES_ALL and mes_all_valid /= '0'  ) then
                                           assert false report "VIRL_MEM_WARNING: <<WE unknown>>" severity note;
                                        end if;
                                        if( IS_X(ADR_lat) ) then
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                   assert false report "VIRL_MEM_WARNING: <<ADR unknown, memory broken>>" severity note;
                                                end if;
                                                for i in 0 to words-1 loop
                                                        RAMDATA(i) <= DataX;
                                                end loop;
                                        elsif( to_unsigned_integer(ADR_lat) >= words ) then
                                                if( MES_ALL and mes_all_valid /= '0'  ) then
                                                   assert false report "VIRL_MEM_WARNING: <<ADR greater fixed WORD space>>" severity note;
                                                end if;
                                        else
                                                RAMDATA(to_unsigned_integer(ADR_lat)) <= DataX;
                                        end if;
                                                QI <= DataX;
                                end if;

                        end if;
        end if;

     if ( TEST1'event ) then
       if( CLK='1' and ME_lat='1' ) then 
         if( WE_lat='1' ) then 
          RAMDATA(to_unsigned_integer(ADR_lat)) <= DataX ;
         end if ;
         QI <= DataX ;
       end if ;
     end if ;

        if ( TEST1'event and TEST1 = '1' ) then
              assert FALSE
              report "VIRL_MEM_WARNING: Tcc value in the RAM model is for TEST1=1,but the input value is TEST1=1 "
              severity NOTE;
         end if;
end process;
end behav;

---------------- ACTUAL MEMORY DESCRIPTION   ---------------------------

library IEEE;
library work;
use IEEE.std_logic_1164.all;

entity asdrlspkb1p64x16cm2sw0 is

  generic (
        XGenerationOn     : Boolean                := True;
        words             : integer                := 64;
        addrbits          : integer                := 6;
        rmbits            : integer                := 4;
        bits              : integer                := 16;
        MES_ALL           : boolean                := true
   );

 port (
        Q : out std_logic_vector(15 downto 0);
        ADR : in std_logic_vector(5 downto 0);
        D : in std_logic_vector(15 downto 0);
        WE : in std_logic;
        ME : in std_logic;
        CLK : in std_logic;
        TEST1 : in std_logic;
        RM : in std_logic_vector(3 downto 0);
        RME : in std_logic );

end asdrlspkb1p64x16cm2sw0;

architecture behaviour of asdrlspkb1p64x16cm2sw0 is

SIGNAL WE_buf : STD_LOGIC;
SIGNAL ME_buf : STD_LOGIC;

component generic_vhd_asdrlspkb1p64x16cm2sw0
  generic (
        words             : integer                := 64;
        addrbits          : integer                := 6;
        rmbits            : integer                := 4;
        bits              : integer                := 16;
        MES_ALL           : boolean                := true
  );

  port ( 
        Q : out std_logic_vector (bits-1 downto 0);
  ADR : in std_logic_vector (addrbits-1 downto 0);
  D : in std_logic_vector (bits-1 downto 0);
  WE : in std_logic;
  ME : in std_logic;
  CLK : in std_logic;
  TEST1 : in std_logic;
  RM : in std_logic_vector (rmbits-1 downto 0);
  RME : in std_logic
  );

end component;

  for uut : generic_vhd_asdrlspkb1p64x16cm2sw0 use entity work.generic_vhd_asdrlspkb1p64x16cm2sw0(behav);
  BEGIN

  uut : generic_vhd_asdrlspkb1p64x16cm2sw0
  generic map (
        words                  => 64,
        addrbits               => 6,
        rmbits                 => 4,
        bits                   => 16,
        MES_ALL                => true
  )
  port map (
   Q =>  Q,
   ADR =>    ADR,
   D =>    D,
   WE =>    WE_buf,
   ME =>    ME_buf,
   CLK =>    CLK,
   TEST1 =>    TEST1,
   RM =>    RM,
   RME =>    RME
  );
   WE_buf <=  ( WE) ;
   ME_buf <=  ( ME) ;


end behaviour;

configuration conf_asdrlspkb1p64x16cm2sw0_behaviour of asdrlspkb1p64x16cm2sw0 is
for behaviour
end for;
end conf_asdrlspkb1p64x16cm2sw0_behaviour;
