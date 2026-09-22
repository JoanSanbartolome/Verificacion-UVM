interface fifo_if;

    //escala de tiempos de 1 ns y una precisón de 1 ps.
    //incluid vuestro código

    //cabecera del interfaz. Recorda con dos parámetros y un puerto de entrada
    //1,2 y 3 incluid vuestro código

    parameter  WIDTH = 32;
    parameter  DEPTH = 12;
    localparam ADDRESS =$clog2(DEPTH);
    logic       rst_a       ;
    logic       rst_s       ;
    logic       lleno       ;
    logic       vacio       ;
    logic       rd_en       ;
    logic       wr_en       ;
    logic       clr         ;
    logic   [ADDRESS:0]   use_dw ;
    logic   [WIDTH-1:0]     data_in;
    logic   [WIDTH-1:0]     data_out;

    //4.2 definición clocking tx
    clocking tx @(posedge clk);

    output #2ns     rst_s;
    output #2ns     data_in;
    output #2ns       rd_en;
    output #2ns       wr_en;
    endclocking:tx;

    //4.3 definición del clocking neg_event
    clocking neg_event @(negedge clk);
    output #2ns rst_a;
    endclocking:neg_event;

    //5.3 definición del modport driver
    //os proporciono el código
    modport driver (clocking tx,
    clocking neg_event
    );

    //5.1 definición del modport duv
    //añadir vuestro código, absolutamente necesario para esta primera sesion
    modport duv (
    input             clk      ,
    input             rst_a    ,
    input           rst_s    ,
    input             rd_en    ,
    output            lleno     ,
    //completad el listado

    );

    //4.1 definición clocking px
    //añadir vuestro código, solo necesario para la segunda sesion

    //5.2 definición del modport monitor
    //añadir vuestro código, solo necesario para la segunda sesion

endinterface //fifo_if
