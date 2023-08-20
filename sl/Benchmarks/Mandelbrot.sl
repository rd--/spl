+SmallFloat {

	mandelbrotBenchmark { :size |
		| sum = 0, byteAcc = 0, bitNum = 0, y = 0; |
		{ y < size }.whileTrue {
			| ci = (2 * y / size) - 1, x = 0; |
			{ x < size }.whileTrue {
				|(
					zrzr = 0,
					zr = 0,
					zizi = 0,
					zi = 0,
					cr = (2 * x / size) - 1.5,
					z = 0,
					notDone = true,
					escape = 0
				)|
				{ notDone & { z < 50 } }.whileTrue {
					zr := zrzr - zizi + cr;
					zi := 2 * zr * zi + ci;
					zrzr := zr * zr;
					zizi := zi * zi;
					(zrzr + zizi > 4).ifTrue {
						notDone := false;
						escape := 1
					};
					z := z + 1
				};
				byteAcc := (byteAcc << 1) + escape;
				bitNum := bitNum + 1;
				(bitNum = 8).if {
					sum := sum.bitXor(byteAcc);
					byteAcc := 0;
					bitNum := 0
				} {
					(x = (size - 1)).ifTrue {
						byteAcc := byteAcc << (8 - bitNum);
						sum := sum.bitXor(byteAcc);
						byteAcc := 0;
						bitNum := 0
					}
				};
				x := x + 1
			};
			y := y + 1
		};
		sum
	}

}

(*

{ 1.mandelbrotBenchmark = 128 }.millisecondsToRun
{ 500.mandelbrotBenchmark = 191 }.millisecondsToRun
{ 750.mandelbrotBenchmark = 50 }.millisecondsToRun

*)
