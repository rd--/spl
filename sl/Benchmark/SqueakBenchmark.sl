+@Integer {

	squeakBenchFib { :self |
		(self < 2).if {
			1
		} {
			(self - 1).squeakBenchFib + (self - 2).squeakBenchFib + 1
		}
	}

	squeakTinyBenchmarks { :self |
		let size = 8190;
		let count = nil;
		self.timesRepeat {
			let flags = Array(size);
			flags.atAllPut(true);
			count := 0;
			1.upToDo(size) { :index |
				flags[index].ifTrue {
					let prime = index + 1;
					let k = index + prime;
					{ k <= size }.whileTrue {
						flags[k] := false;
						k := k + prime
					};
					count := count + 1
				}
			}
		};
		count
	}

}
