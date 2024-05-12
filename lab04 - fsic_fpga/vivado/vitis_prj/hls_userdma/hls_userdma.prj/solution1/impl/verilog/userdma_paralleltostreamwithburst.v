// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module userdma_paralleltostreamwithburst (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        m_axi_gmem1_AWVALID,
        m_axi_gmem1_AWREADY,
        m_axi_gmem1_AWADDR,
        m_axi_gmem1_AWID,
        m_axi_gmem1_AWLEN,
        m_axi_gmem1_AWSIZE,
        m_axi_gmem1_AWBURST,
        m_axi_gmem1_AWLOCK,
        m_axi_gmem1_AWCACHE,
        m_axi_gmem1_AWPROT,
        m_axi_gmem1_AWQOS,
        m_axi_gmem1_AWREGION,
        m_axi_gmem1_AWUSER,
        m_axi_gmem1_WVALID,
        m_axi_gmem1_WREADY,
        m_axi_gmem1_WDATA,
        m_axi_gmem1_WSTRB,
        m_axi_gmem1_WLAST,
        m_axi_gmem1_WID,
        m_axi_gmem1_WUSER,
        m_axi_gmem1_ARVALID,
        m_axi_gmem1_ARREADY,
        m_axi_gmem1_ARADDR,
        m_axi_gmem1_ARID,
        m_axi_gmem1_ARLEN,
        m_axi_gmem1_ARSIZE,
        m_axi_gmem1_ARBURST,
        m_axi_gmem1_ARLOCK,
        m_axi_gmem1_ARCACHE,
        m_axi_gmem1_ARPROT,
        m_axi_gmem1_ARQOS,
        m_axi_gmem1_ARREGION,
        m_axi_gmem1_ARUSER,
        m_axi_gmem1_RVALID,
        m_axi_gmem1_RREADY,
        m_axi_gmem1_RDATA,
        m_axi_gmem1_RLAST,
        m_axi_gmem1_RID,
        m_axi_gmem1_RFIFONUM,
        m_axi_gmem1_RUSER,
        m_axi_gmem1_RRESP,
        m_axi_gmem1_BVALID,
        m_axi_gmem1_BREADY,
        m_axi_gmem1_BRESP,
        m_axi_gmem1_BID,
        m_axi_gmem1_BUSER,
        in_memory,
        in_en_clrsts,
        in_Img_width,
        in_m2s_len,
        outbuf_din,
        outbuf_num_data_valid,
        outbuf_fifo_cap,
        outbuf_full_n,
        outbuf_write,
        outcount44_din,
        outcount44_num_data_valid,
        outcount44_fifo_cap,
        outcount44_full_n,
        outcount44_write,
        m2s_enb_clrsts_c_din,
        m2s_enb_clrsts_c_num_data_valid,
        m2s_enb_clrsts_c_fifo_cap,
        m2s_enb_clrsts_c_full_n,
        m2s_enb_clrsts_c_write
);

