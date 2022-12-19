Team members: Debasish Panda[21D070021], Bhakti Matsyapal[210070021], Ayan Das[210070016], Anuja Sathe[210070010]


IITB-CPU is a 16-bit elementary computer developed for teaching that is based 
on the Little Computer Architecture. The IITB-CPU is an 8-register, 16-bit 
computer system. It has 8 general-purpose registers (R0 to R7). Register R7 
always stores Program Counter. PC points to the next instruction. All addresses 
are short word addresses (i.e. address 0 corresponds to the first two bytes 
of main memory, address 1 corresponds to the second two bytes of main memory, etc.). 
This architecture uses a condition code register which has two flags Carry flag(C) 
and Zero flag(Z). The IITB-CPU is very simple, but it is general enough to 
solve complex problems. The architecture allows predicated instruction execution
and multiple load and store execution. There are three machine-code instruction 
formats (R, I, and J type) and a total of 14 instructions.

Entities designed for implementing the CPU:

- Arithmetic Logic Unit(ALU): As the name suggests, it performs various arithmetic 
                               operations on operands, such as addition, NAND and XOR.

- Memory unit: Stores the program(sequential set of instructions) to be uploaded to 
               the CPU.

- Sign extenders(SE6, SE9): The sign extenders pad a specified number of zeroes to
                             the most significant or least significant part of the 
                             binary numbers.

- Temporary registers: These registers help store variables while processing the 
                        instructions. As is evident, they all store 16-bit binary 
                        values.

- Register file: It is essentially a collection of registers(which store data and 
                  addresses), and can be controlled by an enable input.
