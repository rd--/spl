SomRandom : [Object] { | seed |

	next { :self |
		self.seed := ((self.seed * 1309) + 13849).bitAnd(65535)
	}

}

+Void {

	SomRandom {
		newSomRandom().initializeSlots(74755)
	}

}

