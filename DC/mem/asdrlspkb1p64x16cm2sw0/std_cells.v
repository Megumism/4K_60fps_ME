//----------------------------------------------------------------------------
// Copyright (c)    : 1998-2011 by Synopsys, Inc. All Rights Reserved.
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// Cell model definitions.
//----------------------------------------------------------------------------
//      Cell        : VIRL_SDN_AN2_1
//      Description : 2-Input AND
//      Equation    : X=A1&A2
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 13:36:57
//
`timescale 1 ns / 1 ps
`celldefine
module VIRL_SDN_AN2_1 (X, A1, A2);
   output X;
   input  A1;
   input  A2;

   `protect
      // Gate-level description.
      assign X = A1 & A2;

   `endprotect
endmodule
`endcelldefine
//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_BUF_1
//      Description : Non-inverting buffer
//      Equation    : X=A
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 15:20:06
//
`celldefine
module VIRL_SDN_BUF_1 (X, A);
   output X;
   input  A;

   `protect

      // Gate-level description.
      assign X = A;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_EO2_4
//      Description : 2-Input exclusive OR
//      Equation    : X=A1^A2
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 15:46:38
//
`celldefine
module VIRL_SDN_EO2_4 (X, A1, A2);
   output X;
   input  A1;
   input  A2;

   `protect
      // Gate-level description.
      assign X = A1^A2;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_EO3_4
//      Description : 3-Input exclusive OR
//      Equation    : X=(A1^A2)^A3
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 15:47:52
//
`celldefine
module VIRL_SDN_EO3_4 (X, A1, A2, A3);
   output X;
   input  A1;
   input  A2;
   input  A3;

   `protect

      // Gate-level description.
      assign X = A1^A2^A3;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_FSDP_1
//      Description : D-Flip Flop w/scan, pos-edge triggered
//      Equation    : iq,iqn=ff(clocked_on=CK,next_state=(!SE&D)|(SE&SI)):Q=iq:QN=iqn
//      Version     : 1.1.2.1
//      Created     : 2003/05/13 06:15:03
//
`celldefine
module VIRL_SDN_FSDP_1 (Q, QN, CK, D, SI, SE);
   output Q;
   output QN;
   input  CK;
   input  D;
   input  SI;
   input  SE;

   `protect
      reg notifier;
      wire shcheck1CKSElh, shcheckCKDlh, shcheckCKSIlh, shcheck0CKSElh;

      `ifdef negativeTimingCheck
	 wire SE_delayed;
	 wire D_delayed;
	 wire CK_delayed;
	 wire SI_delayed;
      `else
	 buf(SE_delayed,SE);
	 buf(D_delayed,D);
	 buf(CK_delayed,CK);
	 buf(SI_delayed,SI);
      `endif

      // Gate-level description.
      not _i0 (_n3,SE_delayed);
      and _i1 (_n2,_n3,D_delayed);
      and _i2 (_n4,SE_delayed,SI_delayed);
      or _i3 (_n1,_n2,_n4);
      xor _i4 (SE_XOR,SE_delayed,_n3);
      xor _i5 (_n5,_n1,!SE_XOR);
      virl_p_ff _i6 (QB, _n5, CK_delayed, notifier);
      buf #0.001 _i7 (Q,QB);
      not _i8 (QN,Q);

/*
      // Timing check and state logic.
      not _wi0 (_wn1,SI);
      and _wi1 (shcheck1CKSElh,D,_wn1);
      not _wi2 (shcheckCKDlh,SE);
      buf _wi3 (shcheckCKSIlh,SE);
      not _wi4 (_wn4,D);
      and _wi5 (shcheck0CKSElh,_wn4,SI);
*/
   `endprotect
endmodule
`endcelldefine
//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_INV_0P5
//      Description : Inverter
//      Equation    : X=!A
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 16:10:37
//
`celldefine
module VIRL_SDN_INV_0P5 (X, A);
   output X;
   input  A;

   `protect

      // Gate-level description.
      assign X = ~A;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_MUX2_1
