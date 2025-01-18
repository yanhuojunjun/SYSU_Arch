`timescale 1ns / 1ps
module CPU(clk,button_l,button_c,an,seg);
    input clk,button_l,button_c;
    output [3:0] an;
    output [7:0] seg;
    //if------------------------------------------------------------------------------------------------------------------------
    wire [31:0] pc,pcin,ins,adder1_result;      
    wire [31:0] adder2_result,pcin1,pcin2,pcin3;
    wire zhuan,stop;    
    PC upc(clk,stop,button_c,pcin,pc);    
    InsMem uinsmem(pc,ins);
    Adder #(32) uadd1(pc,4,adder1_result);
    Mux #(32) umux9(adder1_result,pcin3,zhuan,pcin); 
    //id-----------------------------------------------------------------------------------------------------------------------
    wire [31:0] ifid_adder1_result,ifid_ins,ifid_pc;
    IFID_Register ifid(clk,zhuan,stop,adder1_result,ins,pc,ifid_adder1_result,ifid_ins,ifid_pc);
    //control
    wire regdst,regwrite,alusrc,memread,memwrite,memtoreg,jump,branch,bne,jal,jr;
    wire branchcontrol;
    wire memwb_regwrite;
    wire [2:0] aluop;
    Control ucontrol(ifid_ins,regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg,jump,branch,bne,jal,jr);
    //alucontrol
    wire [3:0] alucontrol;
    ALUcontrol ualucontrol(aluop,ifid_ins[5:0],alucontrol);
    //register
    wire [4:0] readreg1,readreg2,memwb_writereg;
    wire [1:0] id_forwardrs,id_forwardrt;
    wire [31:0] readdata1,readdata2,reg_writedata,memwb_reg_writedata,ra,id_rs,id_rt,result,exmem_result;  
    assign readreg1=ifid_ins[25:21];
    assign readreg2=ifid_ins[20:16];
    Registers uregisters(clk,readreg1,readreg2,memwb_writereg,memwb_reg_writedata,memwb_regwrite,readdata1,readdata2,ra);
    //compare
    wire zero,zero_not,zero_final;
    Mux_three mux_three3(readdata1,result,reg_writedata,id_forwardrs,id_rs); 
    Mux_three mux_three4(readdata2,result,reg_writedata,id_forwardrt,id_rt);     
    compare ucompare(id_rs,id_rt,zero);
    assign zero_not=~zero;
    Mux #(1) umux6(zero,zero_not,bne,zero_final);
    assign branchcontrol=branch&zero_final;
    //branch      
    Adder #(32) uadd2(ifid_adder1_result,{{14{ifid_ins[15]}},ifid_ins[15:0],2'b00},adder2_result);
    assign pcin2={ifid_adder1_result[31:28],ifid_ins[25:0],2'b00};    
    Mux #(32) umux4(pcin2,adder2_result,branchcontrol,pcin1); 
    Mux #(32) umux5(pcin1,ra,jr,pcin3);
    zhuanyi uzhuanyi(branchcontrol,jump,jr,zhuan);
    //ex----------------------------------------------------------------------------------------------------------------------------
    wire idex_regdst,idex_alusrc,idex_memread,idex_memwrite,idex_memtoreg,idex_jal,idex_regwrite;
    wire [3:0] idex_alucontrol;
    wire [31:0] idex_readdata1,idex_readdata2,idex_ins,idex_adder1_result,idex_pc;
    IDEX_Register idex(clk,stop,regdst,regwrite,alusrc,memread,memwrite,memtoreg,jal,alucontrol,readdata1,readdata2,ifid_ins,ifid_adder1_result,ifid_pc,
    idex_regdst,idex_regwrite,idex_alusrc,idex_memread,idex_memwrite,idex_memtoreg,idex_jal,idex_alucontrol,idex_readdata1,idex_readdata2,idex_ins,idex_adder1_result,idex_pc);
    
    wire [1:0] ex_forwardrs,ex_forwardrt;
    wire [31:0] aluin2,ex_rs,ex_rt;    
    wire [4:0] shamt,writereg_1,writereg;    
    assign shamt=idex_ins[10:6]; 
    Mux_three mux_three1(idex_readdata1,exmem_result,memwb_reg_writedata,ex_forwardrs,ex_rs); 
    Mux_three mux_three2(idex_readdata2,exmem_result,memwb_reg_writedata,ex_forwardrt,ex_rt);  
    Mux #(32) umux2(ex_rt,{{16{idex_ins[15]}},idex_ins[15:0]},idex_alusrc,aluin2);
    ALU ualu(ex_rs,aluin2,shamt,idex_alucontrol,result);    
    Mux #(5) umux1(idex_ins[20:16],idex_ins[15:11],idex_regdst,writereg_1);
    Mux #(5) umux7(writereg_1,5'b11111,idex_jal,writereg);  
    //mem--------------------------------------------------------------------------------------------------------------------------
    wire exmem_memread,exmem_memwrite,exmem_memtoreg,exmem_jal,exmem_regwrite;
    wire [31:0] exmem_adder1_result,exmem_pc,exmem_readdata2;
    wire [4:0] exmem_writereg;
    EXMEM_Register exmem(clk,idex_memread,idex_memwrite,ex_rt,idex_memtoreg,idex_jal,idex_regwrite,idex_adder1_result,idex_pc,writereg,result,
exmem_memread,exmem_memwrite,exmem_readdata2,exmem_memtoreg,exmem_jal,exmem_regwrite,exmem_adder1_result,exmem_pc,exmem_writereg,exmem_result);
    
    wire [31:0] readdata;
    wire [3:0] cnt;
    wire [7:0] cnt_out;
    DataMem udatamem(clk,exmem_result,exmem_readdata2,exmem_memwrite,exmem_memread,cnt,readdata,cnt_out); 
    
    wire [31:0] reg_writedata_1;
    Mux #(32) umux3(exmem_result,readdata,exmem_memtoreg,reg_writedata_1);
    Mux #(32) umux8(reg_writedata_1,exmem_adder1_result,exmem_jal,reg_writedata);         
    //wb---------------------------------------------------------------------------------------------------------------------------
    wire memwb_memtoreg,memwb_jal;
    wire [31:0] memwb_adder1_result,memwb_pc,memwb_result,memwb_readdata,memwb_reg_writedata_1;
    MEMWB_Register memwb(clk,exmem_memtoreg,exmem_jal,exmem_regwrite,exmem_adder1_result,exmem_pc,exmem_result,readdata,exmem_writereg,reg_writedata,reg_writedata_1,
    memwb_memtoreg,memwb_jal,memwb_regwrite,memwb_adder1_result,memwb_pc,memwb_result,memwb_readdata,memwb_writereg,memwb_reg_writedata,memwb_reg_writedata_1); 
    //----------------------------------------------------------------------------------------------------------------------
    Forwarding_unit forward_unit1(idex_ins[25:21],idex_ins[20:16],exmem_writereg,exmem_regwrite,memwb_writereg,memwb_regwrite,ex_forwardrs,ex_forwardrt);
    Forwarding_unit forward_unit2(ifid_ins[25:21],ifid_ins[20:16],writereg,idex_regwrite,exmem_writereg,exmem_regwrite,id_forwardrs,id_forwardrt);
    Hazard_detection uhazard(ifid_ins[25:21],ifid_ins[20:16],writereg,idex_memread,stop,memread);
    //assign q[15:8]=memwb_pc[7:0];
    //assign q[7:0]=memwb_reg_writedata_1;  
    increase uincrease(button_l,cnt);
    display udisplay(clk,cnt,cnt_out,an,seg);
endmodule