class FIFO_Testaleatorio1 #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
);
    FIFO_Environment #(WIDTH, DEPTH) env;

    function new(virtual fifo_if #(WIDTH, DEPTH).driver driver_interface);
        env = new(driver_interface);
    endfunction

    task run();
        env.run();
    endtask
endclass
