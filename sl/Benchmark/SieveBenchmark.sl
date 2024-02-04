+SmallFloat {

	sieveBenchmark { :self |
		let size = self;
		let flags = List(size);
		let primeCount = 0;
		flags.atAllPut(true);
		2.toDo(size) { :i |
			flags[i - 1].ifTrue{
				let k = i + i;
				primeCount := primeCount + 1;
				{
					k <= size
				}.whileTrue {
					flags[k - 1] := false;
					k := k + i
				}
			}
		};
		primeCount
	}

}
