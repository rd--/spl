+Void {

	MandelbrotBenchmark {
		Benchmark('Mandelbrot', [
			1 -> 128,
			500 -> 191,
			750 -> 50
		].Map) { :size |
			let sum = 0;
			let byteAcc = 0;
			let bitNum = 0;
			let y = 0;
			{ y < size }.whileTrue {
				let ci = (2 * y / size) - 1;
				let x = 0;
				{ x < size }.whileTrue {
					let zrzr = 0;
					let zr = 0;
					let zizi = 0;
					let zi = 0;
					let cr = (2 * x / size) - 1.5;
					let z = 0;
					let notDone = true;
					let escape = 0;
					{
						notDone & {
							z < 50
						}
					}.whileTrue {
						zr := zrzr - zizi + cr;
						zi := 2 * zr * zi + ci;
						zrzr := zr * zr;
						zizi := zi * zi;
						(zrzr + zizi > 4).ifTrue {
							notDone := false;
							escape := 1
						};
						z +:= 1
					};
					byteAcc := (byteAcc << 1) + escape;
					bitNum +:= 1;
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
					x +:= 1
				};
				y +:= 1
			};
			sum
		}
	}

}
