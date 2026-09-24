class FIFO_Testaleatorio1#(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
);
    utilidades_pkg::FIFO_Enviroment enviroment; // Declaracion enviroment

    function new(virtual fifo_if#(WIDTH,DEPTH) vif_test);
        enviroment = new(vif_test);
    endfunction //new()

    task test_duv; // Test para verificar el duv
        
    endtask //automatic

endclass //FIFO_Driver
