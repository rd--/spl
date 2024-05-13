+Void {

	tinyBenchmarks {
		let n1 = 1;
		let n2 = 28;
		let t1 = nil;
		let t2 = nil;
		let r2 = nil;
		{
			t1 := system.millisecondsToRun {
				n1.benchmark
			};
			t1 < 1000
		}.whileTrue {
			n1 := n1 * 2
		};
		{
			t2 := system.millisecondsToRun {
				r2 := n2.benchFib
			};
			t2 < 1000
		}.whileTrue {
			n2 := n2 + 1
		};
		[
			((n1 * 500000 * 1000) // t1.roundTo(100)).asStringWithCommas,
			' bytecodes/sec; ',
			((r2 * 1000) // t2.roundTo(100)).asStringWithCommas,
			' sends/sec'
		].stringJoin
	}

}
