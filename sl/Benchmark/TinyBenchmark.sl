+Void {

	tinyBenchmarks {
		| t1 t2 r n1 n2 |
		n1 := 1;
		{
			t1 := system.millisecondsToRun {
				n1.benchmark
			};
			t1 < 1000
		}.whileTrue {
			n1 := n1 * 2
		};
		n2 := 28;
		{
			t2 := system.millisecondsToRun {
				r := n2.benchFib
			};
			t2 < 1000
		}.whileTrue {
			n2 := n2 + 1
		};
		[
			((n1 * 500000 * 1000) // t1.roundTo(100)).asStringWithCommas,
			' bytecodes/sec; ',
			((r * 1000) // t2.roundTo(100)).asStringWithCommas,
			' sends/sec'
		].join
	}

}
