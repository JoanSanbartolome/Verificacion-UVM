class RCSG_subir #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
) extends utilidades_pkg::RCSG_base #(WIDTH,DEPTH);

    constraint llenar_c {{rd_en,wr_en} dist {0 := 1, 1 := 7, 2 := 1, 3 := 1}; };

    function new(virtual fifo_if intf_fifo = null);
        super.new(intf_fifo);
    endfunction : new

endclass //RCSG_subir extends RCSG_base
