/* Requires: RandomNumberGenerator Iterator Stream */

LinearCongruential : [Object, Equal, Iterator, RandomNumberGenerator, Stream] {

	| parameters seed state | <List>

	modulus { :self |
		self.parameters.at(3L)
	}

	nextRandomFloat { :self |
		self.nextState / self.modulus
	}

	nextState { :self |
		let [a, c, m] = self.parameters;
		self.state := (self.state * a + c) \\ m
	}

	reset! { :self |
		self.state := self.seed
	}

}

+List {

	LinearCongruential { :parameters :seed |
		uncheckedLinearCongruential(parameters, seed, seed)
	}

}

+[Integer, @SmallInteger] {

	numericalRecipesLinearCongruential { :self |
		LinearCongruential(
			[3877L, 29573L, 139968L],
			self
		)
	}

}

+List {

	lehmerGenerator { :p :s0 |
		let [a, m] = p;
		s0.isCoprime(m).if {
			let s = s0;
			FunctionStream {
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

	linearCongruential { :self :n :shape |
		let k = shape.product;
		self.linearCongruentialFunction
		.nestList(n, k - 1L)
		.reshape(shape)
	}

	linearCongruentialFunction { :self |
		let [a, c, m] = self;
		{ :n |
			((n * a) + c) \\ m
		}
	}

}
