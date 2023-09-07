+@Integral {

	benchFib { :self |
		(self < 2).if {
			1
		} {
			(self - 1).benchFib + (self - 2).benchFib + 1
		}
	}

	benchmark { :self |
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
						k := k + prime
					};
					count := count + 1
				}
			}
		};
		count
	}

}
