LaggedFibonacci : [Object, Equatable, Iterator, RandomNumberGenerator, Stream] { | parameters seed state |

	initialize { :self :parameters :seed |
		self.parameters := parameters;
		self.seed := seed;
		self.reset;
		self
	}

	modulus { :self |
		self.parameters.at(3)
	}

	nextRandomFloat { :self |
		self.nextRandomFraction.asFloat
	}

	nextRandomFraction { :self |
		let [j, k, x] = self.state;
		let [s, r, m] = self.parameters;
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
		z / m
	}

	reset { :self |
		let [s, r, m] = self.parameters;
		let k = self.seed;
		let x = List(r);
		1.toDo(r) { :i |
			k := k * 6364136223846793005L + 1442695040888963407L % m;
			x[i] := k
		};
		self.state := [s, r, x]
	}

}

+SmallFloat {

	LaggedFibonacci { :s :r :k :m |
		newLaggedFibonacci().initialize([s, r, LargeInteger(m)], k)
	}

	LaggedFibonacci { :s :r :k |
		LaggedFibonacci(s, r, k, 2 ^ 64)
	}

}
