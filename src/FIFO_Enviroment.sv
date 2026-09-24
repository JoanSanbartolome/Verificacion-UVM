class FIFO_Driver#(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
);
    virtual fifo_if#(WIDTH,DEPTH) env_interface;

    function new(virtual fifo_if#(WIDTH,DEPTH) env_interface);
        this.env_interface = env_interface;
    endfunction //new()

endclass //FIFO_Driver
