/* Requires: RandomNumberGenerator Iterator Stream */

Sfc32 : [Object, Equatable, Iterator, RandomNumberGenerator, Stream] { | seed block |

	initialize { :self :anObject |
		self.seed := anObject.asSfc32State;
		self.reset;
		self
	}

	nextRandomFloat { :self |
		self.block.value
	}

	reset { :self |
		self.block := self.seed.sfc32RandomNumberGeneratorBlock
	}

}

+List {

	asSfc32State { :self |
		(self.size = 4).if {
			self
		} {
			'List>>asSfc32State: invalid list'.error
		}
	}

	basicSfc32RandomNumberGenerator { :self |
		<primitive:
		/* https://github.com/bryc/code/blob/master/jshash/PRNGs.md */
		let a = _self[0];
		let b = _self[1];
		let c = _self[2];
		let d = _self[3];
		return function () {
			a |= 0;
			b |= 0;
			c |= 0;
			d |= 0;
			const t = (a + b | 0) + d | 0;
			d = d + 1 | 0;
			a = b ^ b >>> 9;
			b = c + (c << 3) | 0;
			c = c << 21 | c >>> 11;
			c = c + t | 0;
			return (t >>> 0) / 4294967296;
		};
		>
	}

	sfc32RandomNumberGeneratorBlock { :self |
		self.asSfc32State.basicSfc32RandomNumberGenerator
	}

	Sfc32 { :self |
		newSfc32().initialize(self.asSfc32State)
	}

}

+String {

	asSfc32State { :self :seed |
		let generator:/0 = self.murmurHashGenerator(seed);
		[
			generator(),
			generator(),
			generator(),
			generator()
		]
	}

	asSfc32State { :self |
		self.asSfc32State(2166136261)
	}

	Sfc32 { :self |
		Sfc32(self.asSfc32State(2166136261))
	}

}

+@Integer {

	asSfc32State { :self |
		self.truncate.asWords.asSfc32State
	}

	Sfc32 { :self |
		Sfc32(self.asSfc32State)
	}

}

+Void {

	Sfc32 {
		Sfc32(system.absoluteTime.asSfc32State)
	}

}
