class RCSG_base #(
    parameter int WIDTH = 32,
    parameter int DEPTH = 16
) ;
//introducid vuestro código
//Propiedades
// 1.1 para datos
    rand bit [WIDTH-1:0] data_in;
// 1.2 para lectura y escritura
    rand bit rd_en;
    rand bit wr_en;
// 2  constraint para datos
    constraint dt {data_in inside {[WIDTH-1:0]};};
// 3 propiedad para clear
    bit clr;
// 4 variable estática de grado de llenado
    static int use_dw;
// 5.1 constraint que controle que no hay lecturas solo cuando la FIFO esta vacia 
    
    constraint rd {use_dw == 0 -> rd_en == 0;};
//5.2 constraint que controle que no hay escrituras solo cuando la FIFO está llena
    constraint wr {use_dw == WIDTH -> wr_en == 0;};
//metodos
//1 constructor
    function new;
        rd_en = 0;
        wr_en = 0;
        clr = 0;
        use_dw = 0;
        foreach (data_in[i]) data_in[i] = 0;
    endfunction : new
//2 funcion calculo del grado de llenado

//3 funcion reset del grado de llenado
    
//4 funcion post_randomize
 
 
endclass