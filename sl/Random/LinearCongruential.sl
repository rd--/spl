{- Requires: RandomNumberGenerator Iterator Stream -}

LinearCongruential : [Object, Iterator, RandomNumberGenerator, Stream] { | seed state |

	initialize { :self :aNumber |
		self.seed := aNumber;
		self.reset;
		self
	}

	nextRandomFloat { :self |
		let m = 139968;
		let a = 3877;
		let c = 29573;
		let r = (self.state * a + c) \\ m;
		self.state := r;
		r / m
	}

	reset { :self |
		self.state := self.seed
	}

}

+@Integer {

	LinearCongruential { :self |
		newLinearCongruential().initialize(self)
	}

}

+Void {

	LinearCongruential {
		LinearCongruential(42)
	}

}
