class RCGS_bajar extends RCGS_base #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
);
    constraint bajar {wr_en == 0 -> rd_en == 0;};

    function new();
        super.new();
    endfunction : new

endclass //RCGS_subir extends RCGS_base
