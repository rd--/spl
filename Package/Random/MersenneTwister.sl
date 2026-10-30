/* Requires: RandomNumberGenerator Iterator Stream */

MersenneTwister : [Object, Equal, Iterator, RandomNumberGenerator, Stream] {

	| seed block |

	initialize! { :self :aNumber |
		self.seed := aNumber;
		self.reset!;
		self
	}

	nextRandomFloat { :self |
		let f/0 = self.block;
		f()
	}

	reset! { :self |
		self.block := self.seed.mt53RandomNumberGenerator
	}

}

+@Integer {

	MersenneTwister { :self |
		newMersenneTwister().initialize!(self)
	}

	mt53RandomNumberGenerator { :self |
		<primitive:
		const mt = new sl.MersenneTwister(_self);
		return function () {
			return mt.genrand_res53();
		};
		>
	}

}

+Void {

	MersenneTwister {
		MersenneTwister(system.absoluteTime)
	}

}
