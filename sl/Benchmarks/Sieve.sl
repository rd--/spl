+SmallFloat {

	sieveBenchmark { :self |
		| size = self, flags = Array(size), primeCount = 0; |
		flags.atAllPut(true);
		2.toDo(size) { :i |
			flags[i - 1].ifTrue{
				| k = i + i; |
				primeCount +:= 1;
				{ k <= size }.whileTrue {
					flags[k - 1] := false;
					k +:= i
				}
			}
		};
		primeCount
	}

}
