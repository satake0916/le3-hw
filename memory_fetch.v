module memory_fetch(
input clock,
input [15:0] pc,
output [15:0]data
);

memory mem(.data(16'b0), .wren(1'b0), .address(pc), .clock(clock), .q(data));


endmodule