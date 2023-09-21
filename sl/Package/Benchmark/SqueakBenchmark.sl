+@Integer {

	squeakBenchFib { :self |
		(self < 2).if {
			1
		} {
			(self - 1).squeakBenchFib + (self - 2).squeakBenchFib + 1
		}
	}

	squeakTinyBenchmarks { :self |
		| size = 8190, count = nil; |
		self.timesRepeat {
			| flags = Array(size); |
			flags.atAllPut(true);
			count := 0;
			1.upToDo(size) { :index |
				flags[index].ifTrue {
					| prime = index + 1, k = index + prime; |
					{ k <= size }.whileTrue {
						flags[k] := false;
						k +:= prime
					};
					count +:= 1
				}
			}
		};
		count
	}

}
