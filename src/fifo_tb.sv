`timescale 1ns/1ps
import utilidades_pkg::*;

module fifo_tb();

  parameter int DATA_WIDTH = 8;
  parameter int DEPTH = 32;

  logic clk;
  logic rst_a;
  logic rst_s;

  // 1. Instanciación del top del diseño
  FIFO_top_duv #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(DEPTH)
  ) duv (
      .bus(if_fifo)
  );

  // 2. Instanciación del interfaz
  fifo_if #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(DEPTH)
  ) if_fifo (
      .clk(clk)
  );

  // 3. Generación del reloj
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end

  // 4. Guardado del VCD
  initial begin
    $dumpfile("fifo_tb_all.vcd");
    $dumpvars(1, fifo_tb.duv.fifo_duv);
  end

  // 5. Lanzamiento del test
  initial begin
    FIFO_Testaleatorio1 #(DATA_WIDTH, DEPTH) test_h;

    // dejar el DUV en reposo
    if_fifo.rst_a = 1'b0;
    if_fifo.rst_s = 1'b0;
    if_fifo.data_in = '0;
    if_fifo.rd_en = 1'b0;
    if_fifo.wr_en = 1'b0;

    repeat (3) @(posedge clk);
    if_fifo.rst_a = 1'b1;
    if_fifo.rst_s = 1'b1;
    repeat (2) @(posedge clk);

    test_h = new(if_fifo.driver);
    test_h.run();
  end

endmodule