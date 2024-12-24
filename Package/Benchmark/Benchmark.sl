Benchmark : [Object] { | name verification benchmark |

	run { :self :parameter |
		let answer = nil;
		let elapsedTime = nil;
		elapsedTime := {
			answer := self.benchmark.value(parameter)
		}.millisecondsToRun;
		[
			self.name,
			': Parameter = ', parameter,
			', Verified = ', answer = self.verification[parameter],
			', Elapsed Time = ', elapsedTime
		].stringJoin.postLine
	}

}

+String {

	Benchmark { :self :verification :benchmark:/1 |
		newBenchmark().initializeSlots(self, verification, benchmark:/1)
	}

}
