/* Requires: RandomNumberGenerator Iterator Stream */

+SmallFloat {

	splitMix32RandomNumberGenerator { :self |
		<primitive:
		let a = _self;
		return function () {
			a |= 0;
			a = a + 0x9e3779b9 | 0;
			let t = a ^ a >>> 15;
			t = Math.imul(t, 0x85ebca6b);
			t = t ^ t >>> 13;
			t = Math.imul(t, 0xc2b2ae35);
			return ((t = t ^ t >>> 16) >>> 0) / 4294967296;
		};
		>
	}

}

SplitMix : [Object, Equatable, Iterator, RandomNumberGenerator, Stream] { | seed block |

	initialize { :self :aNumber |
		self.seed := aNumber;
		self.reset;
		self
	}

	nextRandomFloat { :self |
		self.block.value
	}

	reset { :self |
		self.block := self.seed.splitMix32RandomNumberGenerator
	}

}

+SmallFloat {

	SplitMix { :self |
		newSplitMix().initialize(self)
	}

}

+Void {

	SplitMix {
		SplitMix(system.absoluteTime)
	}

}