//      Description : 2-1 multiplexer
//      Equation    : X=(S&D1)|(!S&D0)
//      Version     : 1.1.2.2
//      Created     : 2003/11/07 20:31:33
//
`celldefine
module VIRL_SDN_MUX2_1 (X, D0, D1, S);
   output X;
   input  D0;
   input  D1;
   input  S;

   reg X;

   `protect

         // Gate-level description.
       always @( D0 or D1 or S ) begin
          if ( (S^S) !== 1'b0 ) 
            X = 1'bx;
          else if ( S == 1'b0 )
            X = D0;
          else if ( S == 1'b1 )
            X = D1;
       end

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_OR2_1
//      Description : 2-Input OR
//      Equation    : X=A1|A2
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 17:18:13
//
`celldefine
module VIRL_SDN_OR2_1 (X, A1, A2);
   output X;
   input  A1;
   input  A2;

   `protect

      // Gate-level description.
      assign X = A1|A2;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_FSDPRB_1
//      Description : D-Flip Flop w/scan, pos-edge triggered, lo-async-clear
//      Equation    : iq,iqn=ff(clocked_on=CK,next_state=(!SE&D)|(SE&SI),clear=!RD):Q=iq:QN=iqn
//      Version     : 1.1.2.1
//      Created     : 2003/05/13 06:12:40
//
`celldefine
module VIRL_SDN_FSDPRB_1 (Q, QN, CK, D, SI, SE, RD);
   output Q;
   output QN;
   input  CK;
   input  D;
   input  SI;
   input  SE;
   input  RD;

   `protect
      reg notifier;
      wire shcheck1CKRDlh, shcheck2CKRDlh, shcheckCKDlh, shcheck0CKSElh, shcheck1CKSElh, shcheck0CKSIlh, shcheck0CKRDlh, shcheck1CKSIlh;

      `ifdef negativeTimingCheck
         wire SE_delayed;
         wire D_delayed;
         wire CK_delayed;
         wire SI_delayed;
      `else
         buf(SE_delayed,SE);
         buf(D_delayed,D);
         buf(CK_delayed,CK);
         buf(SI_delayed,SI);
      `endif

   reg QN;

    `ifdef VIRAGE_FAST_ZERO_DELAY
      not #0.000 _i7 (Q,QN);
    `else
      not #0.001 _i7 (Q,QN);
    `endif

    always @(posedge CK or negedge RD ) begin
      if ( CK === 1'bX)
        QN <= 1'bx;
      else
      begin
        if ( RD == 1'b0 ) begin
           QN <= 1'b1;
        end
        else if ( RD !== 1'b1 ) begin
           QN <= 1'bx;
        end
        else begin
           if ( (SE^SE) !== 1'b0 ) 
              QN <= 1'bx;
           else if ( SE == 1'b0 )
              QN <= ~D;
           else
              QN <= ~SI;
        end
      end
    end

    always @( posedge RD ) begin
      if ( RD === 1'bX ) begin
         QN <= 1'bX;
      end
    end

/*
      // Gate-level description.
      not _i0 (_n3,SE_delayed);
      and _i1 (_n2,_n3,D_delayed);
      and _i2 (_n4,SE_delayed,SI_delayed);
      or _i3 (_n1,_n2,_n4);
      not _i4 (_n5,RD);
      xor _i5 (SE_XOR,SE_delayed,_n3);
      xor _i6 (_n6,_n1,!SE_XOR);
      virl_p_ffr _i7 (QB, _n6, CK_delayed, _n5, notifier);
      buf #0.001 _i8 (Q,QB);
      not _i9 (QN,Q);


      // Timing check and state logic.
      and _wi0 (shcheck1CKRDlh,SI,D,SE);
      not _wi1 (_wn2,SE);
      and _wi2 (shcheck2CKRDlh,D,_wn2);
      and _wi4 (shcheckCKDlh,RD,_wn2);
      not _wi5 (_wn6,D);
      and _wi6 (shcheck0CKSElh,SI,_wn6,RD);
      not _wi7 (_wn8,SI);
      and _wi8 (shcheck1CKSElh,_wn8,D,RD);
      and _wi10 (shcheck0CKSIlh,SE,_wn6,RD);
      and _wi12 (shcheck0CKRDlh,SI,_wn6,SE);
      and _wi13 (shcheck1CKSIlh,SE,D,RD);
*/
   `endprotect
endmodule
`endcelldefine
//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_LDNRB_1
//      Description : D-Negative Latch
//      Version     : 1.1.2.1
//      Created     : 2003/05/13 06:12:40
//
`celldefine
module VIRL_SDN_LDNRB_1 (Q, CK, D) ;
   output Q;
   input  CK;
   input  D;

   `protect
      `ifdef negativeTimingCheck
         wire D_delayed;
         wire CK_delayed;
      `else
         buf(D_delayed,D);
         buf(CK_delayed,CK);
      `endif
    
    reg QN;
    buf (Q, QN);

    always @( CK or D ) begin
      if ( CK === 1'b0)
      begin
        QN <= D;
      end
    end

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------

// FUNCTION: Positive edge-triggered D flip-flop
primitive virl_p_ff  (Q, D, CP,notifier);
   output Q;  reg    Q;
   input  D, CP,notifier;

   table
      //  D   CP   notifier :   Qt  :   Qt+1
          1   (01)    ?     :   ?   :   1;  // clocked data
          0   (01)    ?     :   ?   :   0;
          1   (x1)    ?     :   1   :   1;  // reducing pessimism
          0   (x1)    ?     :   0   :   0;
          1   (0x)    ?     :   1   :   x;
          0   (0x)    ?     :   0   :   x;
          ?   (1x)    ?     :   ?   :   x;  // no change on falling edge
          ?   (?0)    ?     :   ?   :   -;

          *    ?      ?     :   ?   :   -;  // ignore edges on data
          ?    ?      *     :   ?   :   x;
   endtable
endprimitive

// FUNCTION: Positive edge-triggered D flip-flop w/ active-high reset
primitive virl_p_ffr  (Q, D, CP, R, notifier);
   output Q;  reg    Q;
   input  D, CP, R, notifier;

   table
      //  D   CP     R notifier :   Qt  :   Qt+1
          1   (01)   0    ?     :   ?   :   1;  // clocked data
          0   (01)   0    ?     :   ?   :   0;

          0   (01)   x    ?     :   ?   :   x;  // pessimism
          0    ?     x    ?     :   0   :   x;  // pessimism

          1    0     x    ?     :   0   :   x;  // pessimism
          1    x   (?x)   ?     :   0   :   x;  // pessimism
          1    1   (?x)   ?     :   0   :   x;  // pessimism

          x    0     x    ?     :   0   :   x;  // pessimism
          x    x   (?x)   ?     :   0   :   x;  // pessimism
          x    1   (?x)   ?     :   0   :   x;  // pessimism

          1   (x1)   0    ?     :   1   :   1;  // reducing pessimism
          0   (x1)   0    ?     :   0   :   0;
          1   (0x)   0    ?     :   1   :   x;
          0   (0x)   0    ?     :   0   :   x;

          ?   ?      1    ?     :   ?   :   0;  // asynchronous clear

          ?   (?0)   ?    ?     :   ?   :   -;  // ignore falling clock
          ?   (1x)   ?    ?     :   ?   :   x;  // ignore falling clock
          *    ?     ?    ?     :   ?   :   -;  // ignore the edges on data

          ?    ?   (?0)   ?     :   ?   :   -;  // ignore the edges on clear

          ?    ?     ?    *     :   ?   :   x;
    endtable
endprimitive

