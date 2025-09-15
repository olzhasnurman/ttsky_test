


module tt_um_test_79054 (
    /* verilator lint_off UNUSEDSIGNAL */
    /* verilator lint_off UNDRIVEN */
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    wire uart_rx;
    wire uart_tx;
    wire reset_n;

    wire        in_psel;
    wire        in_penable;
    wire [2:0]  in_pprot;
    wire        in_pready;
    wire        in_pslverr;
    wire [31:0] in_paddr;
    wire        in_pwrite;
    wire [31:0] in_prdata;
    wire [31:0] in_pwdata;
    wire [3:0]  in_pstrb;

    assign in_psel    = 1'b0;
    assign in_penable = 1'b0;
    assign in_pprot   = 1'b0;
    assign in_paddr   = 32'd0;
    assign in_pwrite  = 1'b0;
    assign in_pwdata  = 32'd0;
    assign in_pstrb   = 4'b0;



    /* verilator lint_off UNUSEDSIGNAL */
    assign uo_out[0] = uart_tx;
    assign uo_out[7:1] = 7'b0;
    assign uart_rx = ui_in[0];

    // assign uart_tx = uart_rx;
    assign reset_n = rst_n;

    assign uio_oe = 8'b0;
    assign uio_out = 8'b0;

    /* verilator lint_off UNUSEDSIGNAL */
    wire _unused = &{ena, uio_in, ui_in[7:1], uo_out[7:1], uio_out, 1'b0, uio_oe, in_pready, in_pslverr, in_prdata};

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


    // uart_top UART_TEST (
    //     .wb_clk_i ( clk ),
    //     .wb_rst_i ( reset ),
    //     .wb_adr_i (  ),
    //     .wb_dat_i (  ),
    //     .wb_dat_o (  ),
    //     .wb_we_i  ( ),
    //     .wb_stb_i (  ),
    //     .wb_cyc_i (  ),
    //     .wb_sel_i (  ),
    //     .wb_ack_o (  ),
    //     .int_o    (  ),
    //     .srx_pad_i ( srx_pad_i ),
    //     .stx_pad_o ( stx_pad_o ),
    //     .rts_pad_o (  ),
    //     .cts_pad_i (  ),
    //     .dtr_pad_o (  ),
    //     .dsr_pad_i (  ),
    //     .ri_pad_i  ( ),
    //     .dcd_pad_i (  )
    // );

    uart_apb UART_APB (
        .resetn     (reset_n   ),
        .clk        (clk       ),
        .in_psel    (in_psel   ),
        .in_penable (in_penable),
        .in_pprot   (in_pprot  ),
        .in_pready  (in_pready ),
        .in_pslverr (in_pslverr),
        .in_paddr   (in_paddr  ),
        .in_pwrite  (in_pwrite ),
        .in_prdata  (in_prdata ),
        .in_pwdata  (in_pwdata ),
        .in_pstrb   (in_pstrb  ),
        .uart_rx    (uart_rx   ),
        .uart_tx    (uart_tx   )
    );



endmodule