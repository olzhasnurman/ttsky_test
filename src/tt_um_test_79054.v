


module tt_um_test_79054 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    wire stx_pad_o;
    wire stx_pad_i;


    assign uio_out = {7'b0, stx_pad_o};
    assign srx_pad_i = uio_in[0];

    assign uio_oe = 0;
    assign uo_out = 0;

    wire _unused;
    assign _unused = &{ena, ui_in, 1'b0};

    // assign wb_adr_i = 0;
    // assign wb_dat_i = 0;
    // assign wb_we_i  = 0;
    // assign wb_stb_i = 0;
    // assign wb_cyc_i = 0;
    // assign wb_sel_i = 0;
    // assign cts_pad_i = 0;
    // assign dsr_pad_i = 0;
    // assign ri_pad_i  = 0;
    // assign dcd_pad_i = 0;


    uart_top UART_TEST (
        .wb_clk_i ( clk ),
        .wb_rst_i ( ~ rst_n  ),
        .wb_adr_i (  ),
        .wb_dat_i (  ),
        .wb_dat_o (  ),
        .wb_we_i  ( ),
        .wb_stb_i (  ),
        .wb_cyc_i (  ),
        .wb_sel_i (  ),
        .wb_ack_o (  ),
        .int_o    (  ),
        .srx_pad_i ( srx_pad_i ),
        .stx_pad_o ( stx_pad_o ),
        .rts_pad_o (  ),
        .cts_pad_i (  ),
        .dtr_pad_o (  ),
        .dsr_pad_i (  ),
        .ri_pad_i  ( ),
        .dcd_pad_i (  )
    );


endmodule