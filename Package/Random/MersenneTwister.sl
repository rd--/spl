/* Requires: RandomNumberGenerator Iterator Stream */

MersenneTwister : [Object, Equal, Iterator, RandomNumberGenerator, Stream] {

	| seed generatorFunction | <Float>

	nextRandomFloat { :self |
		let f/0 = self.generatorFunction;
		f()
	}

	reset! { :self |
		self.generatorFunction := self.seed.mt53RandomNumberGenerator
	}

}

+[Integer, @SmallInteger] {

	MersenneTwister { :seed SmallInteger |
		uncheckedMersenneTwister(
			seed,
			seed.mt53RandomNumberGenerator
		)
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
		MersenneTwister(
			system.absoluteTimeInMilliseconds
		)
	}

}
