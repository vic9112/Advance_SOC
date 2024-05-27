// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module userdma_sendoutstream (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        outbuf_dout,
        outbuf_num_data_valid,
        outbuf_fifo_cap,
        outbuf_empty_n,
        outbuf_read,
        in_en_clrsts_dout,
        in_en_clrsts_num_data_valid,
        in_en_clrsts_fifo_cap,
        in_en_clrsts_empty_n,
        in_en_clrsts_read,
        m2s_buf_sts,
        m2s_buf_sts_ap_vld,
        outStreamTop_TDATA,
        outStreamTop_TVALID,
        outStreamTop_TREADY,
        outStreamTop_TKEEP,
        outStreamTop_TSTRB,
        outStreamTop_TUSER,
        outStreamTop_TLAST
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [32:0] outbuf_dout;
input  [6:0] outbuf_num_data_valid;
input  [6:0] outbuf_fifo_cap;
input   outbuf_empty_n;
output   outbuf_read;
input  [0:0] in_en_clrsts_dout;
input  [1:0] in_en_clrsts_num_data_valid;
input  [1:0] in_en_clrsts_fifo_cap;
input   in_en_clrsts_empty_n;
output   in_en_clrsts_read;
output  [0:0] m2s_buf_sts;
output   m2s_buf_sts_ap_vld;
output  [31:0] outStreamTop_TDATA;
output   outStreamTop_TVALID;
input   outStreamTop_TREADY;
output  [3:0] outStreamTop_TKEEP;
output  [3:0] outStreamTop_TSTRB;
output  [1:0] outStreamTop_TUSER;
output  [0:0] outStreamTop_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg outbuf_read;
reg in_en_clrsts_read;
reg[0:0] m2s_buf_sts;
reg m2s_buf_sts_ap_vld;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    in_en_clrsts_blk_n;
reg   [0:0] in_en_clrsts_read_reg_87;
wire    grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start;
wire    grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_done;
wire    grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_idle;
wire    grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_ready;
wire    grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outbuf_read;
wire    grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TREADY;
wire   [31:0] grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TDATA;
wire    grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TVALID;
wire   [3:0] grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TKEEP;
wire   [3:0] grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TSTRB;
wire   [1:0] grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TUSER;
wire   [0:0] grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TLAST;
reg    grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg    ap_block_state1;
wire   [0:0] xor_ln127_fu_81_p2;
reg   [0:0] m2s_buf_sts_preg;
wire    ap_CS_fsm_state4;
wire    regslice_both_outStreamTop_V_data_V_U_apdone_blk;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    outStreamTop_TVALID_int_regslice;
wire    outStreamTop_TREADY_int_regslice;
wire    regslice_both_outStreamTop_V_data_V_U_vld_out;
wire    regslice_both_outStreamTop_V_keep_V_U_apdone_blk;
wire    regslice_both_outStreamTop_V_keep_V_U_ack_in_dummy;
wire    regslice_both_outStreamTop_V_keep_V_U_vld_out;
wire    regslice_both_outStreamTop_V_strb_V_U_apdone_blk;
wire    regslice_both_outStreamTop_V_strb_V_U_ack_in_dummy;
wire    regslice_both_outStreamTop_V_strb_V_U_vld_out;
wire    regslice_both_outStreamTop_V_user_V_U_apdone_blk;
wire    regslice_both_outStreamTop_V_user_V_U_ack_in_dummy;
wire    regslice_both_outStreamTop_V_user_V_U_vld_out;
wire    regslice_both_outStreamTop_V_last_V_U_apdone_blk;
wire    regslice_both_outStreamTop_V_last_V_U_ack_in_dummy;
wire    regslice_both_outStreamTop_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start_reg = 1'b0;
#0 m2s_buf_sts_preg = 1'd0;
end

userdma_sendoutstream_Pipeline_VITIS_LOOP_117_1 grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start),
    .ap_done(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_done),
    .ap_idle(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_idle),
    .ap_ready(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_ready),
    .outbuf_dout(outbuf_dout),
    .outbuf_num_data_valid(7'd0),
    .outbuf_fifo_cap(7'd0),
    .outbuf_empty_n(outbuf_empty_n),
    .outbuf_read(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outbuf_read),
    .outStreamTop_TREADY(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TREADY),
    .outStreamTop_TDATA(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TDATA),
    .outStreamTop_TVALID(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TVALID),
    .outStreamTop_TKEEP(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TKEEP),
    .outStreamTop_TSTRB(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TSTRB),
    .outStreamTop_TUSER(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TUSER),
    .outStreamTop_TLAST(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TLAST)
);

userdma_regslice_both #(
    .DataWidth( 32 ))
