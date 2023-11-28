+SmallFloat {

	splitMix32RandomNumberGenerator { :self |
		<primitive: return sl.splitMix32Generator(_self);>
	}

}

SplitMix : [Object, Random] { | next |

	randomFloat { :self |
		self.next.value
	}

}

+SmallFloat {

	SplitMix { :self |
		newSplitMix().initializeSlots(self.splitMix32RandomNumberGenerator)
	}

}

+Void {

	SplitMix {
		SplitMix(system.unixTimeInMilliseconds)
	}

}
