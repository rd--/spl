+SmallFloat {

	mt53RandomNumberGenerator { :self |
		<primitive: return sl.mersenneTwister53Generator(_self);>
	}

}

Mersenne : [Object, Random] { | next |

	randomFloat { :self |
		self.next.value
	}

}

+SmallFloat {

	Mersenne { :self |
		newMersenne().initializeSlots(self.mt53RandomNumberGenerator)
	}

}

+Void {

	Mersenne {
		Mersenne(system.unixTimeInMilliseconds)
	}

}
