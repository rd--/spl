LaggedFibonacci : [Object, Equatable, Iterator, RandomNumberGenerator, Stream] { | parameters seed state |

	initialize { :self :parameters :seed |
		self.parameters := parameters;
		self.seed := seed;
		self.reset;
		self
	}

	modulus { :unused |
		2L ^ 63
	}

	nextRandomUnsignedInteger { :self |
		let [j, k, x] = self.state;
		let [s, r] = self.parameters;
		let m = self.modulus;
		let z = x[k] + x[j] % m;
		x[k] := z;
		j := j - 1;
		k := k - 1;
		(j < 1).if {
			j := r
		} {
			(k < 1).ifTrue {
				k := r
			}
		};
		self.state := [j, k, x];
		z
	}

	nextRandomFloat { :self |
		self.nextRandomFraction.asFloat
	}

	nextRandomFraction { :self |
		self.nextRandomUnsignedInteger / self.modulus
	}

	reset { :self |
		let [s, r] = self.parameters;
		let k = self.seed;
		let m = self.modulus;
		let x = List(r);
		1.toDo(r) { :i |
			k := k * 6364136223846793005L + 1442695040888963407L % m;
			x[i] := k
		};
		self.state := [s, r, x]
	}

}

+SmallFloat {

	LaggedFibonacci { :s :r :k |
		newLaggedFibonacci().initialize([s, r], k)
	}

}
