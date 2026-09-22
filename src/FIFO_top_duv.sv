module FIFO_top_duv #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
) (fifo_if.duv bus) ; 
 
//instanciación de vuestra DUV a verificar
// Instancia del DUV
FIFO_no_sintetizable DUV (
                .CLOCK(fifo_if.clk),
               .RESET_N(fifo_if.rst_a),
               .DATA_IN(fifo_if.data_in),
               .READ(fifo_if.rd_en),
               .WRITE(fifo_if.wr_en),
               .CLEAR_N(fifo_if.clr),
               .F_FULL_N(fifo_if.lleno),
               .F_EMPTY_N(fifo_if.vacio),
               .USE_DW(fifo_if.use_dw),
               .DATA_OUT(fifo_if.data_out));
 
endmodule