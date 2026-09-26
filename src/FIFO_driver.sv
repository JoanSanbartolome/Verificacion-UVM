class FIFO_Driver#(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
);
    utilidades_pkg::RCSG_subir#(WIDTH,DEPTH) handler_subir;
    utilidades_pkg::RCSG_bajar#(WIDTH,DEPTH) handler_bajar;
    virtual fifo_if#(WIDTH,DEPTH).driver driver_interface;

    function new(virtual fifo_if#(WIDTH,DEPTH).driver driver_interface);
        handler_subir = new();
        handler_bajar = new();
        this.driver_interface = driver_interface;
    endfunction //new()

    function void secuencia_subida;
        if(handler_subir.randomize() == 1)
            $display("Randomizacion exitosa");
        else
            $display("Randomizacion fallida");

        driver_interface.tx.rst_s   <= ~handler_subir.clr;
        driver_interface.tx.data_in <= handler_subir.data_in;
        driver_interface.tx.rd_en   <= handler_subir.rd_en;
        driver_interface.tx.wr_en   <= handler_subir.wr_en;

    endfunction

    function void secuencia_bajada();
        if (handler_bajar.randomize() == 1)
            $display("Randomizacion bajada exitosa");
        else
            $display("Randomizacion bajada fallida");

        driver_interface.tx.rst_s   <= ~handler_bajar.clr;
        driver_interface.tx.data_in <= handler_bajar.data_in;
        driver_interface.tx.rd_en   <= handler_bajar.rd_en;
        driver_interface.tx.wr_en   <= handler_bajar.wr_en;
    endfunction
    
endclass //FIFO_Driver
