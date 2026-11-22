+[Integer, @SmallInteger] {

	squeakBenchFib { :self |
		(self < 2L).if {
			1L
		} {
			(self - 1L).squeakBenchFib + (self - 2L).squeakBenchFib + 1L
		}
	}

	squeakTinyBenchmarks { :self |
		let size = 8190L;
		let count = nil;
		self.timesRepeat {
			let flags = List(size, true);
			count := 0L;
			1L.toDo(size) { :index |
				flags[index].ifTrue {
					let prime = index + 1L;
					let k = index + prime;
					{
						k <= size
					}.whileTrue {
						flags[k] := false;
						k := k + prime
					};
					count := count + 1L
				}
			}
		};
		count
	}

}
