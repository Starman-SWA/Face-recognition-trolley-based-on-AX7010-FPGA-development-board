// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Aug 10 18:33:31 2020
// Host        : LAPTOP-R679SJHJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_pwm_0_2_sim_netlist.v
// Design      : design_1_pwm_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_pwm_0_2,pwm,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "pwm,Vivado 2018.3" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (pwm_out_ap_vld,
    s_axi_AXILiteS_AWADDR,
    s_axi_AXILiteS_AWVALID,
    s_axi_AXILiteS_AWREADY,
    s_axi_AXILiteS_WDATA,
    s_axi_AXILiteS_WSTRB,
    s_axi_AXILiteS_WVALID,
    s_axi_AXILiteS_WREADY,
    s_axi_AXILiteS_BRESP,
    s_axi_AXILiteS_BVALID,
    s_axi_AXILiteS_BREADY,
    s_axi_AXILiteS_ARADDR,
    s_axi_AXILiteS_ARVALID,
    s_axi_AXILiteS_ARREADY,
    s_axi_AXILiteS_RDATA,
    s_axi_AXILiteS_RRESP,
    s_axi_AXILiteS_RVALID,
    s_axi_AXILiteS_RREADY,
    ap_clk,
    ap_rst_n,
    pwm_out);
  output pwm_out_ap_vld;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWADDR" *) input [4:0]s_axi_AXILiteS_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWVALID" *) input s_axi_AXILiteS_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWREADY" *) output s_axi_AXILiteS_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WDATA" *) input [31:0]s_axi_AXILiteS_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WSTRB" *) input [3:0]s_axi_AXILiteS_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WVALID" *) input s_axi_AXILiteS_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WREADY" *) output s_axi_AXILiteS_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BRESP" *) output [1:0]s_axi_AXILiteS_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BVALID" *) output s_axi_AXILiteS_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BREADY" *) input s_axi_AXILiteS_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARADDR" *) input [4:0]s_axi_AXILiteS_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARVALID" *) input s_axi_AXILiteS_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARREADY" *) output s_axi_AXILiteS_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RDATA" *) output [31:0]s_axi_AXILiteS_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RRESP" *) output [1:0]s_axi_AXILiteS_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RVALID" *) output s_axi_AXILiteS_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_AXILiteS, ADDR_WIDTH 5, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 50000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_AXILiteS_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_AXILiteS, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, INSERT_VIP 0" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pwm_out DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pwm_out, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) output [0:0]pwm_out;

  wire ap_clk;
  wire ap_rst_n;
  wire [0:0]pwm_out;
  wire pwm_out_ap_vld;
  wire [4:0]s_axi_AXILiteS_ARADDR;
  wire s_axi_AXILiteS_ARREADY;
  wire s_axi_AXILiteS_ARVALID;
  wire [4:0]s_axi_AXILiteS_AWADDR;
  wire s_axi_AXILiteS_AWREADY;
  wire s_axi_AXILiteS_AWVALID;
  wire s_axi_AXILiteS_BREADY;
  wire [1:0]s_axi_AXILiteS_BRESP;
  wire s_axi_AXILiteS_BVALID;
  wire [31:0]s_axi_AXILiteS_RDATA;
  wire s_axi_AXILiteS_RREADY;
  wire [1:0]s_axi_AXILiteS_RRESP;
  wire s_axi_AXILiteS_RVALID;
  wire [31:0]s_axi_AXILiteS_WDATA;
  wire s_axi_AXILiteS_WREADY;
  wire [3:0]s_axi_AXILiteS_WSTRB;
  wire s_axi_AXILiteS_WVALID;

  (* C_S_AXI_AXILITES_ADDR_WIDTH = "5" *) 
  (* C_S_AXI_AXILITES_DATA_WIDTH = "32" *) 
  (* C_S_AXI_AXILITES_WSTRB_WIDTH = "4" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* C_S_AXI_WSTRB_WIDTH = "4" *) 
  (* ap_ST_fsm_state1 = "2'b01" *) 
  (* ap_ST_fsm_state2 = "2'b10" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pwm inst
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .pwm_out(pwm_out),
        .pwm_out_ap_vld(pwm_out_ap_vld),
        .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
        .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
        .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
        .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
        .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),
        .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
        .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
        .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),
        .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
        .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
        .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
        .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),
        .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
        .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
        .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),
        .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
        .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID));
endmodule

