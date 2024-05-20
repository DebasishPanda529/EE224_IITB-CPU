# IITB-CPU 

Course Instructor :- [Prof. Virendra Singh](https://www.ee.iitb.ac.in/~viren/)

Team members :-
- [Debasish Panda](https://debasishpanda529.github.io) [21D070021]
- [Bhakti Matsyapal](https://github.com/Bhakti2305) [210070021]
- [Ayan Das](https://github.com/Sad-Naya) [210070016]
- [Anuja Sathe](https://github.com/AnujaSathe2308) [210070010]


IITB-CPU is a 16-bit elementary computer developed for teaching that is based 
on the Little Computer Architecture. The IITB-CPU is an 8-register, 16-bit 
computer system. It has 8 general-purpose registers (R0 to R7). Register R7 
always stores [Program Counter](https://en.wikipedia.org/wiki/Processor_register) (also known as the **Instruction Pointer**). PC points to the next instruction. All addresses 
are short [word](https://en.wikipedia.org/wiki/Word_(computer_architecture)) addresses (i.e. address 0 corresponds to the first two bytes 
of main memory, address 1 corresponds to the second two bytes of main memory, etc.). 
This architecture uses a condition code register which has two flags Carry flag(C) 
and Zero flag(Z). The IITB-CPU is very simple, but it is general enough to 
solve complex problems. The architecture allows predicated instruction execution
and multiple [load and store execution](https://eng.libretexts.org/Bookshelves/Computer_Science/Programming_Languages/Introduction_to_Assembly_Language_Programming%3A_From_Soup_to_Nuts%3A_ARM_Edition_(Kann)/04%3A_New_Page/4.04%3A_New_Page). There are three machine-code instruction 
formats (R, I, and J type) and a total of 14 instructions.

Entities designed for implementing the CPU:

- [Arithmetic Logic Unit(ALU)](Entities/ALU/ALU/ALU.vhd): As the name suggests, it performs various arithmetic 
                               operations on operands, such as addition, NAND and XOR.

- [Memory unit](Entities/Memory/Memory_unit.vhd): Stores the program (sequential set of instructions) to be uploaded to 
               the CPU.

- Sign extenders ([SE6](Entities/SE6/SE6/sign_extend_6.vhd), [SE9](Entities/SE9/SE9/sign_extend_9.vhdl)): The sign extenders pad a specified number of zeroes to
                             the most significant or least significant part of the 
                             binary numbers.

- [Temporary registers](Entities/Register_component/Register_component.vhd): These registers help store variables while processing the 
                        instructions. As is evident, they all store 16-bit binary 
                        values.

- [Register file](Entities/Register_file/Register_file/Register_file.vhd): It is essentially a collection of registers (which store data and 
                  addresses), and can be controlled by an enable input.

 **N.B. :** The reader is advised to exercise caution while using the code as a reference. Although the fundamental idea behind the code is more or less correct, we
were unable to verify the correctness of the code for various instructions through testing and verification. Constructive suggestions regarding any change in the
code are most welcome, and can be mailed [here](mailto:21d070021@iitb.ac.in).
