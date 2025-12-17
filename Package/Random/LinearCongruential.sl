/* Requires: RandomNumberGenerator Iterator Stream */

LinearCongruential : [Object, Equatable, Iterator, RandomNumberGenerator, Stream] { | parameters seed state |

	initialize { :self :parameters :seed |
		self.parameters := parameters;
		self.seed := seed;
		self.reset;
		self
	}

	modulus { :self |
		self.parameters.at(3)
	}

	nextState { :self |
		let [a, c, m] = self.parameters;
		self.state := (self.state * a + c) \\ m
	}

	nextRandomFloat { :self |
		self.nextState / self.modulus
	}

	reset { :self |
		self.state := self.seed
	}

}

+List {

	LinearCongruential { :parameters :seed |
		newLinearCongruential().initialize(parameters, seed)
	}

}

+@Integer {

	numericalRecipesLinearCongruential { :self |
		LinearCongruential([3877, 29573, 139968], self)
	}

}

+List {

	lehmerGenerator { :p :s0 |
		let [a, m] = p;
		s0.isCoprime(m).if {
			let s = s0;
			BlockStream {
				let x = s;
				s := (a * x) % m;
				x / m
			} {
				s := s0
			}
		} {
			p.error('lehmerGenerator: s not coprime with m')
		}
	}

	lehmerGenerator { :p :s :n |
		lehmerGenerator(p, s).next(n)
	}

}
