`timescale 1 ns/ 1 ps
import utilidades_pkg::*; // Import the utilities package 
module fifo_tb();

  //definición de parámetros superiores
  parameter int DATA_WIDTH = 8;
  parameter int DEPTH = 32;

  //definicon de señales e interconexion
  logic clk;
  logic rst_a;
  logic rst_s;


  //1.instanciación del top del diseño
  FIFO_top_duv #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(DEPTH)
  ) duv (
      .bus(if_fifo)
  );

  //2.instanciación del interfaz
  fifo_if #(
      .WIDTH(DATA_WIDTH),
      .DEPTH(DEPTH)
  ) if_fifo (
      .clk(clk)
  );


  //3. Generación del reloj con un initial
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end

  //4. Almacenamiento de puertos en un vcd
  initial begin
    $dumpfile("fifo_tb_all.vcd");
    $dumpvars(1, fifo_tb.duv);
  end

  //5. Lanzamiento del test dentro de un initial con un paso previo e definición del handle al test del paso 6
  initial begin
    FIFO_Driver #(DATA_WIDTH, DEPTH) driver_h;

    // Paso previo para dejar el DUV en reposo
    if_fifo.rst_a = 1'b0;
    if_fifo.rst_s = 1'b0;
    if_fifo.data_in = '0;
    if_fifo.rd_en = 1'b0;
    if_fifo.wr_en = 1'b0;

    repeat (3) @(posedge clk);
    if_fifo.rst_a = 1'b1;
    if_fifo.rst_s = 1'b1;
    repeat (2) @(posedge clk);

    // handle al driver del paso 6
    driver_h = new(if_fifo.driver);
    driver_h.secuencia_subida();
  end

endmodule