parameter    ap_ST_fsm_state1 = 22'd1;
parameter    ap_ST_fsm_state2 = 22'd2;
parameter    ap_ST_fsm_state3 = 22'd4;
parameter    ap_ST_fsm_state4 = 22'd8;
parameter    ap_ST_fsm_state5 = 22'd16;
parameter    ap_ST_fsm_state6 = 22'd32;
parameter    ap_ST_fsm_state7 = 22'd64;
parameter    ap_ST_fsm_state8 = 22'd128;
parameter    ap_ST_fsm_state9 = 22'd256;
parameter    ap_ST_fsm_state10 = 22'd512;
parameter    ap_ST_fsm_state11 = 22'd1024;
parameter    ap_ST_fsm_state12 = 22'd2048;
parameter    ap_ST_fsm_state13 = 22'd4096;
parameter    ap_ST_fsm_state14 = 22'd8192;
parameter    ap_ST_fsm_state15 = 22'd16384;
parameter    ap_ST_fsm_state16 = 22'd32768;
parameter    ap_ST_fsm_state17 = 22'd65536;
parameter    ap_ST_fsm_state18 = 22'd131072;
parameter    ap_ST_fsm_state19 = 22'd262144;
parameter    ap_ST_fsm_state20 = 22'd524288;
parameter    ap_ST_fsm_state21 = 22'd1048576;
parameter    ap_ST_fsm_state22 = 22'd2097152;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem1_AWVALID;
input   m_axi_gmem1_AWREADY;
output  [63:0] m_axi_gmem1_AWADDR;
output  [0:0] m_axi_gmem1_AWID;
output  [31:0] m_axi_gmem1_AWLEN;
output  [2:0] m_axi_gmem1_AWSIZE;
output  [1:0] m_axi_gmem1_AWBURST;
output  [1:0] m_axi_gmem1_AWLOCK;
output  [3:0] m_axi_gmem1_AWCACHE;
output  [2:0] m_axi_gmem1_AWPROT;
output  [3:0] m_axi_gmem1_AWQOS;
output  [3:0] m_axi_gmem1_AWREGION;
output  [0:0] m_axi_gmem1_AWUSER;
output   m_axi_gmem1_WVALID;
input   m_axi_gmem1_WREADY;
output  [31:0] m_axi_gmem1_WDATA;
output  [3:0] m_axi_gmem1_WSTRB;
output   m_axi_gmem1_WLAST;
output  [0:0] m_axi_gmem1_WID;
output  [0:0] m_axi_gmem1_WUSER;
output   m_axi_gmem1_ARVALID;
input   m_axi_gmem1_ARREADY;
output  [63:0] m_axi_gmem1_ARADDR;
output  [0:0] m_axi_gmem1_ARID;
output  [31:0] m_axi_gmem1_ARLEN;
output  [2:0] m_axi_gmem1_ARSIZE;
output  [1:0] m_axi_gmem1_ARBURST;
output  [1:0] m_axi_gmem1_ARLOCK;
output  [3:0] m_axi_gmem1_ARCACHE;
output  [2:0] m_axi_gmem1_ARPROT;
output  [3:0] m_axi_gmem1_ARQOS;
output  [3:0] m_axi_gmem1_ARREGION;
output  [0:0] m_axi_gmem1_ARUSER;
input   m_axi_gmem1_RVALID;
output   m_axi_gmem1_RREADY;
input  [31:0] m_axi_gmem1_RDATA;
input   m_axi_gmem1_RLAST;
input  [0:0] m_axi_gmem1_RID;
input  [8:0] m_axi_gmem1_RFIFONUM;
input  [0:0] m_axi_gmem1_RUSER;
input  [1:0] m_axi_gmem1_RRESP;
input   m_axi_gmem1_BVALID;
output   m_axi_gmem1_BREADY;
input  [1:0] m_axi_gmem1_BRESP;
input  [0:0] m_axi_gmem1_BID;
input  [0:0] m_axi_gmem1_BUSER;
input  [63:0] in_memory;
input  [0:0] in_en_clrsts;
input  [31:0] in_Img_width;
input  [31:0] in_m2s_len;
output  [39:0] outbuf_din;
input  [10:0] outbuf_num_data_valid;
input  [10:0] outbuf_fifo_cap;
input   outbuf_full_n;
output   outbuf_write;
output  [31:0] outcount44_din;
input  [6:0] outcount44_num_data_valid;
input  [6:0] outcount44_fifo_cap;
input   outcount44_full_n;
output   outcount44_write;
output  [0:0] m2s_enb_clrsts_c_din;
input  [1:0] m2s_enb_clrsts_c_num_data_valid;
input  [1:0] m2s_enb_clrsts_c_fifo_cap;
input   m2s_enb_clrsts_c_full_n;
output   m2s_enb_clrsts_c_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_gmem1_ARVALID;
reg[63:0] m_axi_gmem1_ARADDR;
reg[0:0] m_axi_gmem1_ARID;
reg[31:0] m_axi_gmem1_ARLEN;
reg[2:0] m_axi_gmem1_ARSIZE;
reg[1:0] m_axi_gmem1_ARBURST;
reg[1:0] m_axi_gmem1_ARLOCK;
reg[3:0] m_axi_gmem1_ARCACHE;
reg[2:0] m_axi_gmem1_ARPROT;
reg[3:0] m_axi_gmem1_ARQOS;
reg[3:0] m_axi_gmem1_ARREGION;
reg[0:0] m_axi_gmem1_ARUSER;
reg m_axi_gmem1_RREADY;
reg outbuf_write;
reg outcount44_write;
reg m2s_enb_clrsts_c_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [21:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [0:0] first;
reg   [31:0] m2s_len;
reg    gmem1_blk_n_AR;
wire    ap_CS_fsm_state4;
reg    outcount44_blk_n;
wire    ap_CS_fsm_state22;
wire   [0:0] in_en_clrsts_read_read_fu_118_p2;
reg    m2s_enb_clrsts_c_blk_n;
wire   [32:0] sub_i_i_fu_218_p2;
reg   [32:0] sub_i_i_reg_364;
wire   [30:0] trunc_ln83_fu_250_p1;
reg   [30:0] trunc_ln83_reg_372;
wire    ap_CS_fsm_state2;
wire   [30:0] sub_fu_254_p2;
reg   [30:0] sub_reg_377;
wire   [0:0] icmp_ln103_fu_260_p2;
reg   [0:0] icmp_ln103_reg_382;
reg   [61:0] trunc_ln1_reg_386;
reg   [31:0] grp_load_fu_191_p1;
wire    ap_CS_fsm_state3;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_done;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_idle;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_ready;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWVALID;
wire   [63:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWADDR;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWID;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWLEN;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWSIZE;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWBURST;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWLOCK;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWCACHE;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWPROT;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWQOS;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWREGION;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WVALID;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WDATA;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WSTRB;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WLAST;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WID;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARVALID;
wire   [63:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARADDR;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARID;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARLEN;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARSIZE;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARBURST;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARLOCK;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARCACHE;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARPROT;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARQOS;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARREGION;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_RREADY;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_BREADY;
wire   [39:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_outbuf_din;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_outbuf_write;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_dec_phi_out;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_dec_phi_out_ap_vld;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m2s_len_o;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m2s_len_o_ap_vld;
reg  signed [31:0] ap_phi_mux_count_1_phi_fu_156_p4;
reg  signed [31:0] count_1_reg_151;
wire   [0:0] icmp_ln96_fu_238_p2;
reg   [31:0] ap_phi_mux_empty_58_phi_fu_167_p4;
reg   [31:0] empty_58_reg_164;
reg    ap_block_state22;
reg    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start_reg;
wire    ap_CS_fsm_state20;
wire    ap_CS_fsm_state21;
wire  signed [63:0] sext_ln103_fu_287_p1;
reg    ap_block_state1;
wire   [0:0] first_load_load_fu_198_p1;
reg   [31:0] ap_sig_allocacmp_m2s_len_load;
reg   [63:0] idx_fu_98;
wire   [63:0] add_ln126_fu_305_p2;
wire   [0:0] icmp_ln128_fu_311_p2;
reg   [31:0] count_fu_102;
wire   [32:0] in_Img_width_cast_fu_214_p1;
wire   [63:0] shl_ln103_fu_266_p2;
wire   [63:0] add_ln103_fu_272_p2;
wire  signed [63:0] sext_ln126_fu_301_p1;
reg   [21:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
reg    ap_ST_fsm_state21_blk;
reg    ap_ST_fsm_state22_blk;
reg    ap_condition_507;
reg    ap_condition_298;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 22'd1;
#0 first = 1'd1;
#0 m2s_len = 32'd0;
#0 grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start_reg = 1'b0;
end

userdma_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2 grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start),
    .ap_done(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_done),
    .ap_idle(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_idle),
    .ap_ready(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_ready),
    .m_axi_gmem1_AWVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWVALID),
    .m_axi_gmem1_AWREADY(1'b0),
    .m_axi_gmem1_AWADDR(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWADDR),
    .m_axi_gmem1_AWID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWID),
    .m_axi_gmem1_AWLEN(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWLEN),
    .m_axi_gmem1_AWSIZE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWSIZE),
    .m_axi_gmem1_AWBURST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWBURST),
    .m_axi_gmem1_AWLOCK(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWLOCK),
    .m_axi_gmem1_AWCACHE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWCACHE),
    .m_axi_gmem1_AWPROT(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWPROT),
    .m_axi_gmem1_AWQOS(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWQOS),
    .m_axi_gmem1_AWREGION(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWREGION),
    .m_axi_gmem1_AWUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_AWUSER),
    .m_axi_gmem1_WVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WVALID),
    .m_axi_gmem1_WREADY(1'b0),
    .m_axi_gmem1_WDATA(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WDATA),
    .m_axi_gmem1_WSTRB(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WSTRB),
    .m_axi_gmem1_WLAST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WLAST),
    .m_axi_gmem1_WID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WID),
    .m_axi_gmem1_WUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_WUSER),
    .m_axi_gmem1_ARVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARVALID),
    .m_axi_gmem1_ARREADY(m_axi_gmem1_ARREADY),
    .m_axi_gmem1_ARADDR(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARADDR),
    .m_axi_gmem1_ARID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARID),
    .m_axi_gmem1_ARLEN(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARLEN),
    .m_axi_gmem1_ARSIZE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARSIZE),
    .m_axi_gmem1_ARBURST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARBURST),
    .m_axi_gmem1_ARLOCK(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARLOCK),
    .m_axi_gmem1_ARCACHE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARCACHE),
    .m_axi_gmem1_ARPROT(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARPROT),
    .m_axi_gmem1_ARQOS(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARQOS),
    .m_axi_gmem1_ARREGION(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARREGION),
    .m_axi_gmem1_ARUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARUSER),
    .m_axi_gmem1_RVALID(m_axi_gmem1_RVALID),
    .m_axi_gmem1_RREADY(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_RREADY),
    .m_axi_gmem1_RDATA(m_axi_gmem1_RDATA),
    .m_axi_gmem1_RLAST(m_axi_gmem1_RLAST),
    .m_axi_gmem1_RID(m_axi_gmem1_RID),
    .m_axi_gmem1_RFIFONUM(m_axi_gmem1_RFIFONUM),
    .m_axi_gmem1_RUSER(m_axi_gmem1_RUSER),
    .m_axi_gmem1_RRESP(m_axi_gmem1_RRESP),
    .m_axi_gmem1_BVALID(1'b0),
    .m_axi_gmem1_BREADY(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_BREADY),
    .m_axi_gmem1_BRESP(2'd0),
    .m_axi_gmem1_BID(1'd0),
    .m_axi_gmem1_BUSER(1'd0),
    .outbuf_din(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_outbuf_din),
    .outbuf_num_data_valid(11'd0),
    .outbuf_fifo_cap(11'd0),
    .outbuf_full_n(outbuf_full_n),
    .outbuf_write(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_outbuf_write),
    .sext_ln103(trunc_ln1_reg_386),
    .trunc_ln(trunc_ln83_reg_372),
    .sub(sub_reg_377),
    .in_m2s_len(in_m2s_len),
    .sub_i_i(sub_i_i_reg_364),
    .dec_phi_out(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_dec_phi_out),
    .dec_phi_out_ap_vld(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_dec_phi_out_ap_vld),
    .m2s_len_i(m2s_len),
    .m2s_len_o(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m2s_len_o),
    .m2s_len_o_ap_vld(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m2s_len_o_ap_vld)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state22) & ((icmp_ln128_fu_311_p2 == 1'd1) | (in_en_clrsts_read_read_fu_118_p2 == 1'd1)))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state20)) begin
            grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start_reg <= 1'b1;
        end else if ((grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_ready == 1'b1)) begin
            grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        if ((icmp_ln96_fu_238_p2 == 1'd1)) begin
            count_1_reg_151 <= 32'd16;
        end else if ((icmp_ln96_fu_238_p2 == 1'd0)) begin
            count_1_reg_151 <= count_fu_102;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((in_en_clrsts == 1'd0)) begin
        if ((1'b1 == ap_condition_298)) begin
            count_fu_102 <= grp_load_fu_191_p1;
        end else if ((1'b1 == ap_condition_507)) begin
            count_fu_102 <= ap_phi_mux_empty_58_phi_fu_167_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state22) & (icmp_ln103_reg_382 == 1'd1) & (in_en_clrsts == 1'd0))) begin
        empty_58_reg_164 <= grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_dec_phi_out;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        empty_58_reg_164 <= grp_load_fu_191_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (first_load_load_fu_198_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts == 1'd0))) begin
        first <= 1'd0;
    end else if (((icmp_ln96_fu_238_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        first <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if ((in_en_clrsts == 1'd0)) begin
        if ((1'b1 == ap_condition_298)) begin
            idx_fu_98 <= 64'd0;
        end else if ((1'b1 == ap_condition_507)) begin
            idx_fu_98 <= add_ln126_fu_305_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (first_load_load_fu_198_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts == 1'd0))) begin
        m2s_len <= in_m2s_len;
    end else if (((grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m2s_len_o_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state21))) begin
        m2s_len <= grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m2s_len_o;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        icmp_ln103_reg_382 <= icmp_ln103_fu_260_p2;
        sub_reg_377 <= sub_fu_254_p2;
        trunc_ln83_reg_372 <= trunc_ln83_fu_250_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (in_en_clrsts == 1'd0))) begin
        sub_i_i_reg_364 <= sub_i_i_fu_218_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln103_fu_260_p2 == 1'd1))) begin
        trunc_ln1_reg_386 <= {{add_ln103_fu_272_p2[63:2]}};
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

always @ (*) begin
    if ((grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_done == 1'b0)) begin
        ap_ST_fsm_state21_blk = 1'b1;
    end else begin
        ap_ST_fsm_state21_blk = 1'b0;
    end
end

always @ (*) begin
    if (((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0))) begin
        ap_ST_fsm_state22_blk = 1'b1;
    end else begin
        ap_ST_fsm_state22_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((m_axi_gmem1_ARREADY == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((~((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state22) & ((icmp_ln128_fu_311_p2 == 1'd1) | (in_en_clrsts_read_read_fu_118_p2 == 1'd1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        if ((icmp_ln96_fu_238_p2 == 1'd1)) begin
            ap_phi_mux_count_1_phi_fu_156_p4 = 32'd16;
        end else if ((icmp_ln96_fu_238_p2 == 1'd0)) begin
            ap_phi_mux_count_1_phi_fu_156_p4 = count_fu_102;
        end else begin
            ap_phi_mux_count_1_phi_fu_156_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_count_1_phi_fu_156_p4 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state22) & (icmp_ln103_reg_382 == 1'd1) & (in_en_clrsts == 1'd0))) begin
        ap_phi_mux_empty_58_phi_fu_167_p4 = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_dec_phi_out;
    end else begin
        ap_phi_mux_empty_58_phi_fu_167_p4 = empty_58_reg_164;
    end
end

always @ (*) begin
    if ((~((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state22) & ((icmp_ln128_fu_311_p2 == 1'd1) | (in_en_clrsts_read_read_fu_118_p2 == 1'd1)))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((first_load_load_fu_198_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts == 1'd0))) begin
        ap_sig_allocacmp_m2s_len_load = in_m2s_len;
    end else begin
        ap_sig_allocacmp_m2s_len_load = m2s_len;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        gmem1_blk_n_AR = m_axi_gmem1_ARREADY;
    end else begin
        gmem1_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_load_fu_191_p1 = m2s_len;
    end else if (((1'b1 == ap_CS_fsm_state1) & (in_en_clrsts == 1'd0))) begin
        grp_load_fu_191_p1 = ap_sig_allocacmp_m2s_len_load;
    end else begin
        grp_load_fu_191_p1 = 'bx;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m2s_enb_clrsts_c_blk_n = m2s_enb_clrsts_c_full_n;
    end else begin
        m2s_enb_clrsts_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m2s_enb_clrsts_c_write = 1'b1;
    end else begin
        m2s_enb_clrsts_c_write = 1'b0;
    end
end

always @ (*) begin
    if (((m_axi_gmem1_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem1_ARADDR = sext_ln103_fu_287_p1;
    end else if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARADDR = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARADDR;
    end else begin
        m_axi_gmem1_ARADDR = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARBURST = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARBURST;
    end else begin
        m_axi_gmem1_ARBURST = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARCACHE = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARCACHE;
    end else begin
        m_axi_gmem1_ARCACHE = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARID = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARID;
    end else begin
        m_axi_gmem1_ARID = 1'd0;
    end
end

always @ (*) begin
    if (((m_axi_gmem1_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem1_ARLEN = count_1_reg_151;
    end else if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARLEN = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARLEN;
    end else begin
        m_axi_gmem1_ARLEN = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARLOCK = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARLOCK;
    end else begin
        m_axi_gmem1_ARLOCK = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARPROT = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARPROT;
    end else begin
        m_axi_gmem1_ARPROT = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARQOS = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARQOS;
    end else begin
        m_axi_gmem1_ARQOS = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARREGION = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARREGION;
    end else begin
        m_axi_gmem1_ARREGION = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARSIZE = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARSIZE;
    end else begin
        m_axi_gmem1_ARSIZE = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARUSER = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARUSER;
    end else begin
        m_axi_gmem1_ARUSER = 1'd0;
    end
end

always @ (*) begin
    if (((m_axi_gmem1_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem1_ARVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_ARVALID = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_ARVALID;
    end else begin
        m_axi_gmem1_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state20))) begin
        m_axi_gmem1_RREADY = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_m_axi_gmem1_RREADY;
    end else begin
        m_axi_gmem1_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state21)) begin
        outbuf_write = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_outbuf_write;
    end else begin
        outbuf_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state22) & (in_en_clrsts == 1'd0))) begin
        outcount44_blk_n = outcount44_full_n;
    end else begin
        outcount44_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state22) & (in_en_clrsts == 1'd0))) begin
        outcount44_write = 1'b1;
    end else begin
        outcount44_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts_read_read_fu_118_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state22;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln103_fu_260_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state4 : begin
            if (((m_axi_gmem1_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            if (((1'b1 == ap_CS_fsm_state21) & (grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state22;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state21;
            end
        end
        ap_ST_fsm_state22 : begin
            if ((~((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state22) & ((icmp_ln128_fu_311_p2 == 1'd1) | (in_en_clrsts_read_read_fu_118_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0)) & (icmp_ln128_fu_311_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state22) & (in_en_clrsts == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state22;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln103_fu_272_p2 = (shl_ln103_fu_266_p2 + in_memory);

assign add_ln126_fu_305_p2 = ($signed(sext_ln126_fu_301_p1) + $signed(idx_fu_98));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];

assign ap_CS_fsm_state22 = ap_CS_fsm[32'd21];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0));
end

always @ (*) begin
    ap_block_state22 = ((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_298 = (~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1));
end

always @ (*) begin
    ap_condition_507 = (~((in_en_clrsts == 1'd0) & (outcount44_full_n == 1'b0)) & (icmp_ln128_fu_311_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state22));
end

assign first_load_load_fu_198_p1 = first;

assign grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_ap_start_reg;

assign icmp_ln103_fu_260_p2 = (($signed(ap_phi_mux_count_1_phi_fu_156_p4) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign icmp_ln128_fu_311_p2 = ((ap_phi_mux_empty_58_phi_fu_167_p4 == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln96_fu_238_p2 = (($signed(count_fu_102) > $signed(32'd16)) ? 1'b1 : 1'b0);

assign in_Img_width_cast_fu_214_p1 = in_Img_width;

assign in_en_clrsts_read_read_fu_118_p2 = in_en_clrsts;

assign m2s_enb_clrsts_c_din = in_en_clrsts;

assign m_axi_gmem1_AWADDR = 64'd0;

assign m_axi_gmem1_AWBURST = 2'd0;

assign m_axi_gmem1_AWCACHE = 4'd0;

assign m_axi_gmem1_AWID = 1'd0;

assign m_axi_gmem1_AWLEN = 32'd0;

assign m_axi_gmem1_AWLOCK = 2'd0;

assign m_axi_gmem1_AWPROT = 3'd0;

assign m_axi_gmem1_AWQOS = 4'd0;

assign m_axi_gmem1_AWREGION = 4'd0;

assign m_axi_gmem1_AWSIZE = 3'd0;

assign m_axi_gmem1_AWUSER = 1'd0;

assign m_axi_gmem1_AWVALID = 1'b0;

assign m_axi_gmem1_BREADY = 1'b0;

assign m_axi_gmem1_WDATA = 32'd0;

assign m_axi_gmem1_WID = 1'd0;

assign m_axi_gmem1_WLAST = 1'b0;

assign m_axi_gmem1_WSTRB = 4'd0;

assign m_axi_gmem1_WUSER = 1'd0;

assign m_axi_gmem1_WVALID = 1'b0;

assign outbuf_din = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_103_2_fu_173_outbuf_din;

assign outcount44_din = count_1_reg_151;

assign sext_ln103_fu_287_p1 = $signed(trunc_ln1_reg_386);

assign sext_ln126_fu_301_p1 = count_1_reg_151;

assign shl_ln103_fu_266_p2 = idx_fu_98 << 64'd2;

assign sub_fu_254_p2 = ($signed(trunc_ln83_fu_250_p1) + $signed(31'd2147483647));

assign sub_i_i_fu_218_p2 = ($signed(in_Img_width_cast_fu_214_p1) + $signed(33'd8589934591));

assign trunc_ln83_fu_250_p1 = ap_phi_mux_count_1_phi_fu_156_p4[30:0];

endmodule //userdma_paralleltostreamwithburst
