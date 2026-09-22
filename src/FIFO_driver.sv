class FIFO_Driver#(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
);
    utilidades_pkg::RCGS_subir handler_subir;
    utilidades_pkg::RCGS_bajar handler_bajar;
    virtual fifo_if#(WIDTH,DEPTH).driver driver_interface;

    function new(virtual fifo_if#(WIDTH,DEPTH).driver driver_interface);
        handler_subir = new();
        handler_bajar = new();
        this.driver_interface = driver_interface;
    endfunction //new()

    function secuencia_subida;
        if(handler_subir.randomize() == 1)
            $display("Randomizacion exitosa");
        else
            $display("Randomizacion fallida");

        fifo_if.tx.rst_s   <= handler_subir.clr;
        fifo_if.tx.data_in <= handler_subir.data_in;
        fifo_if.tx.rd_en   <= handler_subir.rd_en;
        fifo_if.tx.wr_en   <= handler_subir.wr_en;

    endfunction
endclass //FIFO_Driver
