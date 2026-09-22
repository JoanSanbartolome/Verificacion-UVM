class RCGS_bajar #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
) extends utilidades_pkg::RCSG_base #(WIDTH,DEPTH);

    constraint bajar_c {wr_en == 0 -> rd_en == 0;};

    function new();
        super.new();
    endfunction : new

endclass //RCGS_subir extends RCGS_base
