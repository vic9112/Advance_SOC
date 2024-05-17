-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity userdma_getinstream_Pipeline_VITIS_LOOP_49_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    inStreamTop_TVALID : IN STD_LOGIC;
    inbuf_din : OUT STD_LOGIC_VECTOR (32 downto 0);
    inbuf_num_data_valid : IN STD_LOGIC_VECTOR (6 downto 0);
    inbuf_fifo_cap : IN STD_LOGIC_VECTOR (6 downto 0);
    inbuf_full_n : IN STD_LOGIC;
    inbuf_write : OUT STD_LOGIC;
    incount40_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    incount40_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    incount40_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    incount40_full_n : IN STD_LOGIC;
    incount40_write : OUT STD_LOGIC;
    in_len_V_load : IN STD_LOGIC_VECTOR (31 downto 0);
    inStreamTop_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    inStreamTop_TREADY : OUT STD_LOGIC;
    inStreamTop_TKEEP : IN STD_LOGIC_VECTOR (3 downto 0);
    inStreamTop_TSTRB : IN STD_LOGIC_VECTOR (3 downto 0);
    inStreamTop_TUSER : IN STD_LOGIC_VECTOR (6 downto 0);
    inStreamTop_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    in_s2m_len : IN STD_LOGIC_VECTOR (31 downto 0);
    tmp_last_V_out : OUT STD_LOGIC_VECTOR (0 downto 0);
    tmp_last_V_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of userdma_getinstream_Pipeline_VITIS_LOOP_49_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv28_0 : STD_LOGIC_VECTOR (27 downto 0) := "0000000000000000000000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal or_ln66_reg_234 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln1073_fu_184_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal inStreamTop_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal inbuf_blk_n : STD_LOGIC;
    signal incount40_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal tmp_last_V_reg_223 : STD_LOGIC_VECTOR (0 downto 0);
    signal count_5_fu_150_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal count_5_reg_228 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln66_fu_178_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_reg_238 : STD_LOGIC_VECTOR (0 downto 0);
    signal count_fu_62 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_allocacmp_count_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal empty_fu_66 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln886_fu_156_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_fu_162_p4 : STD_LOGIC_VECTOR (27 downto 0);
    signal icmp_ln66_fu_172_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component userdma_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component userdma_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_loop_exit_ready_pp0_iter2_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_loop_exit_ready = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                ap_loop_exit_ready_pp0_iter2_reg <= ap_const_logic_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
            end if; 
        end if;
    end process;

    count_fu_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (or_ln66_reg_234 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1)))) then 
                count_fu_62 <= ap_const_lv32_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (or_ln66_reg_234 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
                count_fu_62 <= count_5_reg_228;
            end if; 
        end if;
    end process;

    empty_fu_66_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_fu_66 <= in_len_V_load;
                elsif (((icmp_ln1073_fu_184_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_fu_66 <= add_ln886_fu_156_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                count_5_reg_228 <= count_5_fu_150_p2;
                icmp_ln1073_reg_238 <= icmp_ln1073_fu_184_p2;
                or_ln66_reg_234 <= or_ln66_fu_178_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_last_V_reg_223 <= inStreamTop_TLAST;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln886_fu_156_p2 <= std_logic_vector(unsigned(empty_fu_66) + unsigned(ap_const_lv32_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, inStreamTop_TVALID, inbuf_full_n, incount40_full_n, or_ln66_reg_234)
    begin
                ap_block_pp0_stage0_01001 <= (((or_ln66_reg_234 = ap_const_lv1_1) and (incount40_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((inbuf_full_n = ap_const_logic_0) or (inStreamTop_TVALID = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, inStreamTop_TVALID, inbuf_full_n, incount40_full_n, or_ln66_reg_234)
    begin
                ap_block_pp0_stage0_11001 <= (((or_ln66_reg_234 = ap_const_lv1_1) and (incount40_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((inbuf_full_n = ap_const_logic_0) or (inStreamTop_TVALID = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, inStreamTop_TVALID, inbuf_full_n, incount40_full_n, or_ln66_reg_234)
    begin
                ap_block_pp0_stage0_subdone <= (((or_ln66_reg_234 = ap_const_lv1_1) and (incount40_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((inbuf_full_n = ap_const_logic_0) or (inStreamTop_TVALID = ap_const_logic_0))));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state2_pp0_stage0_iter1_assign_proc : process(inStreamTop_TVALID, inbuf_full_n)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((inbuf_full_n = ap_const_logic_0) or (inStreamTop_TVALID = ap_const_logic_0));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(incount40_full_n, or_ln66_reg_234)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((or_ln66_reg_234 = ap_const_lv1_1) and (incount40_full_n = ap_const_logic_0));
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln1073_fu_184_p2)
    begin
        if (((icmp_ln1073_fu_184_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_count_4_assign_proc : process(ap_enable_reg_pp0_iter2, or_ln66_reg_234, ap_block_pp0_stage0, count_5_reg_228, count_fu_62)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
            if ((or_ln66_reg_234 = ap_const_lv1_1)) then 
                ap_sig_allocacmp_count_4 <= ap_const_lv32_0;
            elsif ((or_ln66_reg_234 = ap_const_lv1_0)) then 
                ap_sig_allocacmp_count_4 <= count_5_reg_228;
            else 
                ap_sig_allocacmp_count_4 <= count_fu_62;
            end if;
        else 
            ap_sig_allocacmp_count_4 <= count_fu_62;
        end if; 
    end process;

    count_5_fu_150_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_count_4) + unsigned(ap_const_lv32_1));
    icmp_ln1073_fu_184_p2 <= "1" when (unsigned(add_ln886_fu_156_p2) < unsigned(in_s2m_len)) else "0";
    icmp_ln66_fu_172_p2 <= "1" when (signed(tmp_fu_162_p4) > signed(ap_const_lv28_0)) else "0";

    inStreamTop_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, inStreamTop_TVALID, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            inStreamTop_TDATA_blk_n <= inStreamTop_TVALID;
        else 
            inStreamTop_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    inStreamTop_TREADY_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            inStreamTop_TREADY <= ap_const_logic_1;
        else 
            inStreamTop_TREADY <= ap_const_logic_0;
        end if; 
    end process;


    inbuf_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, inbuf_full_n, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            inbuf_blk_n <= inbuf_full_n;
        else 
            inbuf_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    inbuf_din <= (inStreamTop_TLAST & inStreamTop_TDATA);

    inbuf_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            inbuf_write <= ap_const_logic_1;
        else 
            inbuf_write <= ap_const_logic_0;
        end if; 
    end process;


    incount40_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, incount40_full_n, or_ln66_reg_234, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (or_ln66_reg_234 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            incount40_blk_n <= incount40_full_n;
        else 
            incount40_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    incount40_din <= count_5_reg_228;

    incount40_write_assign_proc : process(ap_enable_reg_pp0_iter2, or_ln66_reg_234, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (or_ln66_reg_234 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            incount40_write <= ap_const_logic_1;
        else 
            incount40_write <= ap_const_logic_0;
        end if; 
    end process;

    or_ln66_fu_178_p2 <= (inStreamTop_TLAST or icmp_ln66_fu_172_p2);
    tmp_fu_162_p4 <= count_5_fu_150_p2(31 downto 4);
    tmp_last_V_out <= tmp_last_V_reg_223;

    tmp_last_V_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln1073_reg_238)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1073_reg_238 = ap_const_lv1_0))) then 
            tmp_last_V_out_ap_vld <= ap_const_logic_1;
        else 
            tmp_last_V_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

end behav;
