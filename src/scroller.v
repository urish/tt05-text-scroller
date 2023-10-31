module tt_um_text_scroller(
	input  wire [7:0] ui_in,	// Dedicated inputs
	output wire [7:0] uo_out,	// Dedicated outputs
	input  wire [7:0] uio_in,	// IOs: Input path
	output wire [7:0] uio_out,// IOs: Output path
	output wire [7:0] uio_oe,	// IOs: Enable path (active high: 0=input, 1=output)
	input  wire       ena,
	input  wire       clk,
	input  wire       rst_n
);

	reg [47:0] font_data [0:255];

  reg [31:0] text = "Tiny";

  wire [5:0]index = uio_in[5:0];
	assign uo_out  = font_data[ui_in][index+:8];
	assign uio_out = 8'h00;

  // font is ~192 bytes, but actually less. Can reduce to roughly 72 bytes = 576 bits.
  
  // we render row by row, col by col, probably left to right.

  // given a bit:
  // row[col]
  
  // inputs
  // - font
  // - text

  // output
  // font[char_index][col][row]
  // easy for fixed font, we can increment char index after every five cols.
  // for dynamic font, we need to decide whether we incremenet char index.
  // on each clock: 
  // if last col, advance char counter
  // otherwise, advance col counter
  // last col = read from font[char][]

  // we need to render 8 cols at once

  // A (height = 8, each byte is one col)

endmodule
