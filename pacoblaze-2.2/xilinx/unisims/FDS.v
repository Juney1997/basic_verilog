// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/FDS.v,v 1.8.38.1 2005/11/02 19:31:18 yanx Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.1i (I.24)
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  D Flip-Flop with Synchronous Set
// /___/   /\     Filename : FDS.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:18 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Rev 0.0.1 Remove input/output bufs; Seperate GSR from clock block.
//    10/20/05 - Add set & reset check to main  block. (CR219794)
// End Revision

`timescale  1 ps / 1 ps


module FDS (Q, C, D, S);

    parameter INIT = 1'b1;

    output Q;
    reg    Q;

    input  C, D, S;

    tri0 GSR = glbl.GSR;

    initial Q = 0;


    always @(GSR)
      if (GSR)
            assign Q = INIT;
      else
            deassign Q;

    always @(posedge C )
      if (GSR== 0) begin
         if (S)
	     Q <= #100 1;
         else
	     Q <= #100 D;
      end
endmodule
