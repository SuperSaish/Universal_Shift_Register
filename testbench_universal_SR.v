module tb_univeral;

  // Define signals
  reg S1, S0, MSB_in, LSB_in, clk, rst;
  reg [3:0] I;
  wire [3:0] Q;

  // Instantiate the univeral module
  univeral uut (
    .S1(S1),
    .S0(S0),
    .MSB_in(MSB_in),
    .LSB_in(LSB_in),
    .clk(clk),
    .rst(rst),
    .I(I),
    .Q(Q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Reset initialization
  initial begin
    clk = 0;
    rst = 1;
    MSB_in = 0;
    LSB_in = 0;
    S1 = 0;
    S0 = 0;
    I = 4'b0000;
    #10 rst = 0; // Release reset after 10 time units
  end

  // Apply test cases and monitor outputs
  initial begin
    $monitor("Time=%0t, S1=%b, S0=%b, MSB_in=%b, LSB_in=%b, I=%b, Q=%b", 
             $time, S1, S0, MSB_in, LSB_in, I, Q);

    // Test case 1: S1=0, S0=0 (No operation)
    S1 = 0;
    S0 = 0;
    #10;

    // Test case 2: S1=0, S0=1 (Pass MSB_in to Q)
    S1 = 0;
    S0 = 1;
    MSB_in = 1;
    #10;

    // Test case 3: S1=1, S0=0 (Pass LSB_in to Q)
    S1 = 1;
    S0 = 0;
    LSB_in = 1;
    #10;

    // Test case 4: S1=1, S0=1 (Pass I to Q)
    S1 = 1;
    S0 = 1;
    I = 4'b1101;
    #10;

    // Add more test cases as needed

    $finish;
  end

endmodule
