//insertar código que define una escala de tiempos de 1 ns y una precisón de 1 ps.
 `timescale 1ns/1ps
package utilidades_pkg;
 
 
typedef class RCSG_base;
typedef class RCSG_subir;
typedef class RCSG_bajar;
typedef class FIFO_Driver;
typedef class FIFO_Environment;
typedef class FIFO_Testaleatorio1;
 
`include "RCSG_base.sv"
`include "RCSG_subir.sv"
`include "RCSG_bajar.sv"
`include "FIFO_Driver.sv"
`include "FIFO_Environment.sv"
`include "FIFO_Testaleatorio1.sv"
 
 
endpackage : utilidades_pkg