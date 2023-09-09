+Array {

	sfc32RandomNumberGenerator { :self |
		<primitive: return sl.sfc32Generator(_self[0], _self[1], _self[2], _self[3]);>
	}

}

+String {

	murmur3Generator { :self :seed |
		<primitive: return sl.murmur3Generator(_self, _seed);>
	}

	murmur3 { :self |
		self.murmur3(2166136261)
	}

	murmur3 { :self :seed |
		| generator = self.murmur3Generator(seed); |
		[
			generator.value,
			generator.value,
			generator.value,
			generator.value
		]
	}

}

Sfc32 : [Object, Random] { | next |

	randomFloat { :self |
		self.next.value
	}

}

+String {

	Sfc32 { :self |
		| seed = self.murmur3(2166136261); |
		newSfc32().initializeSlots(seed.sfc32RandomNumberGenerator)
	}

}

+SmallFloat {

	Random { :self |
		self.Sfc32
	}

	Sfc32 { :self |
		self.truncated.asWords.Sfc32
	}

}

+Void {

	Random {
		self.Sfc32
	}

	Sfc32 {
		system.unixTimeInMilliseconds.Sfc32
	}

}