regslice_both_outStreamTop_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TDATA),
    .vld_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TVALID),
    .ack_in(outStreamTop_TREADY_int_regslice),
    .data_out(outStreamTop_TDATA),
    .vld_out(regslice_both_outStreamTop_V_data_V_U_vld_out),
    .ack_out(outStreamTop_TREADY),
    .apdone_blk(regslice_both_outStreamTop_V_data_V_U_apdone_blk)
);

userdma_regslice_both #(
    .DataWidth( 4 ))
regslice_both_outStreamTop_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TKEEP),
    .vld_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TVALID),
    .ack_in(regslice_both_outStreamTop_V_keep_V_U_ack_in_dummy),
    .data_out(outStreamTop_TKEEP),
    .vld_out(regslice_both_outStreamTop_V_keep_V_U_vld_out),
    .ack_out(outStreamTop_TREADY),
    .apdone_blk(regslice_both_outStreamTop_V_keep_V_U_apdone_blk)
);

userdma_regslice_both #(
    .DataWidth( 4 ))
regslice_both_outStreamTop_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TSTRB),
    .vld_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TVALID),
    .ack_in(regslice_both_outStreamTop_V_strb_V_U_ack_in_dummy),
    .data_out(outStreamTop_TSTRB),
    .vld_out(regslice_both_outStreamTop_V_strb_V_U_vld_out),
    .ack_out(outStreamTop_TREADY),
    .apdone_blk(regslice_both_outStreamTop_V_strb_V_U_apdone_blk)
);

userdma_regslice_both #(
    .DataWidth( 2 ))
regslice_both_outStreamTop_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TUSER),
    .vld_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TVALID),
    .ack_in(regslice_both_outStreamTop_V_user_V_U_ack_in_dummy),
    .data_out(outStreamTop_TUSER),
    .vld_out(regslice_both_outStreamTop_V_user_V_U_vld_out),
    .ack_out(outStreamTop_TREADY),
    .apdone_blk(regslice_both_outStreamTop_V_user_V_U_apdone_blk)
);

userdma_regslice_both #(
    .DataWidth( 1 ))
regslice_both_outStreamTop_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TLAST),
    .vld_in(grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TVALID),
    .ack_in(regslice_both_outStreamTop_V_last_V_U_ack_in_dummy),
    .data_out(outStreamTop_TLAST),
    .vld_out(regslice_both_outStreamTop_V_last_V_U_vld_out),
    .ack_out(outStreamTop_TREADY),
    .apdone_blk(regslice_both_outStreamTop_V_last_V_U_apdone_blk)
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
        end else if (((1'b1 == ap_CS_fsm_state4) & (regslice_both_outStreamTop_V_data_V_U_apdone_blk == 1'b0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start_reg <= 1'b1;
        end else if ((grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_ready == 1'b1)) begin
            grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        m2s_buf_sts_preg <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            m2s_buf_sts_preg <= xor_ln127_fu_81_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_en_clrsts_read_reg_87 <= in_en_clrsts_dout;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((regslice_both_outStreamTop_V_data_V_U_apdone_blk == 1'b1)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (regslice_both_outStreamTop_V_data_V_U_apdone_blk == 1'b0))) begin
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
    if (((1'b1 == ap_CS_fsm_state4) & (regslice_both_outStreamTop_V_data_V_U_apdone_blk == 1'b0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_en_clrsts_blk_n = in_en_clrsts_empty_n;
    end else begin
        in_en_clrsts_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_en_clrsts_read = 1'b1;
    end else begin
        in_en_clrsts_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        m2s_buf_sts = xor_ln127_fu_81_p2;
    end else begin
        m2s_buf_sts = m2s_buf_sts_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        m2s_buf_sts_ap_vld = 1'b1;
    end else begin
        m2s_buf_sts_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        outbuf_read = grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outbuf_read;
    end else begin
        outbuf_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (regslice_both_outStreamTop_V_data_V_U_apdone_blk == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start = grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_ap_start_reg;

assign grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TREADY = (outStreamTop_TREADY_int_regslice & ap_CS_fsm_state3);

assign outStreamTop_TVALID = regslice_both_outStreamTop_V_data_V_U_vld_out;

assign outStreamTop_TVALID_int_regslice = grp_sendoutstream_Pipeline_VITIS_LOOP_117_1_fu_65_outStreamTop_TVALID;

assign xor_ln127_fu_81_p2 = (in_en_clrsts_read_reg_87 ^ 1'd1);

endmodule //userdma_sendoutstream