(* C_S_AXI_AXILITES_ADDR_WIDTH = "5" *) (* C_S_AXI_AXILITES_DATA_WIDTH = "32" *) (* C_S_AXI_AXILITES_WSTRB_WIDTH = "4" *) 
(* C_S_AXI_DATA_WIDTH = "32" *) (* C_S_AXI_WSTRB_WIDTH = "4" *) (* ap_ST_fsm_state1 = "2'b01" *) 
(* ap_ST_fsm_state2 = "2'b10" *) (* hls_module = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pwm
   (ap_clk,
    ap_rst_n,
    pwm_out,
    pwm_out_ap_vld,
    s_axi_AXILiteS_AWVALID,
    s_axi_AXILiteS_AWREADY,
    s_axi_AXILiteS_AWADDR,
    s_axi_AXILiteS_WVALID,
    s_axi_AXILiteS_WREADY,
    s_axi_AXILiteS_WDATA,
    s_axi_AXILiteS_WSTRB,
    s_axi_AXILiteS_ARVALID,
    s_axi_AXILiteS_ARREADY,
    s_axi_AXILiteS_ARADDR,
    s_axi_AXILiteS_RVALID,
    s_axi_AXILiteS_RREADY,
    s_axi_AXILiteS_RDATA,
    s_axi_AXILiteS_RRESP,
    s_axi_AXILiteS_BVALID,
    s_axi_AXILiteS_BREADY,
    s_axi_AXILiteS_BRESP);
  input ap_clk;
  input ap_rst_n;
  output [0:0]pwm_out;
  output pwm_out_ap_vld;
  input s_axi_AXILiteS_AWVALID;
  output s_axi_AXILiteS_AWREADY;
  input [4:0]s_axi_AXILiteS_AWADDR;
  input s_axi_AXILiteS_WVALID;
  output s_axi_AXILiteS_WREADY;
  input [31:0]s_axi_AXILiteS_WDATA;
  input [3:0]s_axi_AXILiteS_WSTRB;
  input s_axi_AXILiteS_ARVALID;
  output s_axi_AXILiteS_ARREADY;
  input [4:0]s_axi_AXILiteS_ARADDR;
  output s_axi_AXILiteS_RVALID;
  input s_axi_AXILiteS_RREADY;
  output [31:0]s_axi_AXILiteS_RDATA;
  output [1:0]s_axi_AXILiteS_RRESP;
  output s_axi_AXILiteS_BVALID;
  input s_axi_AXILiteS_BREADY;
  output [1:0]s_axi_AXILiteS_BRESP;

  wire \<const0> ;
  wire \ap_CS_fsm[1]_i_1_n_2 ;
  wire ap_CS_fsm_state1;
  wire ap_CS_fsm_state2;
  wire [0:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire [31:0]duty;
  wire [31:0]duty_read_reg_80;
  wire exitcond_fu_58_p2;
  wire i_reg_47;
  wire \i_reg_47[0]_i_3_n_2 ;
  wire [31:0]i_reg_47_reg;
  wire \i_reg_47_reg[0]_i_2_n_2 ;
  wire \i_reg_47_reg[0]_i_2_n_3 ;
  wire \i_reg_47_reg[0]_i_2_n_4 ;
  wire \i_reg_47_reg[0]_i_2_n_5 ;
  wire \i_reg_47_reg[0]_i_2_n_6 ;
  wire \i_reg_47_reg[0]_i_2_n_7 ;
  wire \i_reg_47_reg[0]_i_2_n_8 ;
  wire \i_reg_47_reg[0]_i_2_n_9 ;
  wire \i_reg_47_reg[12]_i_1_n_2 ;
  wire \i_reg_47_reg[12]_i_1_n_3 ;
  wire \i_reg_47_reg[12]_i_1_n_4 ;
  wire \i_reg_47_reg[12]_i_1_n_5 ;
  wire \i_reg_47_reg[12]_i_1_n_6 ;
  wire \i_reg_47_reg[12]_i_1_n_7 ;
  wire \i_reg_47_reg[12]_i_1_n_8 ;
  wire \i_reg_47_reg[12]_i_1_n_9 ;
  wire \i_reg_47_reg[16]_i_1_n_2 ;
  wire \i_reg_47_reg[16]_i_1_n_3 ;
  wire \i_reg_47_reg[16]_i_1_n_4 ;
  wire \i_reg_47_reg[16]_i_1_n_5 ;
  wire \i_reg_47_reg[16]_i_1_n_6 ;
  wire \i_reg_47_reg[16]_i_1_n_7 ;
  wire \i_reg_47_reg[16]_i_1_n_8 ;
  wire \i_reg_47_reg[16]_i_1_n_9 ;
  wire \i_reg_47_reg[20]_i_1_n_2 ;
  wire \i_reg_47_reg[20]_i_1_n_3 ;
  wire \i_reg_47_reg[20]_i_1_n_4 ;
  wire \i_reg_47_reg[20]_i_1_n_5 ;
  wire \i_reg_47_reg[20]_i_1_n_6 ;
  wire \i_reg_47_reg[20]_i_1_n_7 ;
  wire \i_reg_47_reg[20]_i_1_n_8 ;
  wire \i_reg_47_reg[20]_i_1_n_9 ;
  wire \i_reg_47_reg[24]_i_1_n_2 ;
  wire \i_reg_47_reg[24]_i_1_n_3 ;
  wire \i_reg_47_reg[24]_i_1_n_4 ;
  wire \i_reg_47_reg[24]_i_1_n_5 ;
  wire \i_reg_47_reg[24]_i_1_n_6 ;
  wire \i_reg_47_reg[24]_i_1_n_7 ;
  wire \i_reg_47_reg[24]_i_1_n_8 ;
  wire \i_reg_47_reg[24]_i_1_n_9 ;
  wire \i_reg_47_reg[28]_i_1_n_3 ;
  wire \i_reg_47_reg[28]_i_1_n_4 ;
  wire \i_reg_47_reg[28]_i_1_n_5 ;
  wire \i_reg_47_reg[28]_i_1_n_6 ;
  wire \i_reg_47_reg[28]_i_1_n_7 ;
  wire \i_reg_47_reg[28]_i_1_n_8 ;
  wire \i_reg_47_reg[28]_i_1_n_9 ;
  wire \i_reg_47_reg[4]_i_1_n_2 ;
  wire \i_reg_47_reg[4]_i_1_n_3 ;
  wire \i_reg_47_reg[4]_i_1_n_4 ;
  wire \i_reg_47_reg[4]_i_1_n_5 ;
  wire \i_reg_47_reg[4]_i_1_n_6 ;
  wire \i_reg_47_reg[4]_i_1_n_7 ;
  wire \i_reg_47_reg[4]_i_1_n_8 ;
  wire \i_reg_47_reg[4]_i_1_n_9 ;
  wire \i_reg_47_reg[8]_i_1_n_2 ;
  wire \i_reg_47_reg[8]_i_1_n_3 ;
  wire \i_reg_47_reg[8]_i_1_n_4 ;
  wire \i_reg_47_reg[8]_i_1_n_5 ;
  wire \i_reg_47_reg[8]_i_1_n_6 ;
  wire \i_reg_47_reg[8]_i_1_n_7 ;
  wire \i_reg_47_reg[8]_i_1_n_8 ;
  wire \i_reg_47_reg[8]_i_1_n_9 ;
  wire [31:0]period;
  wire [31:0]period_read_reg_75;
  wire [0:0]pwm_out;
  wire \pwm_out[0]_INST_0_i_10_n_2 ;
  wire \pwm_out[0]_INST_0_i_10_n_3 ;
  wire \pwm_out[0]_INST_0_i_10_n_4 ;
  wire \pwm_out[0]_INST_0_i_10_n_5 ;
  wire \pwm_out[0]_INST_0_i_11_n_2 ;
  wire \pwm_out[0]_INST_0_i_12_n_2 ;
  wire \pwm_out[0]_INST_0_i_13_n_2 ;
  wire \pwm_out[0]_INST_0_i_14_n_2 ;
  wire \pwm_out[0]_INST_0_i_15_n_2 ;
  wire \pwm_out[0]_INST_0_i_16_n_2 ;
  wire \pwm_out[0]_INST_0_i_17_n_2 ;
  wire \pwm_out[0]_INST_0_i_18_n_2 ;
  wire \pwm_out[0]_INST_0_i_19_n_2 ;
  wire \pwm_out[0]_INST_0_i_19_n_3 ;
  wire \pwm_out[0]_INST_0_i_19_n_4 ;
  wire \pwm_out[0]_INST_0_i_19_n_5 ;
  wire \pwm_out[0]_INST_0_i_1_n_2 ;
  wire \pwm_out[0]_INST_0_i_1_n_3 ;
  wire \pwm_out[0]_INST_0_i_1_n_4 ;
  wire \pwm_out[0]_INST_0_i_1_n_5 ;
  wire \pwm_out[0]_INST_0_i_20_n_2 ;
  wire \pwm_out[0]_INST_0_i_21_n_2 ;
  wire \pwm_out[0]_INST_0_i_22_n_2 ;
  wire \pwm_out[0]_INST_0_i_23_n_2 ;
  wire \pwm_out[0]_INST_0_i_24_n_2 ;
  wire \pwm_out[0]_INST_0_i_25_n_2 ;
  wire \pwm_out[0]_INST_0_i_26_n_2 ;
  wire \pwm_out[0]_INST_0_i_27_n_2 ;
  wire \pwm_out[0]_INST_0_i_28_n_2 ;
  wire \pwm_out[0]_INST_0_i_29_n_2 ;
  wire \pwm_out[0]_INST_0_i_2_n_2 ;
  wire \pwm_out[0]_INST_0_i_30_n_2 ;
  wire \pwm_out[0]_INST_0_i_31_n_2 ;
  wire \pwm_out[0]_INST_0_i_32_n_2 ;
  wire \pwm_out[0]_INST_0_i_33_n_2 ;
  wire \pwm_out[0]_INST_0_i_34_n_2 ;
  wire \pwm_out[0]_INST_0_i_35_n_2 ;
  wire \pwm_out[0]_INST_0_i_3_n_2 ;
  wire \pwm_out[0]_INST_0_i_4_n_2 ;
  wire \pwm_out[0]_INST_0_i_5_n_2 ;
  wire \pwm_out[0]_INST_0_i_6_n_2 ;
  wire \pwm_out[0]_INST_0_i_7_n_2 ;
  wire \pwm_out[0]_INST_0_i_8_n_2 ;
  wire \pwm_out[0]_INST_0_i_9_n_2 ;
  wire \pwm_out[0]_INST_0_n_3 ;
  wire \pwm_out[0]_INST_0_n_4 ;
  wire \pwm_out[0]_INST_0_n_5 ;
  wire pwm_out_ap_vld;
  wire pwm_out_ap_vld_INST_0_i_10_n_2;
  wire pwm_out_ap_vld_INST_0_i_11_n_2;
  wire pwm_out_ap_vld_INST_0_i_12_n_2;
  wire pwm_out_ap_vld_INST_0_i_13_n_2;
  wire pwm_out_ap_vld_INST_0_i_14_n_2;
  wire pwm_out_ap_vld_INST_0_i_1_n_4;
  wire pwm_out_ap_vld_INST_0_i_1_n_5;
  wire pwm_out_ap_vld_INST_0_i_2_n_2;
  wire pwm_out_ap_vld_INST_0_i_2_n_3;
  wire pwm_out_ap_vld_INST_0_i_2_n_4;
  wire pwm_out_ap_vld_INST_0_i_2_n_5;
  wire pwm_out_ap_vld_INST_0_i_3_n_2;
  wire pwm_out_ap_vld_INST_0_i_4_n_2;
  wire pwm_out_ap_vld_INST_0_i_5_n_2;
  wire pwm_out_ap_vld_INST_0_i_6_n_2;
  wire pwm_out_ap_vld_INST_0_i_6_n_3;
  wire pwm_out_ap_vld_INST_0_i_6_n_4;
  wire pwm_out_ap_vld_INST_0_i_6_n_5;
  wire pwm_out_ap_vld_INST_0_i_7_n_2;
  wire pwm_out_ap_vld_INST_0_i_8_n_2;
  wire pwm_out_ap_vld_INST_0_i_9_n_2;
  wire [4:0]s_axi_AXILiteS_ARADDR;
  wire s_axi_AXILiteS_ARREADY;
  wire s_axi_AXILiteS_ARVALID;
  wire [4:0]s_axi_AXILiteS_AWADDR;
  wire s_axi_AXILiteS_AWREADY;
  wire s_axi_AXILiteS_AWVALID;
  wire s_axi_AXILiteS_BREADY;
  wire s_axi_AXILiteS_BVALID;
  wire [31:0]s_axi_AXILiteS_RDATA;
  wire s_axi_AXILiteS_RREADY;
  wire s_axi_AXILiteS_RVALID;
  wire [31:0]s_axi_AXILiteS_WDATA;
  wire s_axi_AXILiteS_WREADY;
  wire [3:0]s_axi_AXILiteS_WSTRB;
  wire s_axi_AXILiteS_WVALID;
  wire [3:3]\NLW_i_reg_47_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_pwm_out[0]_INST_0_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm_out[0]_INST_0_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm_out[0]_INST_0_i_10_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm_out[0]_INST_0_i_19_O_UNCONNECTED ;
  wire [3:3]NLW_pwm_out_ap_vld_INST_0_i_1_CO_UNCONNECTED;
  wire [3:0]NLW_pwm_out_ap_vld_INST_0_i_1_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out_ap_vld_INST_0_i_2_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out_ap_vld_INST_0_i_6_O_UNCONNECTED;

  assign s_axi_AXILiteS_BRESP[1] = \<const0> ;
  assign s_axi_AXILiteS_BRESP[0] = \<const0> ;
  assign s_axi_AXILiteS_RRESP[1] = \<const0> ;
  assign s_axi_AXILiteS_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT2 #(
    .INIT(4'h8)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(exitcond_fu_58_p2),
        .I1(ap_CS_fsm_state2),
        .O(ap_NS_fsm));
  LUT3 #(
    .INIT(8'hBF)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(ap_CS_fsm_state1),
        .I1(ap_CS_fsm_state2),
        .I2(exitcond_fu_58_p2),
        .O(\ap_CS_fsm[1]_i_1_n_2 ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm),
        .Q(ap_CS_fsm_state1),
        .S(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm[1]_i_1_n_2 ),
        .Q(ap_CS_fsm_state2),
        .R(ap_rst_n_inv));
  FDRE \duty_read_reg_80_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[0]),
        .Q(duty_read_reg_80[0]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[10]),
        .Q(duty_read_reg_80[10]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[11]),
        .Q(duty_read_reg_80[11]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[12]),
        .Q(duty_read_reg_80[12]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[13]),
        .Q(duty_read_reg_80[13]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[14]),
        .Q(duty_read_reg_80[14]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[15]),
        .Q(duty_read_reg_80[15]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[16]),
        .Q(duty_read_reg_80[16]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[17]),
        .Q(duty_read_reg_80[17]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[18]),
        .Q(duty_read_reg_80[18]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[19]),
        .Q(duty_read_reg_80[19]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[1]),
        .Q(duty_read_reg_80[1]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[20]),
        .Q(duty_read_reg_80[20]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[21]),
        .Q(duty_read_reg_80[21]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[22]),
        .Q(duty_read_reg_80[22]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[23]),
        .Q(duty_read_reg_80[23]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[24]),
        .Q(duty_read_reg_80[24]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[25]),
        .Q(duty_read_reg_80[25]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[26]),
        .Q(duty_read_reg_80[26]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[27]),
        .Q(duty_read_reg_80[27]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[28]),
        .Q(duty_read_reg_80[28]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[29]),
        .Q(duty_read_reg_80[29]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[2]),
        .Q(duty_read_reg_80[2]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[30]),
        .Q(duty_read_reg_80[30]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[31]),
        .Q(duty_read_reg_80[31]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[3]),
        .Q(duty_read_reg_80[3]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[4]),
        .Q(duty_read_reg_80[4]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[5]),
        .Q(duty_read_reg_80[5]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[6]),
        .Q(duty_read_reg_80[6]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[7]),
        .Q(duty_read_reg_80[7]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[8]),
        .Q(duty_read_reg_80[8]),
        .R(1'b0));
  FDRE \duty_read_reg_80_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(duty[9]),
        .Q(duty_read_reg_80[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h8A)) 
    \i_reg_47[0]_i_1 
       (.I0(ap_CS_fsm_state1),
        .I1(exitcond_fu_58_p2),
        .I2(ap_CS_fsm_state2),
        .O(i_reg_47));
  LUT1 #(
    .INIT(2'h1)) 
    \i_reg_47[0]_i_3 
       (.I0(i_reg_47_reg[0]),
        .O(\i_reg_47[0]_i_3_n_2 ));
  FDRE \i_reg_47_reg[0] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[0]_i_2_n_9 ),
        .Q(i_reg_47_reg[0]),
        .R(i_reg_47));
  CARRY4 \i_reg_47_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\i_reg_47_reg[0]_i_2_n_2 ,\i_reg_47_reg[0]_i_2_n_3 ,\i_reg_47_reg[0]_i_2_n_4 ,\i_reg_47_reg[0]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\i_reg_47_reg[0]_i_2_n_6 ,\i_reg_47_reg[0]_i_2_n_7 ,\i_reg_47_reg[0]_i_2_n_8 ,\i_reg_47_reg[0]_i_2_n_9 }),
        .S({i_reg_47_reg[3:1],\i_reg_47[0]_i_3_n_2 }));
  FDRE \i_reg_47_reg[10] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[8]_i_1_n_7 ),
        .Q(i_reg_47_reg[10]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[11] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[8]_i_1_n_6 ),
        .Q(i_reg_47_reg[11]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[12] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[12]_i_1_n_9 ),
        .Q(i_reg_47_reg[12]),
        .R(i_reg_47));
  CARRY4 \i_reg_47_reg[12]_i_1 
       (.CI(\i_reg_47_reg[8]_i_1_n_2 ),
        .CO({\i_reg_47_reg[12]_i_1_n_2 ,\i_reg_47_reg[12]_i_1_n_3 ,\i_reg_47_reg[12]_i_1_n_4 ,\i_reg_47_reg[12]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_reg_47_reg[12]_i_1_n_6 ,\i_reg_47_reg[12]_i_1_n_7 ,\i_reg_47_reg[12]_i_1_n_8 ,\i_reg_47_reg[12]_i_1_n_9 }),
        .S(i_reg_47_reg[15:12]));
  FDRE \i_reg_47_reg[13] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[12]_i_1_n_8 ),
        .Q(i_reg_47_reg[13]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[14] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[12]_i_1_n_7 ),
        .Q(i_reg_47_reg[14]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[15] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[12]_i_1_n_6 ),
        .Q(i_reg_47_reg[15]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[16] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[16]_i_1_n_9 ),
        .Q(i_reg_47_reg[16]),
        .R(i_reg_47));
  CARRY4 \i_reg_47_reg[16]_i_1 
       (.CI(\i_reg_47_reg[12]_i_1_n_2 ),
        .CO({\i_reg_47_reg[16]_i_1_n_2 ,\i_reg_47_reg[16]_i_1_n_3 ,\i_reg_47_reg[16]_i_1_n_4 ,\i_reg_47_reg[16]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_reg_47_reg[16]_i_1_n_6 ,\i_reg_47_reg[16]_i_1_n_7 ,\i_reg_47_reg[16]_i_1_n_8 ,\i_reg_47_reg[16]_i_1_n_9 }),
        .S(i_reg_47_reg[19:16]));
  FDRE \i_reg_47_reg[17] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[16]_i_1_n_8 ),
        .Q(i_reg_47_reg[17]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[18] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[16]_i_1_n_7 ),
        .Q(i_reg_47_reg[18]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[19] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[16]_i_1_n_6 ),
        .Q(i_reg_47_reg[19]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[1] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[0]_i_2_n_8 ),
        .Q(i_reg_47_reg[1]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[20] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[20]_i_1_n_9 ),
        .Q(i_reg_47_reg[20]),
        .R(i_reg_47));
  CARRY4 \i_reg_47_reg[20]_i_1 
       (.CI(\i_reg_47_reg[16]_i_1_n_2 ),
        .CO({\i_reg_47_reg[20]_i_1_n_2 ,\i_reg_47_reg[20]_i_1_n_3 ,\i_reg_47_reg[20]_i_1_n_4 ,\i_reg_47_reg[20]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_reg_47_reg[20]_i_1_n_6 ,\i_reg_47_reg[20]_i_1_n_7 ,\i_reg_47_reg[20]_i_1_n_8 ,\i_reg_47_reg[20]_i_1_n_9 }),
        .S(i_reg_47_reg[23:20]));
  FDRE \i_reg_47_reg[21] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[20]_i_1_n_8 ),
        .Q(i_reg_47_reg[21]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[22] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[20]_i_1_n_7 ),
        .Q(i_reg_47_reg[22]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[23] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[20]_i_1_n_6 ),
        .Q(i_reg_47_reg[23]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[24] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[24]_i_1_n_9 ),
        .Q(i_reg_47_reg[24]),
        .R(i_reg_47));
  CARRY4 \i_reg_47_reg[24]_i_1 
       (.CI(\i_reg_47_reg[20]_i_1_n_2 ),
        .CO({\i_reg_47_reg[24]_i_1_n_2 ,\i_reg_47_reg[24]_i_1_n_3 ,\i_reg_47_reg[24]_i_1_n_4 ,\i_reg_47_reg[24]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_reg_47_reg[24]_i_1_n_6 ,\i_reg_47_reg[24]_i_1_n_7 ,\i_reg_47_reg[24]_i_1_n_8 ,\i_reg_47_reg[24]_i_1_n_9 }),
        .S(i_reg_47_reg[27:24]));
  FDRE \i_reg_47_reg[25] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[24]_i_1_n_8 ),
        .Q(i_reg_47_reg[25]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[26] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[24]_i_1_n_7 ),
        .Q(i_reg_47_reg[26]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[27] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[24]_i_1_n_6 ),
        .Q(i_reg_47_reg[27]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[28] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[28]_i_1_n_9 ),
        .Q(i_reg_47_reg[28]),
        .R(i_reg_47));
  CARRY4 \i_reg_47_reg[28]_i_1 
       (.CI(\i_reg_47_reg[24]_i_1_n_2 ),
        .CO({\NLW_i_reg_47_reg[28]_i_1_CO_UNCONNECTED [3],\i_reg_47_reg[28]_i_1_n_3 ,\i_reg_47_reg[28]_i_1_n_4 ,\i_reg_47_reg[28]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_reg_47_reg[28]_i_1_n_6 ,\i_reg_47_reg[28]_i_1_n_7 ,\i_reg_47_reg[28]_i_1_n_8 ,\i_reg_47_reg[28]_i_1_n_9 }),
        .S(i_reg_47_reg[31:28]));
  FDRE \i_reg_47_reg[29] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[28]_i_1_n_8 ),
        .Q(i_reg_47_reg[29]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[2] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[0]_i_2_n_7 ),
        .Q(i_reg_47_reg[2]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[30] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[28]_i_1_n_7 ),
        .Q(i_reg_47_reg[30]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[31] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[28]_i_1_n_6 ),
        .Q(i_reg_47_reg[31]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[3] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[0]_i_2_n_6 ),
        .Q(i_reg_47_reg[3]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[4] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[4]_i_1_n_9 ),
        .Q(i_reg_47_reg[4]),
        .R(i_reg_47));
  CARRY4 \i_reg_47_reg[4]_i_1 
       (.CI(\i_reg_47_reg[0]_i_2_n_2 ),
        .CO({\i_reg_47_reg[4]_i_1_n_2 ,\i_reg_47_reg[4]_i_1_n_3 ,\i_reg_47_reg[4]_i_1_n_4 ,\i_reg_47_reg[4]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_reg_47_reg[4]_i_1_n_6 ,\i_reg_47_reg[4]_i_1_n_7 ,\i_reg_47_reg[4]_i_1_n_8 ,\i_reg_47_reg[4]_i_1_n_9 }),
        .S(i_reg_47_reg[7:4]));
  FDRE \i_reg_47_reg[5] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[4]_i_1_n_8 ),
        .Q(i_reg_47_reg[5]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[6] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[4]_i_1_n_7 ),
        .Q(i_reg_47_reg[6]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[7] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[4]_i_1_n_6 ),
        .Q(i_reg_47_reg[7]),
        .R(i_reg_47));
  FDRE \i_reg_47_reg[8] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[8]_i_1_n_9 ),
        .Q(i_reg_47_reg[8]),
        .R(i_reg_47));
  CARRY4 \i_reg_47_reg[8]_i_1 
       (.CI(\i_reg_47_reg[4]_i_1_n_2 ),
        .CO({\i_reg_47_reg[8]_i_1_n_2 ,\i_reg_47_reg[8]_i_1_n_3 ,\i_reg_47_reg[8]_i_1_n_4 ,\i_reg_47_reg[8]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_reg_47_reg[8]_i_1_n_6 ,\i_reg_47_reg[8]_i_1_n_7 ,\i_reg_47_reg[8]_i_1_n_8 ,\i_reg_47_reg[8]_i_1_n_9 }),
        .S(i_reg_47_reg[11:8]));
  FDRE \i_reg_47_reg[9] 
       (.C(ap_clk),
        .CE(pwm_out_ap_vld),
        .D(\i_reg_47_reg[8]_i_1_n_8 ),
        .Q(i_reg_47_reg[9]),
        .R(i_reg_47));
  FDRE \period_read_reg_75_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[0]),
        .Q(period_read_reg_75[0]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[10]),
        .Q(period_read_reg_75[10]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[11]),
        .Q(period_read_reg_75[11]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[12]),
        .Q(period_read_reg_75[12]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[13]),
        .Q(period_read_reg_75[13]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[14]),
        .Q(period_read_reg_75[14]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[15]),
        .Q(period_read_reg_75[15]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[16]),
        .Q(period_read_reg_75[16]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[17]),
        .Q(period_read_reg_75[17]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[18]),
        .Q(period_read_reg_75[18]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[19]),
        .Q(period_read_reg_75[19]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[1]),
        .Q(period_read_reg_75[1]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[20]),
        .Q(period_read_reg_75[20]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[21]),
        .Q(period_read_reg_75[21]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[22]),
        .Q(period_read_reg_75[22]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[23]),
        .Q(period_read_reg_75[23]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[24]),
        .Q(period_read_reg_75[24]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[25]),
        .Q(period_read_reg_75[25]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[26]),
        .Q(period_read_reg_75[26]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[27]),
        .Q(period_read_reg_75[27]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[28]),
        .Q(period_read_reg_75[28]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[29]),
        .Q(period_read_reg_75[29]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[2]),
        .Q(period_read_reg_75[2]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[30]),
        .Q(period_read_reg_75[30]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[31]),
        .Q(period_read_reg_75[31]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[3]),
        .Q(period_read_reg_75[3]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[4]),
        .Q(period_read_reg_75[4]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[5]),
        .Q(period_read_reg_75[5]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[6]),
        .Q(period_read_reg_75[6]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[7]),
        .Q(period_read_reg_75[7]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[8]),
        .Q(period_read_reg_75[8]),
        .R(1'b0));
  FDRE \period_read_reg_75_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(period[9]),
        .Q(period_read_reg_75[9]),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pwm_AXILiteS_s_axi pwm_AXILiteS_s_axi_U
       (.\FSM_onehot_rstate_reg[1]_0 (s_axi_AXILiteS_ARREADY),
        .\FSM_onehot_wstate_reg[1]_0 (s_axi_AXILiteS_AWREADY),
        .\FSM_onehot_wstate_reg[2]_0 (s_axi_AXILiteS_WREADY),
        .Q(period),
        .SR(ap_rst_n_inv),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .\int_duty_reg[31]_0 (duty),
        .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
        .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
        .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
        .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
        .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
        .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
        .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
        .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
        .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
        .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
        .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
        .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID));
  CARRY4 \pwm_out[0]_INST_0 
       (.CI(\pwm_out[0]_INST_0_i_1_n_2 ),
        .CO({pwm_out,\pwm_out[0]_INST_0_n_3 ,\pwm_out[0]_INST_0_n_4 ,\pwm_out[0]_INST_0_n_5 }),
        .CYINIT(1'b0),
        .DI({\pwm_out[0]_INST_0_i_2_n_2 ,\pwm_out[0]_INST_0_i_3_n_2 ,\pwm_out[0]_INST_0_i_4_n_2 ,\pwm_out[0]_INST_0_i_5_n_2 }),
        .O(\NLW_pwm_out[0]_INST_0_O_UNCONNECTED [3:0]),
        .S({\pwm_out[0]_INST_0_i_6_n_2 ,\pwm_out[0]_INST_0_i_7_n_2 ,\pwm_out[0]_INST_0_i_8_n_2 ,\pwm_out[0]_INST_0_i_9_n_2 }));
  CARRY4 \pwm_out[0]_INST_0_i_1 
       (.CI(\pwm_out[0]_INST_0_i_10_n_2 ),
        .CO({\pwm_out[0]_INST_0_i_1_n_2 ,\pwm_out[0]_INST_0_i_1_n_3 ,\pwm_out[0]_INST_0_i_1_n_4 ,\pwm_out[0]_INST_0_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({\pwm_out[0]_INST_0_i_11_n_2 ,\pwm_out[0]_INST_0_i_12_n_2 ,\pwm_out[0]_INST_0_i_13_n_2 ,\pwm_out[0]_INST_0_i_14_n_2 }),
        .O(\NLW_pwm_out[0]_INST_0_i_1_O_UNCONNECTED [3:0]),
        .S({\pwm_out[0]_INST_0_i_15_n_2 ,\pwm_out[0]_INST_0_i_16_n_2 ,\pwm_out[0]_INST_0_i_17_n_2 ,\pwm_out[0]_INST_0_i_18_n_2 }));
  CARRY4 \pwm_out[0]_INST_0_i_10 
       (.CI(\pwm_out[0]_INST_0_i_19_n_2 ),
        .CO({\pwm_out[0]_INST_0_i_10_n_2 ,\pwm_out[0]_INST_0_i_10_n_3 ,\pwm_out[0]_INST_0_i_10_n_4 ,\pwm_out[0]_INST_0_i_10_n_5 }),
        .CYINIT(1'b0),
        .DI({\pwm_out[0]_INST_0_i_20_n_2 ,\pwm_out[0]_INST_0_i_21_n_2 ,\pwm_out[0]_INST_0_i_22_n_2 ,\pwm_out[0]_INST_0_i_23_n_2 }),
        .O(\NLW_pwm_out[0]_INST_0_i_10_O_UNCONNECTED [3:0]),
        .S({\pwm_out[0]_INST_0_i_24_n_2 ,\pwm_out[0]_INST_0_i_25_n_2 ,\pwm_out[0]_INST_0_i_26_n_2 ,\pwm_out[0]_INST_0_i_27_n_2 }));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_11 
       (.I0(duty_read_reg_80[22]),
        .I1(i_reg_47_reg[22]),
        .I2(i_reg_47_reg[23]),
        .I3(duty_read_reg_80[23]),
        .O(\pwm_out[0]_INST_0_i_11_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_12 
       (.I0(duty_read_reg_80[20]),
        .I1(i_reg_47_reg[20]),
        .I2(i_reg_47_reg[21]),
        .I3(duty_read_reg_80[21]),
        .O(\pwm_out[0]_INST_0_i_12_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_13 
       (.I0(duty_read_reg_80[18]),
        .I1(i_reg_47_reg[18]),
        .I2(i_reg_47_reg[19]),
        .I3(duty_read_reg_80[19]),
        .O(\pwm_out[0]_INST_0_i_13_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_14 
       (.I0(duty_read_reg_80[16]),
        .I1(i_reg_47_reg[16]),
        .I2(i_reg_47_reg[17]),
        .I3(duty_read_reg_80[17]),
        .O(\pwm_out[0]_INST_0_i_14_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_15 
       (.I0(duty_read_reg_80[22]),
        .I1(i_reg_47_reg[22]),
        .I2(duty_read_reg_80[23]),
        .I3(i_reg_47_reg[23]),
        .O(\pwm_out[0]_INST_0_i_15_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_16 
       (.I0(duty_read_reg_80[20]),
        .I1(i_reg_47_reg[20]),
        .I2(duty_read_reg_80[21]),
        .I3(i_reg_47_reg[21]),
        .O(\pwm_out[0]_INST_0_i_16_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_17 
       (.I0(duty_read_reg_80[18]),
        .I1(i_reg_47_reg[18]),
        .I2(duty_read_reg_80[19]),
        .I3(i_reg_47_reg[19]),
        .O(\pwm_out[0]_INST_0_i_17_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_18 
       (.I0(duty_read_reg_80[16]),
        .I1(i_reg_47_reg[16]),
        .I2(duty_read_reg_80[17]),
        .I3(i_reg_47_reg[17]),
        .O(\pwm_out[0]_INST_0_i_18_n_2 ));
  CARRY4 \pwm_out[0]_INST_0_i_19 
       (.CI(1'b0),
        .CO({\pwm_out[0]_INST_0_i_19_n_2 ,\pwm_out[0]_INST_0_i_19_n_3 ,\pwm_out[0]_INST_0_i_19_n_4 ,\pwm_out[0]_INST_0_i_19_n_5 }),
        .CYINIT(1'b0),
        .DI({\pwm_out[0]_INST_0_i_28_n_2 ,\pwm_out[0]_INST_0_i_29_n_2 ,\pwm_out[0]_INST_0_i_30_n_2 ,\pwm_out[0]_INST_0_i_31_n_2 }),
        .O(\NLW_pwm_out[0]_INST_0_i_19_O_UNCONNECTED [3:0]),
        .S({\pwm_out[0]_INST_0_i_32_n_2 ,\pwm_out[0]_INST_0_i_33_n_2 ,\pwm_out[0]_INST_0_i_34_n_2 ,\pwm_out[0]_INST_0_i_35_n_2 }));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_2 
       (.I0(duty_read_reg_80[30]),
        .I1(i_reg_47_reg[30]),
        .I2(i_reg_47_reg[31]),
        .I3(duty_read_reg_80[31]),
        .O(\pwm_out[0]_INST_0_i_2_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_20 
       (.I0(duty_read_reg_80[14]),
        .I1(i_reg_47_reg[14]),
        .I2(i_reg_47_reg[15]),
        .I3(duty_read_reg_80[15]),
        .O(\pwm_out[0]_INST_0_i_20_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_21 
       (.I0(duty_read_reg_80[12]),
        .I1(i_reg_47_reg[12]),
        .I2(i_reg_47_reg[13]),
        .I3(duty_read_reg_80[13]),
        .O(\pwm_out[0]_INST_0_i_21_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_22 
       (.I0(duty_read_reg_80[10]),
        .I1(i_reg_47_reg[10]),
        .I2(i_reg_47_reg[11]),
        .I3(duty_read_reg_80[11]),
        .O(\pwm_out[0]_INST_0_i_22_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_23 
       (.I0(duty_read_reg_80[8]),
        .I1(i_reg_47_reg[8]),
        .I2(i_reg_47_reg[9]),
        .I3(duty_read_reg_80[9]),
        .O(\pwm_out[0]_INST_0_i_23_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_24 
       (.I0(duty_read_reg_80[14]),
        .I1(i_reg_47_reg[14]),
        .I2(duty_read_reg_80[15]),
        .I3(i_reg_47_reg[15]),
        .O(\pwm_out[0]_INST_0_i_24_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_25 
       (.I0(duty_read_reg_80[12]),
        .I1(i_reg_47_reg[12]),
        .I2(duty_read_reg_80[13]),
        .I3(i_reg_47_reg[13]),
        .O(\pwm_out[0]_INST_0_i_25_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_26 
       (.I0(duty_read_reg_80[10]),
        .I1(i_reg_47_reg[10]),
        .I2(duty_read_reg_80[11]),
        .I3(i_reg_47_reg[11]),
        .O(\pwm_out[0]_INST_0_i_26_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_27 
       (.I0(duty_read_reg_80[8]),
        .I1(i_reg_47_reg[8]),
        .I2(duty_read_reg_80[9]),
        .I3(i_reg_47_reg[9]),
        .O(\pwm_out[0]_INST_0_i_27_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_28 
       (.I0(duty_read_reg_80[6]),
        .I1(i_reg_47_reg[6]),
        .I2(i_reg_47_reg[7]),
        .I3(duty_read_reg_80[7]),
        .O(\pwm_out[0]_INST_0_i_28_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_29 
       (.I0(duty_read_reg_80[4]),
        .I1(i_reg_47_reg[4]),
        .I2(i_reg_47_reg[5]),
        .I3(duty_read_reg_80[5]),
        .O(\pwm_out[0]_INST_0_i_29_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_3 
       (.I0(duty_read_reg_80[28]),
        .I1(i_reg_47_reg[28]),
        .I2(i_reg_47_reg[29]),
        .I3(duty_read_reg_80[29]),
        .O(\pwm_out[0]_INST_0_i_3_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_30 
       (.I0(duty_read_reg_80[2]),
        .I1(i_reg_47_reg[2]),
        .I2(i_reg_47_reg[3]),
        .I3(duty_read_reg_80[3]),
        .O(\pwm_out[0]_INST_0_i_30_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_31 
       (.I0(duty_read_reg_80[0]),
        .I1(i_reg_47_reg[0]),
        .I2(i_reg_47_reg[1]),
        .I3(duty_read_reg_80[1]),
        .O(\pwm_out[0]_INST_0_i_31_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_32 
       (.I0(duty_read_reg_80[6]),
        .I1(i_reg_47_reg[6]),
        .I2(duty_read_reg_80[7]),
        .I3(i_reg_47_reg[7]),
        .O(\pwm_out[0]_INST_0_i_32_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_33 
       (.I0(duty_read_reg_80[4]),
        .I1(i_reg_47_reg[4]),
        .I2(duty_read_reg_80[5]),
        .I3(i_reg_47_reg[5]),
        .O(\pwm_out[0]_INST_0_i_33_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_34 
       (.I0(duty_read_reg_80[2]),
        .I1(i_reg_47_reg[2]),
        .I2(duty_read_reg_80[3]),
        .I3(i_reg_47_reg[3]),
        .O(\pwm_out[0]_INST_0_i_34_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_35 
       (.I0(duty_read_reg_80[0]),
        .I1(i_reg_47_reg[0]),
        .I2(duty_read_reg_80[1]),
        .I3(i_reg_47_reg[1]),
        .O(\pwm_out[0]_INST_0_i_35_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_4 
       (.I0(duty_read_reg_80[26]),
        .I1(i_reg_47_reg[26]),
        .I2(i_reg_47_reg[27]),
        .I3(duty_read_reg_80[27]),
        .O(\pwm_out[0]_INST_0_i_4_n_2 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \pwm_out[0]_INST_0_i_5 
       (.I0(duty_read_reg_80[24]),
        .I1(i_reg_47_reg[24]),
        .I2(i_reg_47_reg[25]),
        .I3(duty_read_reg_80[25]),
        .O(\pwm_out[0]_INST_0_i_5_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_6 
       (.I0(duty_read_reg_80[30]),
        .I1(i_reg_47_reg[30]),
        .I2(duty_read_reg_80[31]),
        .I3(i_reg_47_reg[31]),
        .O(\pwm_out[0]_INST_0_i_6_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_7 
       (.I0(duty_read_reg_80[28]),
        .I1(i_reg_47_reg[28]),
        .I2(duty_read_reg_80[29]),
        .I3(i_reg_47_reg[29]),
        .O(\pwm_out[0]_INST_0_i_7_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_8 
       (.I0(duty_read_reg_80[26]),
        .I1(i_reg_47_reg[26]),
        .I2(duty_read_reg_80[27]),
        .I3(i_reg_47_reg[27]),
        .O(\pwm_out[0]_INST_0_i_8_n_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \pwm_out[0]_INST_0_i_9 
       (.I0(duty_read_reg_80[24]),
        .I1(i_reg_47_reg[24]),
        .I2(duty_read_reg_80[25]),
        .I3(i_reg_47_reg[25]),
        .O(\pwm_out[0]_INST_0_i_9_n_2 ));
  LUT2 #(
    .INIT(4'h2)) 
    pwm_out_ap_vld_INST_0
       (.I0(ap_CS_fsm_state2),
        .I1(exitcond_fu_58_p2),
        .O(pwm_out_ap_vld));
  CARRY4 pwm_out_ap_vld_INST_0_i_1
       (.CI(pwm_out_ap_vld_INST_0_i_2_n_2),
        .CO({NLW_pwm_out_ap_vld_INST_0_i_1_CO_UNCONNECTED[3],exitcond_fu_58_p2,pwm_out_ap_vld_INST_0_i_1_n_4,pwm_out_ap_vld_INST_0_i_1_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_pwm_out_ap_vld_INST_0_i_1_O_UNCONNECTED[3:0]),
        .S({1'b0,pwm_out_ap_vld_INST_0_i_3_n_2,pwm_out_ap_vld_INST_0_i_4_n_2,pwm_out_ap_vld_INST_0_i_5_n_2}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_10
       (.I0(i_reg_47_reg[12]),
        .I1(period_read_reg_75[12]),
        .I2(period_read_reg_75[14]),
        .I3(i_reg_47_reg[14]),
        .I4(period_read_reg_75[13]),
        .I5(i_reg_47_reg[13]),
        .O(pwm_out_ap_vld_INST_0_i_10_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_11
       (.I0(i_reg_47_reg[9]),
        .I1(period_read_reg_75[9]),
        .I2(period_read_reg_75[11]),
        .I3(i_reg_47_reg[11]),
        .I4(period_read_reg_75[10]),
        .I5(i_reg_47_reg[10]),
        .O(pwm_out_ap_vld_INST_0_i_11_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_12
       (.I0(i_reg_47_reg[6]),
        .I1(period_read_reg_75[6]),
        .I2(period_read_reg_75[8]),
        .I3(i_reg_47_reg[8]),
        .I4(period_read_reg_75[7]),
        .I5(i_reg_47_reg[7]),
        .O(pwm_out_ap_vld_INST_0_i_12_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_13
       (.I0(i_reg_47_reg[3]),
        .I1(period_read_reg_75[3]),
        .I2(period_read_reg_75[5]),
        .I3(i_reg_47_reg[5]),
        .I4(period_read_reg_75[4]),
        .I5(i_reg_47_reg[4]),
        .O(pwm_out_ap_vld_INST_0_i_13_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_14
       (.I0(i_reg_47_reg[0]),
        .I1(period_read_reg_75[0]),
        .I2(period_read_reg_75[2]),
        .I3(i_reg_47_reg[2]),
        .I4(period_read_reg_75[1]),
        .I5(i_reg_47_reg[1]),
        .O(pwm_out_ap_vld_INST_0_i_14_n_2));
  CARRY4 pwm_out_ap_vld_INST_0_i_2
       (.CI(pwm_out_ap_vld_INST_0_i_6_n_2),
        .CO({pwm_out_ap_vld_INST_0_i_2_n_2,pwm_out_ap_vld_INST_0_i_2_n_3,pwm_out_ap_vld_INST_0_i_2_n_4,pwm_out_ap_vld_INST_0_i_2_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_pwm_out_ap_vld_INST_0_i_2_O_UNCONNECTED[3:0]),
        .S({pwm_out_ap_vld_INST_0_i_7_n_2,pwm_out_ap_vld_INST_0_i_8_n_2,pwm_out_ap_vld_INST_0_i_9_n_2,pwm_out_ap_vld_INST_0_i_10_n_2}));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_ap_vld_INST_0_i_3
       (.I0(i_reg_47_reg[30]),
        .I1(period_read_reg_75[30]),
        .I2(i_reg_47_reg[31]),
        .I3(period_read_reg_75[31]),
        .O(pwm_out_ap_vld_INST_0_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_4
       (.I0(i_reg_47_reg[27]),
        .I1(period_read_reg_75[27]),
        .I2(period_read_reg_75[29]),
        .I3(i_reg_47_reg[29]),
        .I4(period_read_reg_75[28]),
        .I5(i_reg_47_reg[28]),
        .O(pwm_out_ap_vld_INST_0_i_4_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_5
       (.I0(i_reg_47_reg[24]),
        .I1(period_read_reg_75[24]),
        .I2(period_read_reg_75[26]),
        .I3(i_reg_47_reg[26]),
        .I4(period_read_reg_75[25]),
        .I5(i_reg_47_reg[25]),
        .O(pwm_out_ap_vld_INST_0_i_5_n_2));
  CARRY4 pwm_out_ap_vld_INST_0_i_6
       (.CI(1'b0),
        .CO({pwm_out_ap_vld_INST_0_i_6_n_2,pwm_out_ap_vld_INST_0_i_6_n_3,pwm_out_ap_vld_INST_0_i_6_n_4,pwm_out_ap_vld_INST_0_i_6_n_5}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_pwm_out_ap_vld_INST_0_i_6_O_UNCONNECTED[3:0]),
        .S({pwm_out_ap_vld_INST_0_i_11_n_2,pwm_out_ap_vld_INST_0_i_12_n_2,pwm_out_ap_vld_INST_0_i_13_n_2,pwm_out_ap_vld_INST_0_i_14_n_2}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_7
       (.I0(i_reg_47_reg[21]),
        .I1(period_read_reg_75[21]),
        .I2(period_read_reg_75[23]),
        .I3(i_reg_47_reg[23]),
        .I4(period_read_reg_75[22]),
        .I5(i_reg_47_reg[22]),
        .O(pwm_out_ap_vld_INST_0_i_7_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_8
       (.I0(i_reg_47_reg[18]),
        .I1(period_read_reg_75[18]),
        .I2(period_read_reg_75[20]),
        .I3(i_reg_47_reg[20]),
        .I4(period_read_reg_75[19]),
        .I5(i_reg_47_reg[19]),
        .O(pwm_out_ap_vld_INST_0_i_8_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    pwm_out_ap_vld_INST_0_i_9
       (.I0(i_reg_47_reg[15]),
        .I1(period_read_reg_75[15]),
        .I2(period_read_reg_75[17]),
        .I3(i_reg_47_reg[17]),
        .I4(period_read_reg_75[16]),
        .I5(i_reg_47_reg[16]),
        .O(pwm_out_ap_vld_INST_0_i_9_n_2));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pwm_AXILiteS_s_axi
   (SR,
    \FSM_onehot_rstate_reg[1]_0 ,
    s_axi_AXILiteS_BVALID,
    \FSM_onehot_wstate_reg[2]_0 ,
    \FSM_onehot_wstate_reg[1]_0 ,
    s_axi_AXILiteS_RVALID,
    Q,
    \int_duty_reg[31]_0 ,
    s_axi_AXILiteS_RDATA,
    ap_rst_n,
    s_axi_AXILiteS_ARVALID,
    s_axi_AXILiteS_ARADDR,
    ap_clk,
    s_axi_AXILiteS_AWADDR,
    s_axi_AXILiteS_AWVALID,
    s_axi_AXILiteS_WVALID,
    s_axi_AXILiteS_BREADY,
    s_axi_AXILiteS_RREADY,
    s_axi_AXILiteS_WDATA,
    s_axi_AXILiteS_WSTRB);
  output [0:0]SR;
  output \FSM_onehot_rstate_reg[1]_0 ;
  output s_axi_AXILiteS_BVALID;
  output \FSM_onehot_wstate_reg[2]_0 ;
  output \FSM_onehot_wstate_reg[1]_0 ;
  output s_axi_AXILiteS_RVALID;
  output [31:0]Q;
  output [31:0]\int_duty_reg[31]_0 ;
  output [31:0]s_axi_AXILiteS_RDATA;
  input ap_rst_n;
  input s_axi_AXILiteS_ARVALID;
  input [4:0]s_axi_AXILiteS_ARADDR;
  input ap_clk;
  input [4:0]s_axi_AXILiteS_AWADDR;
  input s_axi_AXILiteS_AWVALID;
  input s_axi_AXILiteS_WVALID;
  input s_axi_AXILiteS_BREADY;
  input s_axi_AXILiteS_RREADY;
  input [31:0]s_axi_AXILiteS_WDATA;
  input [3:0]s_axi_AXILiteS_WSTRB;

  wire \FSM_onehot_rstate[1]_i_1_n_2 ;
  wire \FSM_onehot_rstate[2]_i_1_n_2 ;
  wire \FSM_onehot_rstate_reg[1]_0 ;
  wire \FSM_onehot_wstate[1]_i_2_n_2 ;
  wire \FSM_onehot_wstate[2]_i_1_n_2 ;
  wire \FSM_onehot_wstate[3]_i_1_n_2 ;
  wire \FSM_onehot_wstate_reg[1]_0 ;
  wire \FSM_onehot_wstate_reg[2]_0 ;
  wire [31:0]Q;
  wire [0:0]SR;
  wire ap_clk;
  wire ap_rst_n;
  wire [31:0]int_duty0;
  wire [31:0]\int_duty_reg[31]_0 ;
  wire [31:0]int_period0;
  wire p_0_in1_out;
  wire p_0_in3_out;
  wire p_2_in;
  wire rdata;
  wire \rdata[0]_i_1_n_2 ;
  wire \rdata[10]_i_1_n_2 ;
  wire \rdata[11]_i_1_n_2 ;
  wire \rdata[12]_i_1_n_2 ;
  wire \rdata[13]_i_1_n_2 ;
  wire \rdata[14]_i_1_n_2 ;
  wire \rdata[15]_i_1_n_2 ;
  wire \rdata[16]_i_1_n_2 ;
  wire \rdata[17]_i_1_n_2 ;
  wire \rdata[18]_i_1_n_2 ;
  wire \rdata[19]_i_1_n_2 ;
  wire \rdata[1]_i_1_n_2 ;
  wire \rdata[20]_i_1_n_2 ;
  wire \rdata[21]_i_1_n_2 ;
  wire \rdata[22]_i_1_n_2 ;
  wire \rdata[23]_i_1_n_2 ;
  wire \rdata[24]_i_1_n_2 ;
  wire \rdata[25]_i_1_n_2 ;
  wire \rdata[26]_i_1_n_2 ;
  wire \rdata[27]_i_1_n_2 ;
  wire \rdata[28]_i_1_n_2 ;
  wire \rdata[29]_i_1_n_2 ;
  wire \rdata[2]_i_1_n_2 ;
  wire \rdata[30]_i_1_n_2 ;
  wire \rdata[31]_i_1_n_2 ;
  wire \rdata[31]_i_3_n_2 ;
  wire \rdata[3]_i_1_n_2 ;
  wire \rdata[4]_i_1_n_2 ;
  wire \rdata[5]_i_1_n_2 ;
  wire \rdata[6]_i_1_n_2 ;
  wire \rdata[7]_i_1_n_2 ;
  wire \rdata[8]_i_1_n_2 ;
  wire \rdata[9]_i_1_n_2 ;
  wire [4:0]s_axi_AXILiteS_ARADDR;
  wire s_axi_AXILiteS_ARVALID;
  wire [4:0]s_axi_AXILiteS_AWADDR;
  wire s_axi_AXILiteS_AWVALID;
  wire s_axi_AXILiteS_BREADY;
  wire s_axi_AXILiteS_BVALID;
  wire [31:0]s_axi_AXILiteS_RDATA;
  wire s_axi_AXILiteS_RREADY;
  wire s_axi_AXILiteS_RVALID;
  wire [31:0]s_axi_AXILiteS_WDATA;
  wire [3:0]s_axi_AXILiteS_WSTRB;
  wire s_axi_AXILiteS_WVALID;
  wire waddr;
  wire \waddr_reg_n_2_[0] ;
  wire \waddr_reg_n_2_[1] ;
  wire \waddr_reg_n_2_[2] ;
  wire \waddr_reg_n_2_[3] ;
  wire \waddr_reg_n_2_[4] ;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hF747)) 
    \FSM_onehot_rstate[1]_i_1 
       (.I0(s_axi_AXILiteS_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_AXILiteS_RVALID),
        .I3(s_axi_AXILiteS_RREADY),
        .O(\FSM_onehot_rstate[1]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_rstate[2]_i_1 
       (.I0(s_axi_AXILiteS_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_AXILiteS_RREADY),
        .I3(s_axi_AXILiteS_RVALID),
        .O(\FSM_onehot_rstate[2]_i_1_n_2 ));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rstate[1]_i_1_n_2 ),
        .Q(\FSM_onehot_rstate_reg[1]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rstate[2]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RVALID),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_wstate[1]_i_1 
       (.I0(ap_rst_n),
        .O(SR));
  LUT5 #(
    .INIT(32'h888BFF8B)) 
    \FSM_onehot_wstate[1]_i_2 
       (.I0(s_axi_AXILiteS_BREADY),
        .I1(s_axi_AXILiteS_BVALID),
        .I2(\FSM_onehot_wstate_reg[2]_0 ),
        .I3(\FSM_onehot_wstate_reg[1]_0 ),
        .I4(s_axi_AXILiteS_AWVALID),
        .O(\FSM_onehot_wstate[1]_i_2_n_2 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[2]_i_1 
       (.I0(s_axi_AXILiteS_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .I2(s_axi_AXILiteS_WVALID),
        .I3(\FSM_onehot_wstate_reg[2]_0 ),
        .O(\FSM_onehot_wstate[2]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[3]_i_1 
       (.I0(s_axi_AXILiteS_WVALID),
        .I1(\FSM_onehot_wstate_reg[2]_0 ),
        .I2(s_axi_AXILiteS_BREADY),
        .I3(s_axi_AXILiteS_BVALID),
        .O(\FSM_onehot_wstate[3]_i_1_n_2 ));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[1]_i_2_n_2 ),
        .Q(\FSM_onehot_wstate_reg[1]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[2]_i_1_n_2 ),
        .Q(\FSM_onehot_wstate_reg[2]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[3]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_BVALID),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[0]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[0]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(\int_duty_reg[31]_0 [0]),
        .O(int_duty0[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[10]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[10]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(\int_duty_reg[31]_0 [10]),
        .O(int_duty0[10]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[11]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[11]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(\int_duty_reg[31]_0 [11]),
        .O(int_duty0[11]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[12]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[12]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(\int_duty_reg[31]_0 [12]),
        .O(int_duty0[12]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[13]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[13]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(\int_duty_reg[31]_0 [13]),
        .O(int_duty0[13]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[14]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[14]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(\int_duty_reg[31]_0 [14]),
        .O(int_duty0[14]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[15]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[15]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(\int_duty_reg[31]_0 [15]),
        .O(int_duty0[15]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[16]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[16]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(\int_duty_reg[31]_0 [16]),
        .O(int_duty0[16]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[17]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[17]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(\int_duty_reg[31]_0 [17]),
        .O(int_duty0[17]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[18]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[18]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(\int_duty_reg[31]_0 [18]),
        .O(int_duty0[18]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[19]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[19]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(\int_duty_reg[31]_0 [19]),
        .O(int_duty0[19]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[1]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[1]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(\int_duty_reg[31]_0 [1]),
        .O(int_duty0[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[20]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[20]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(\int_duty_reg[31]_0 [20]),
        .O(int_duty0[20]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[21]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[21]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(\int_duty_reg[31]_0 [21]),
        .O(int_duty0[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[22]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[22]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(\int_duty_reg[31]_0 [22]),
        .O(int_duty0[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[23]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[23]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(\int_duty_reg[31]_0 [23]),
        .O(int_duty0[23]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[24]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[24]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(\int_duty_reg[31]_0 [24]),
        .O(int_duty0[24]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[25]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[25]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(\int_duty_reg[31]_0 [25]),
        .O(int_duty0[25]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[26]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[26]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(\int_duty_reg[31]_0 [26]),
        .O(int_duty0[26]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[27]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[27]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(\int_duty_reg[31]_0 [27]),
        .O(int_duty0[27]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[28]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[28]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(\int_duty_reg[31]_0 [28]),
        .O(int_duty0[28]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[29]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[29]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(\int_duty_reg[31]_0 [29]),
        .O(int_duty0[29]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[2]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[2]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(\int_duty_reg[31]_0 [2]),
        .O(int_duty0[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[30]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[30]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(\int_duty_reg[31]_0 [30]),
        .O(int_duty0[30]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \int_duty[31]_i_1 
       (.I0(p_2_in),
        .I1(\waddr_reg_n_2_[0] ),
        .I2(\waddr_reg_n_2_[3] ),
        .I3(\waddr_reg_n_2_[1] ),
        .I4(\waddr_reg_n_2_[2] ),
        .I5(\waddr_reg_n_2_[4] ),
        .O(p_0_in3_out));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[31]_i_2 
       (.I0(s_axi_AXILiteS_WDATA[31]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(\int_duty_reg[31]_0 [31]),
        .O(int_duty0[31]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[3]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[3]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(\int_duty_reg[31]_0 [3]),
        .O(int_duty0[3]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[4]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[4]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(\int_duty_reg[31]_0 [4]),
        .O(int_duty0[4]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[5]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[5]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(\int_duty_reg[31]_0 [5]),
        .O(int_duty0[5]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[6]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[6]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(\int_duty_reg[31]_0 [6]),
        .O(int_duty0[6]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[7]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[7]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(\int_duty_reg[31]_0 [7]),
        .O(int_duty0[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[8]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[8]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(\int_duty_reg[31]_0 [8]),
        .O(int_duty0[8]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_duty[9]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[9]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(\int_duty_reg[31]_0 [9]),
        .O(int_duty0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[0] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[0]),
        .Q(\int_duty_reg[31]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[10] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[10]),
        .Q(\int_duty_reg[31]_0 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[11] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[11]),
        .Q(\int_duty_reg[31]_0 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[12] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[12]),
        .Q(\int_duty_reg[31]_0 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[13] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[13]),
        .Q(\int_duty_reg[31]_0 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[14] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[14]),
        .Q(\int_duty_reg[31]_0 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[15] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[15]),
        .Q(\int_duty_reg[31]_0 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[16] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[16]),
        .Q(\int_duty_reg[31]_0 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[17] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[17]),
        .Q(\int_duty_reg[31]_0 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[18] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[18]),
        .Q(\int_duty_reg[31]_0 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[19] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[19]),
        .Q(\int_duty_reg[31]_0 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[1] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[1]),
        .Q(\int_duty_reg[31]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[20] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[20]),
        .Q(\int_duty_reg[31]_0 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[21] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[21]),
        .Q(\int_duty_reg[31]_0 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[22] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[22]),
        .Q(\int_duty_reg[31]_0 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[23] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[23]),
        .Q(\int_duty_reg[31]_0 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[24] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[24]),
        .Q(\int_duty_reg[31]_0 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[25] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[25]),
        .Q(\int_duty_reg[31]_0 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[26] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[26]),
        .Q(\int_duty_reg[31]_0 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[27] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[27]),
        .Q(\int_duty_reg[31]_0 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[28] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[28]),
        .Q(\int_duty_reg[31]_0 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[29] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[29]),
        .Q(\int_duty_reg[31]_0 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[2] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[2]),
        .Q(\int_duty_reg[31]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[30] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[30]),
        .Q(\int_duty_reg[31]_0 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[31] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[31]),
        .Q(\int_duty_reg[31]_0 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[3] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[3]),
        .Q(\int_duty_reg[31]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[4] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[4]),
        .Q(\int_duty_reg[31]_0 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[5] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[5]),
        .Q(\int_duty_reg[31]_0 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[6] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[6]),
        .Q(\int_duty_reg[31]_0 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[7] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[7]),
        .Q(\int_duty_reg[31]_0 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[8] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[8]),
        .Q(\int_duty_reg[31]_0 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_duty_reg[9] 
       (.C(ap_clk),
        .CE(p_0_in3_out),
        .D(int_duty0[9]),
        .Q(\int_duty_reg[31]_0 [9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[0]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[0]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(Q[0]),
        .O(int_period0[0]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[10]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[10]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(Q[10]),
        .O(int_period0[10]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[11]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[11]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(Q[11]),
        .O(int_period0[11]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[12]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[12]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(Q[12]),
        .O(int_period0[12]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[13]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[13]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(Q[13]),
        .O(int_period0[13]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[14]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[14]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(Q[14]),
        .O(int_period0[14]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[15]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[15]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(Q[15]),
        .O(int_period0[15]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[16]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[16]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(Q[16]),
        .O(int_period0[16]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[17]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[17]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(Q[17]),
        .O(int_period0[17]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[18]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[18]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(Q[18]),
        .O(int_period0[18]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[19]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[19]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(Q[19]),
        .O(int_period0[19]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[1]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[1]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(Q[1]),
        .O(int_period0[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[20]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[20]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(Q[20]),
        .O(int_period0[20]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[21]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[21]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(Q[21]),
        .O(int_period0[21]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[22]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[22]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(Q[22]),
        .O(int_period0[22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[23]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[23]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(Q[23]),
        .O(int_period0[23]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[24]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[24]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(Q[24]),
        .O(int_period0[24]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[25]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[25]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(Q[25]),
        .O(int_period0[25]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[26]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[26]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(Q[26]),
        .O(int_period0[26]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[27]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[27]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(Q[27]),
        .O(int_period0[27]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[28]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[28]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(Q[28]),
        .O(int_period0[28]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[29]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[29]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(Q[29]),
        .O(int_period0[29]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[2]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[2]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(Q[2]),
        .O(int_period0[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[30]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[30]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(Q[30]),
        .O(int_period0[30]));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \int_period[31]_i_1 
       (.I0(p_2_in),
        .I1(\waddr_reg_n_2_[0] ),
        .I2(\waddr_reg_n_2_[1] ),
        .I3(\waddr_reg_n_2_[3] ),
        .I4(\waddr_reg_n_2_[2] ),
        .I5(\waddr_reg_n_2_[4] ),
        .O(p_0_in1_out));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[31]_i_2 
       (.I0(s_axi_AXILiteS_WDATA[31]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(Q[31]),
        .O(int_period0[31]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \int_period[31]_i_3 
       (.I0(s_axi_AXILiteS_WVALID),
        .I1(\FSM_onehot_wstate_reg[2]_0 ),
        .O(p_2_in));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[3]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[3]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(Q[3]),
        .O(int_period0[3]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[4]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[4]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(Q[4]),
        .O(int_period0[4]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[5]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[5]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(Q[5]),
        .O(int_period0[5]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[6]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[6]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(Q[6]),
        .O(int_period0[6]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[7]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[7]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(Q[7]),
        .O(int_period0[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[8]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[8]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(Q[8]),
        .O(int_period0[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_period[9]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[9]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(Q[9]),
        .O(int_period0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[0] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[10] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[10]),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[11] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[11]),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[12] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[12]),
        .Q(Q[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[13] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[13]),
        .Q(Q[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[14] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[14]),
        .Q(Q[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[15] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[15]),
        .Q(Q[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[16] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[16]),
        .Q(Q[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[17] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[17]),
        .Q(Q[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[18] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[18]),
        .Q(Q[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[19] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[19]),
        .Q(Q[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[1] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[20] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[20]),
        .Q(Q[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[21] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[21]),
        .Q(Q[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[22] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[22]),
        .Q(Q[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[23] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[23]),
        .Q(Q[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[24] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[24]),
        .Q(Q[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[25] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[25]),
        .Q(Q[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[26] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[26]),
        .Q(Q[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[27] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[27]),
        .Q(Q[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[28] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[28]),
        .Q(Q[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[29] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[29]),
        .Q(Q[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[2] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[30] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[30]),
        .Q(Q[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[31] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[31]),
        .Q(Q[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[3] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[4] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[5] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[6] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[7] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[8] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[8]),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_period_reg[9] 
       (.C(ap_clk),
        .CE(p_0_in1_out),
        .D(int_period0[9]),
        .Q(Q[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[0]_i_1 
       (.I0(\int_duty_reg[31]_0 [0]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[0]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[0]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[10]_i_1 
       (.I0(\int_duty_reg[31]_0 [10]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[10]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[10]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[11]_i_1 
       (.I0(\int_duty_reg[31]_0 [11]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[11]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[11]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[12]_i_1 
       (.I0(\int_duty_reg[31]_0 [12]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[12]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[12]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[13]_i_1 
       (.I0(\int_duty_reg[31]_0 [13]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[13]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[13]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[14]_i_1 
       (.I0(\int_duty_reg[31]_0 [14]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[14]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[14]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[15]_i_1 
       (.I0(\int_duty_reg[31]_0 [15]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[15]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[15]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[16]_i_1 
       (.I0(\int_duty_reg[31]_0 [16]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[16]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[16]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[17]_i_1 
       (.I0(\int_duty_reg[31]_0 [17]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[17]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[17]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[18]_i_1 
       (.I0(\int_duty_reg[31]_0 [18]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[18]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[18]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[19]_i_1 
       (.I0(\int_duty_reg[31]_0 [19]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[19]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[19]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[1]_i_1 
       (.I0(\int_duty_reg[31]_0 [1]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[1]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[1]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[20]_i_1 
       (.I0(\int_duty_reg[31]_0 [20]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[20]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[20]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[21]_i_1 
       (.I0(\int_duty_reg[31]_0 [21]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[21]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[21]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[22]_i_1 
       (.I0(\int_duty_reg[31]_0 [22]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[22]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[22]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[23]_i_1 
       (.I0(\int_duty_reg[31]_0 [23]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[23]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[23]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[24]_i_1 
       (.I0(\int_duty_reg[31]_0 [24]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[24]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[24]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[25]_i_1 
       (.I0(\int_duty_reg[31]_0 [25]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[25]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[25]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[26]_i_1 
       (.I0(\int_duty_reg[31]_0 [26]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[26]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[26]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[27]_i_1 
       (.I0(\int_duty_reg[31]_0 [27]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[27]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[27]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[28]_i_1 
       (.I0(\int_duty_reg[31]_0 [28]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[28]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[28]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[29]_i_1 
       (.I0(\int_duty_reg[31]_0 [29]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[29]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[29]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[2]_i_1 
       (.I0(\int_duty_reg[31]_0 [2]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[2]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[2]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[30]_i_1 
       (.I0(\int_duty_reg[31]_0 [30]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[30]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[30]_i_1_n_2 ));
  LUT3 #(
    .INIT(8'h08)) 
    \rdata[31]_i_1 
       (.I0(\FSM_onehot_rstate_reg[1]_0 ),
        .I1(s_axi_AXILiteS_ARVALID),
        .I2(s_axi_AXILiteS_ARADDR[4]),
        .O(\rdata[31]_i_1_n_2 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rdata[31]_i_2 
       (.I0(s_axi_AXILiteS_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .O(rdata));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[31]_i_3 
       (.I0(\int_duty_reg[31]_0 [31]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[31]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[31]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[3]_i_1 
       (.I0(\int_duty_reg[31]_0 [3]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[3]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[3]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[4]_i_1 
       (.I0(\int_duty_reg[31]_0 [4]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[4]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[4]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[5]_i_1 
       (.I0(\int_duty_reg[31]_0 [5]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[5]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[5]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[6]_i_1 
       (.I0(\int_duty_reg[31]_0 [6]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[6]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[6]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[7]_i_1 
       (.I0(\int_duty_reg[31]_0 [7]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[7]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[7]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[8]_i_1 
       (.I0(\int_duty_reg[31]_0 [8]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[8]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[8]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \rdata[9]_i_1 
       (.I0(\int_duty_reg[31]_0 [9]),
        .I1(s_axi_AXILiteS_ARADDR[3]),
        .I2(Q[9]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[2]),
        .O(\rdata[9]_i_1_n_2 ));
  FDRE \rdata_reg[0] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[0]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[0]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[10] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[10]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[10]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[11] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[11]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[11]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[12] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[12]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[12]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[13] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[13]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[13]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[14] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[14]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[14]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[15] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[15]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[15]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[16] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[16]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[16]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[17] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[17]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[17]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[18] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[18]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[18]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[19] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[19]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[19]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[1] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[1]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[1]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[20] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[20]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[20]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[21] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[21]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[21]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[22] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[22]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[22]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[23] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[23]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[23]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[24] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[24]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[24]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[25] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[25]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[25]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[26] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[26]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[26]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[27] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[27]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[27]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[28] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[28]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[28]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[29] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[29]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[29]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[2] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[2]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[2]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[30] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[30]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[30]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[31] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[31]_i_3_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[31]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[3] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[3]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[3]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[4] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[4]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[4]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[5] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[5]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[5]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[6] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[6]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[6]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[7] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[7]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[7]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[8] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[8]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[8]),
        .R(\rdata[31]_i_1_n_2 ));
  FDRE \rdata_reg[9] 
       (.C(ap_clk),
        .CE(rdata),
        .D(\rdata[9]_i_1_n_2 ),
        .Q(s_axi_AXILiteS_RDATA[9]),
        .R(\rdata[31]_i_1_n_2 ));
  LUT2 #(
    .INIT(4'h8)) 
    \waddr[4]_i_1 
       (.I0(s_axi_AXILiteS_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .O(waddr));
  FDRE \waddr_reg[0] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[0]),
        .Q(\waddr_reg_n_2_[0] ),
        .R(1'b0));
  FDRE \waddr_reg[1] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[1]),
        .Q(\waddr_reg_n_2_[1] ),
        .R(1'b0));
  FDRE \waddr_reg[2] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[2]),
        .Q(\waddr_reg_n_2_[2] ),
        .R(1'b0));
  FDRE \waddr_reg[3] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[3]),
        .Q(\waddr_reg_n_2_[3] ),
        .R(1'b0));
  FDRE \waddr_reg[4] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[4]),
        .Q(\waddr_reg_n_2_[4] ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
