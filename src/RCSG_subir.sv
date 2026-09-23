class RCSG_subir #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
) extends utilidades_pkg::RCSG_base #(WIDTH,DEPTH);

    constraint llenar_c {{rd_en,wr_en} dist {0 := 0, 1 := 0, 2 := 0, 3 := 0}; };

    function new();
        super.new();
    endfunction : new

endclass //RCSG_subir extends RCSG_base
