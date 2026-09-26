class RCSG_bajar #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
) extends utilidades_pkg::RCSG_base #(WIDTH,DEPTH);

    constraint bajar_c {wr_en == 0 -> rd_en == 0;};

    function new(virtual fifo_if intf_fifo = null);
        super.new(intf_fifo);
    endfunction : new

endclass //RCSG_bajar extends RCSG_base
